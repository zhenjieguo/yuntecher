Imports System.Data

Partial Class PasswordChange
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

    Protected Sub bt_ChangePassword_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_ChangePassword.Click
        If tb_Password_Orig.Text.Length = 0 Then
            Response.Write("<script> alert('請輸入舊密碼')</script>")
            tb_Password_Orig.Focus()
            Exit Sub
        ElseIf tb_Password_New.Text.Length = 0 Then
            Response.Write("<script> alert('請輸入新密碼')</script>")
            tb_Password_New.Focus()
            Exit Sub
        ElseIf tb_Password_New_Check.Text = "" Then
            Response.Write("<script> alert('請重複輸入新密碼!!')</script>")
            tb_Password_New_Check.Focus()
        Else
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            ads.SelectCommand = "SELECT * FROM [User] WHERE (([User_ID] = '" & Val(Session("User")) & "'))"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            If tb_Password_Orig.Text = dv(0)("User_Password") Then
                If tb_Password_New.Text = tb_Password_New_Check.Text Then
                    ads.UpdateCommand = "UPDATE [User] SET [User_Password] = '" & tb_Password_New.Text & "' WHERE [User_ID] = '" & Val(Session("User")) & "'"
                    ads.Update()


                    Session("User") = ""
                    Response.Write("<script> alert('密碼變更完成!'); location.href='Login.aspx'; </script>")
                Else
                    Response.Write("<script> alert('新密碼輸入不一!')</script>")
                End If
            Else
                Response.Write("<script> alert('舊密碼輸入錯誤!')</script>")
            End If
        End If
    End Sub
End Class
