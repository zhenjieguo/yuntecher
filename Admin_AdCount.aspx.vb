Imports System.Data

Partial Class Admin_AdCount
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Panel_Close()
        Panel1.Visible = True
    End Sub

    Protected Sub TC_regist_Click(sender As Object, e As System.EventArgs) Handles TC_regist.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "Select * from [User] where User_Account = '" & TCA.Text & "'"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If TCA.Text = "" Or TCP.Text = "" Or TCN.Text = "" Then
            Response.Write("<script> alert('請完整輸入。')</script>")
        Else
            If dv.Count = 0 Then
                ads.InsertCommand = "Insert into [User] ([User_Account], [User_Password], [User_style], [User_Group] , [User_Name]) Values ('" & TCA.Text & "','" & TCP.Text & "','教職員工', '無' , '" & TCN.Text & "')"
                ads.Insert()
                TCA.Text = ""
                TCP.Text = ""
                TCN.Text = ""
                Response.Write("<script> alert('教師資料建檔完成。')</script>")
            Else
                Response.Write("<script> alert('帳號已重複。')</script>")
                TCA.Focus()
            End If
        End If
    End Sub

    
    Protected Sub ST_regist_Click(sender As Object, e As System.EventArgs) Handles ST_regist.Click
        If StudentUpload.PostedFile.ContentLength = 0 Then Exit Sub
        Dim FileName() = StudentUpload.FileName.Split(".")
        Dim StuFile As String = FileName(FileName.Count - 1) '取得文件上傳副檔名
        Dim StuFileName As String = FileName(FileName.Count - 2)
        If StuFile <> "txt" Then
            Response.Write("<script> alert('檔案僅支援「TXT文件檔」，請重新上傳。')</script>")
        Else
            StudentUpload.SaveAs(MapPath("Temporarily/Student.txt"))
            Dim data As New ArrayList
            If System.IO.File.Exists(MapPath("Temporarily/Student.txt")) Then
                FileOpen(1, MapPath("Temporarily/Student.txt"), OpenMode.Input, OpenAccess.Read)
                Dim t As String = ""
                Dim line As String
                Do While Not EOF(1)
                    line = LineInput(1)
                    If line <> "" Then
                        If IsNumeric(Mid(line, 1, 1)) Then
                            t = line
                            data.Add(t.Split(vbTab))
                        End If
                    End If
                Loop
                FileClose(1)
                System.IO.File.Delete(MapPath("Temporarily/Student1.txt"))
            End If
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            Dim Account, Password, Style, Group, Studentname As String
            Style = "學生"
            Dim g1, g2 As String


            For i = 0 To data.Count - 1
                Dim yearnum As Integer = Val(Now.Year) - 1911
                For j = yearnum To yearnum - 5 Step -1
                    Dim a As String = Mid(j.ToString, Len(j.ToString), 1)
                    Dim b As String = Mid(data(i)(0), 1, 1)
                    If a = b Then
                        g1 = j
                    End If
                Next


                g2 = Mid(data(i)(0), 4, 1)
                Select Case Mid(data(i)(0), 3, 1)
                    Case 1
                        Group = g1 & "商" & g2
                    Case 2
                        Group = g1 & "國" & g2
                    Case 3
                        Group = g1 & "會" & g2
                    Case 4
                        Group = g1 & "資" & g2
                    Case 5
                        Group = g1 & "綜" & g2
                    Case 6
                        Group = g1 & "高" & g2
                End Select
                Account = data(i)(0)
                Password = data(i)(1)
                Studentname = data(i)(2)
                ads.InsertCommand = "Insert into [User] ([User_Account], [User_Password], [User_Style],[User_Group],[User_Name]) Values ('" & Account & "', '" & Password & "','" & Style & "','" & Group & "','" & Studentname & "')"
                ads.Insert()
                'ads.SelectCommand = "Select * from [group] where group_Name ='" & Group & "'"
                'Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                'If dv.Count = 0 Then
                'ads.InsertCommand = "Insert into [Group] ([Group_Name]) Values ('" & Group & "')"
                'ads.Insert()
                'End If
            Next

            Response.Write("<script> alert('恭喜，學生資料建檔完成。')</script>")
        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs) Handles Button2.Click
        Panel_Close()
        Panel2.Visible = True
    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs) Handles Button3.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        Dim teacherID As String = DropDownList3.SelectedValue
        Dim SGroup As String = DropDownList4.SelectedValue
        Dim dv As DataView
        ads.SelectCommand = "Select * from [Group] where Group_Name = '" & SGroup & "' and Group_TeacherID = '" & teacherID & "'"
        dv = ads.Select(New DataSourceSelectArguments)
        If dv.Count = 0 Then
            ads.InsertCommand = "Insert into [Group] ([Group_Name] ,[Group_TeacherID] ,[Group_TeacherName]) values ('" & SGroup & "','" & teacherID & "' ,'" & DropDownList3.SelectedItem.Text & "')"
            ads.Insert()
            Response.Write("<script> alert('繼承完成。')</script>")
        Else
            Response.Write("<script> alert('該班級已隸屬於老師名單之下。')</script>")
        End If

        DropDownList5.DataBind()
        DropDownList6.DataBind()
    End Sub

    Protected Sub Button4_Click(sender As Object, e As System.EventArgs) Handles Button4.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Group] WHERE ([Group_Name] = '" & DropDownList6.SelectedValue & "' And [Group_TeacherID] = '" & DropDownList5.SelectedValue & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then
            ads.DeleteCommand = "DELETE FROM [Group] WHERE  ([Group_Name] = '" & DropDownList6.SelectedValue & "' And [Group_TeacherID] = '" & DropDownList5.SelectedValue & "')"
            ads.Delete()
            DropDownList5.DataBind()
            DropDownList6.DataBind()
            Response.Write("<script> alert('已刪除此筆關係。')</script>")
        Else
            Response.Write("<script> alert('此操作發生錯誤。')</script>")
        End If
    End Sub

    Sub Panel_Close()
        Panel1.Visible = False
        Panel2.Visible = False
        Panel3.Visible = False
    End Sub

    Protected Sub Button5_Click(sender As Object, e As System.EventArgs) Handles Button5.Click
        Panel_Close()
        Panel3.Visible = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim Bass_Dll As New System_Base
        Dim Re As String = ""
        Re = Bass_Dll.Identify_Check(System.IO.Path.GetFileName(Request.PhysicalPath))

        If Re.Length = 0 Then
            Bass_Dll.Show_User_Name_To_Title(lb_UserName)
            Bass_Dll.Link_Login(lb_Login_Chen, lb_Login_Eng, hy_Backend)
        Else
            Response.Redirect(Re)
        End If
    End Sub
End Class
