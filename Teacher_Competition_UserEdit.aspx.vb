Imports System.Data

Partial Class Teacher_Questions
    Inherits System.Web.UI.Page

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
    End Sub

    Protected Sub Button9_Click(sender As Object, e As System.EventArgs) Handles Button9.Click
        Member_lb.Text = ""
        Dim Group As String() = Group_tb.Text.Split("/")

        For i = 0 To UBound(Group)
            Dim Member As String() = Group(i).Split(",")
            For j = 0 To UBound(Member)
                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString


                Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
                ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
                ads2.SelectCommand = "Select * From [Group] Where (Group_Member Like '%" & Val(Member(j)) & "%' And Competition_ID = '" & Request.QueryString("cmid") & "')"
                Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)

                If dv2.Count = 0 Then
                    ads.SelectCommand = "Select User_Name From [User] Where User_Account = '" & Val(Member(j)) & "'"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                    If dv.Count > 0 Then Member(j) &= "(" & dv(0)("User_Name") & ")"
                End If

            Next

            If Member_lb.Text.Length > 0 Then Member_lb.Text &= "<br /><br />"

            For j = 0 To UBound(Member)
                If Not (InStr(Member_lb.Text, Member(j)) > 0) And (InStr(Member(j), "(") > 0 And InStr(Member(j), ")") > 0) Then
                    If j = 0 Then
                        Member_lb.Text &= "第" & i + 1 & "組："
                        Member_lb.Text &= Member(j) & " "
                    Else
                        Member_lb.Text &= Member(j) & " "
                    End If
                End If


            Next
        Next
    End Sub

    Protected Sub Button7_Click(sender As Object, e As System.EventArgs) Handles Button7.Click
        If Member_lb.Text.Length = 0 Then
            Response.Write("<script> alert('未產生預覽，無法儲存')</script>")
            Exit Sub
        End If

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString


        Dim Group As New ArrayList
        Dim t2 As String = Member_lb.Text
        Do
            If InStr(t2, " <br /><br />") > 0 Then
                Group.Add(Mid(t2, 1, InStr(t2, " <br /><br />") - 1))
            Else
                Group.Add(t2)
                Exit Do
            End If
            t2 = Mid(t2, InStr(t2, "<br /><br />") + 12)
        Loop Until t2.Length = 0

        For i = 0 To Group.Count - 1
            Group(i) = Mid(Group(i), InStr(Group(i), "組：") + 2)

            Dim Member As String() = Group(i).Split(") ")
            Dim t As String = ""
            Dim peopleNum As String = ""
            For j = 0 To UBound(Member) - 1
                t &= Val(Member(j)) & ","
                peopleNum &= 0 & ","
            Next

            ads.InsertCommand = "INSERT INTO [Group] ([Competition_ID], [Group_Member], [Group_CompetitionScore],[Group_TotalQuesNum]) VALUES ('" & Request.QueryString("cmid") & "', '" & Mid(t, 1, t.Length - 1) & "', '" & Left(peopleNum, peopleNum.Length - 1) & "','" & Left(peopleNum, peopleNum.Length - 1) & "')"
            ads.Insert()
        Next

        Response.Redirect("Teacher_Competition.aspx")
    End Sub

    Protected Sub Button8_Click(sender As Object, e As System.EventArgs) Handles Button8.Click
        Response.Redirect("Teacher_Competition.aspx")
    End Sub

End Class
