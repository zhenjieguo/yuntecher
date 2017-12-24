Imports System.Data

Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            If Session("User") <> "" Then
                Session("User") = ""
                Response.Redirect("Index.aspx")
            End If
        Catch ex As Exception

        End Try

        If Not IsPostBack Then
            Try
                lb_Histroy.Text = Mid(Request.UrlReferrer.AbsoluteUri, InStrRev(Request.UrlReferrer.AbsoluteUri, "/") + 1)
            Catch ex As Exception
                lb_Histroy.Text = "Index.aspx"
            End Try
            If Session("Loginfall") = True Then Panel_Check.Visible = True
        End If
    End Sub

    Protected Sub bt_Login_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_Login.Click
        If tb_Account.Text.Length = 0 Then
            Response.Write("<script> alert('請輸入帳號')</script>")
            tb_Account.Focus()
            Exit Sub
        ElseIf tb_Password.Text.Length = 0 Then
            Response.Write("<script> alert('請輸入密碼')</script>")
            tb_Password.Focus()
            Exit Sub
        End If

        Dim pd As String = tb_Password.Text

        If Panel_Check.Visible Then '//登入失敗，需輸入驗證碼
            If tb_Check.Text = "" Then
                Response.Write("<script> alert('請輸入驗證碼!!')</script>")
                tb_Check.Focus()
                Exit Sub
            ElseIf Session("CheckCode") <> tb_Check.Text Then
                Response.Write("<script> alert('驗證碼錯誤!!')</script>")
                tb_Password.Attributes("value") = pd
                tb_Check.Text = ""
                tb_Check.Focus()
                Exit Sub
            End If
        End If


        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "SELECT * FROM [User] WHERE (([User_Account] = '" & tb_Account.Text & "') AND ([User_Password] = '" & tb_Password.Text & "'))"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)



        If dv.Count = 0 Then
            Session("Loginfall") = True
            Response.Write("<script> alert('帳號或密碼輸入錯誤'); location.href='Login.aspx'; </script>")
        Else
            Session("Loginfall") = False
            Session("User") = dv(0)("User_ID") & "/" & dv(0)("User_Account") & "/" & dv(0)("User_Style") & "/" & dv(0)("User_Group") & "/" & dv(0)("User_Name")
            Dim t As String() = Session("User").Split("/")

            If ckb_Remeberme.Checked Then '//點選[記住我])

                Response.Cookies("OnlineTest").Value = tb_Account.Text & "," & tb_Password.Text
                Response.Cookies("OnlineTest").Expires = DateTime.Now.AddDays(7)

            End If


            Select Case t(2)
                Case "系統管理員"
                    Session("User") &= "管理員"
                Case "教職員工"
                    Session("User") &= "老師"
                Case Else
                    Session("User") &= "同學"
            End Select


            Response.Redirect("Index.aspx")
        End If


    End Sub

End Class
