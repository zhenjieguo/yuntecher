Imports Microsoft.VisualBasic
Imports System.Data

Public Class System_Base

    Sub Show_User_Name_To_Title(ByRef lb_UserName As Label) '//取得目前的使用者稱呼，並顯示在網頁標題
        Try
            lb_UserName.Text = Mid(HttpContext.Current.Session("User"), InStrRev(HttpContext.Current.Session("User"), "/") + 1)
        Catch ex As Exception
            lb_UserName.Text = "使用者"
        End Try
    End Sub

    Public Sub Link_Login(ByRef lb_Login_Chen As Label, ByRef lb_Login_Eng As Label, ByRef hy_Backend As HyperLink) '//變動與登入有關的所有連結[登入/登出] [後台連結]
        Try
            If HttpContext.Current.Session("User").ToString.Length > 0 Then
                lb_Login_Chen.Text = "登出"
                lb_Login_Eng.Text = "Logout"
                Dim t As String() = HttpContext.Current.Session("User").ToString.Split("/")

                Select Case t(2)
                    Case "系統管理員"
                        hy_Backend.NavigateUrl = "Admin_AdCount.aspx"
                    Case "教職員工"
                        hy_Backend.NavigateUrl = "Teacher.aspx"
                    Case "學生"
                        hy_Backend.NavigateUrl = "Student.aspx"
                End Select
            Else
                lb_Login_Chen.Text = "登入"
                lb_Login_Eng.Text = "Login"
                hy_Backend.NavigateUrl = "Login.aspx"
            End If
        Catch ex As Exception
            lb_Login_Chen.Text = "登入"
            lb_Login_Eng.Text = "Login"
            hy_Backend.NavigateUrl = "Login.aspx"
        End Try
    End Sub

    Function Identify_Check(ByVal Current_Path As String) As String '//取得目前的使用者類型，並做網頁權限檢查，並傳回須轉跳的網頁名稱
        Cookid_Login()

        Identify_Check = ""
        Try
            If HttpContext.Current.Session("User").ToString.Length > 0 Then
                Dim t As String() = HttpContext.Current.Session("User").ToString.Split("/")
                Current_Path = LCase(Current_Path)

                If (Current_Path Like "admin*.aspx" And t(2) <> "系統管理員") Or (Current_Path Like "teacher*.aspx" And t(2) <> "教職員工") Or (Current_Path Like "student*.aspx" And t(2) <> "學生") Then
                    Select Case t(2)
                        Case "系統管理員"
                            Identify_Check = "Admin_AdCount.aspx.aspx"
                        Case "教職員工"
                            Identify_Check = "Teacher.aspx"
                        Case "學生"
                            Identify_Check = "Student.aspx"
                    End Select
                End If

            Else '//未登入過
                If Current_Path <> "Index.aspx" Or Current_Path <> "About.aspx" Then
                    Identify_Check = "Login.aspx"
                End If
            End If
        Catch ex As Exception
            Identify_Check = "Login.aspx"
        End Try

    End Function

    Sub Cookid_Login()
        Try

            If HttpContext.Current.Request.Cookies("OnlineTest").Value = vbNull Or HttpContext.Current.Request.Cookies("OnlineTest").Value Then
                Dim t As String() = HttpContext.Current.Request.Cookies("OnlineTest").Value.Split(",")

                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                ads.SelectCommand = "SELECT * FROM [User] WHERE (([User_Account] = '" & t(0) & "') AND ([User_Password] = '" & t(1) & "'))"
                Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

                HttpContext.Current.Session("User") = dv(0)("User_ID") & "/" & dv(0)("User_Account") & "/" & dv(0)("User_Style") & "/" & dv(0)("User_Group") & "/" & dv(0)("User_Name")

            End If

        Catch ex As Exception

        End Try
    End Sub


End Class
