Imports System.Data

Partial Class Teacher_Questions
    Inherits System.Web.UI.Page
    Protected Sub Drop_Month_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Drop_Month.SelectedIndexChanged
        Select Case Drop_Month.SelectedItem.Text
            Case 1, 3, 5, 7, 8, 10, 12
                Drop_Day.Items.Clear()
                For i = 1 To 31
                    Drop_Day.Items.Add(i)
                Next
            Case Else
                Drop_Day.Items.Clear()
                For i = 1 To 30
                    Drop_Day.Items.Add(i)
                Next
        End Select
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Bass_Dll As New System_Base
        Dim Re As String = ""
        Re = Bass_Dll.Identify_Check(System.IO.Path.GetFileName(Request.PhysicalPath))

        If Re.Length = 0 Then
            Bass_Dll.Show_User_Name_To_Title(lb_UserName)
            Bass_Dll.Link_Login(lb_Login_Chen, lb_Login_Eng, hy_Backend)

            lb_User_ID.Text = Val(Session("User"))
        Else
            Response.Redirect(Re)
        End If



        If Not IsPostBack Then
            Drop_Year.Items.Clear()
            For i = Now.Year To Now.Year + 5
                Drop_Year.Items.Add(i)
            Next
            Drop_Month_SelectedIndexChanged(Nothing, Nothing)
            Drop_Month.SelectedIndex = Val(Now.Month) - 1
            Drop_Day.SelectedIndex = Val(Now.Day) - 1

            For i = 0 To 60
                Drop_Min.Items.Add(Format(Val(i), "00"))
            Next


            Drop_Question.DataBind()
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
            ads.SelectCommand = "Select * From [Competition] Where Competition_ID = '" & Request.QueryString("Hwid") & "'"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            Drop_Question.Visible = False
            For i = 0 To Drop_Question.Items.Count - 1
                If Drop_Question.Items(i).Value = dv(0)("Question_SubnameID") Then
                    Question_lb.Text = Drop_Question.Items(i).Text
                    Exit For
                End If
            Next

            Question_lb.Text &= " 單元" & Val(dv(0)("Question_Unit"))

            Question_lb.Visible = True

            Drop_Year.SelectedIndex = Val(dv(0)("Competition_EndTime")) - Now.Year
            Drop_Month.SelectedIndex = Val(Mid(dv(0)("Competition_EndTime"), InStr(dv(0)("Competition_EndTime"), "/") + 1)) - 1
            Drop_Day.SelectedIndex = Val(Mid(dv(0)("Competition_EndTime"), InStrRev(dv(0)("Competition_EndTime"), "/") + 1)) - 1
            If Mid(dv(0)("Competition_EndTime"), InStr(dv(0)("Competition_EndTime"), " ") + 1, 2) = "上午" Then
                Drop_AMPM.SelectedIndex = 0
            Else
                Drop_AMPM.SelectedIndex = 1
            End If
            Drop_Hors.SelectedIndex = Val(Mid(dv(0)("Competition_EndTime"), InStrRev(dv(0)("Competition_EndTime"), " ") + 1)) - 1
            Drop_Min.SelectedIndex = Val(Mid(dv(0)("Competition_EndTime"), InStr(dv(0)("Competition_EndTime"), ":") + 1)) - 1
            TextBox1.Text = dv(0)("Competition_Note").ToString.Replace("<br />", vbCrLf)

            Button3.Text = "修改"
        End If

    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        StopTime.Text = Drop_Year.SelectedItem.Text & "/" & Drop_Month.SelectedItem.Text & "/" & Drop_Day.SelectedItem.Text
        Dim Stopoftime As Date = CType(StopTime.Text & " " & Drop_AMPM.SelectedItem.Text & Drop_Hors.SelectedItem.Text & ":" & Drop_Min.SelectedItem.Text, Date)
        If Stopoftime < Now Then
            Response.Write("<script> alert('時間已經超過了')</script>")
            Exit Sub
        End If

        StopTime.Text = Drop_Year.SelectedValue & "/" & Drop_Month.SelectedValue & "/" & Drop_Day.SelectedValue & " " & Drop_AMPM.SelectedValue & " " & Drop_Hors.SelectedValue & ":" & Drop_Min.SelectedValue & ":00"
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString

        
        ads.UpdateCommand = "Update Competition Set [Competition_EndTime] = '" & StopTime.Text & "',[Competition_Note] = '" & TextBox1.Text.Replace(vbCrLf, "<br />") & "' WHERE [Competition_ID] = '" & Request.QueryString("hwid") & "'"
        ads.Update()
        Response.Write("<script> alert('比賽修改成功');location.href='Teacher_Competition.aspx';</script>")

    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
        Response.Redirect("Teacher_Competition.aspx")
    End Sub
End Class
