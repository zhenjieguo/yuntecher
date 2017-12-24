Imports System.Data

Partial Class Student
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Bass_Dll As New System_Base
        Dim Re As String = ""
        Re = Bass_Dll.Identify_Check(System.IO.Path.GetFileName(Request.PhysicalPath))

        If Re.Length = 0 Then
            Bass_Dll.Show_User_Name_To_Title(lb_UserName)
            Bass_Dll.Link_Login(lb_Login_Chen, lb_Login_Eng, hy_Backend)

            Dim t As String() = Session("User").Split("/")
            lb_User_Class.Text = t(3)
        Else
            Response.Redirect(Re)
        End If

        If Not IsPostBack Then
            Dim UnSubmit As Integer = 0

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Homework] WHERE (([Student_Group] LIKE '%' + '" & lb_User_Class.Text & "' + '%'))"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            For i = 0 To dv.Count - 1
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                ads.SelectCommand = "SELECT * FROM [Score] WHERE (([User_ID] = '" & Val(Session("User")) & "') And ([Upload] = '" & dv(i)("HW_ID") & "'))"
                Dim dv1 As DataView = ads.Select(New DataSourceSelectArguments)

                If dv1.Count = 0 Then UnSubmit += 1
            Next

            Img_UnSubmit.Visible = False
            Select Case UnSubmit
                Case 0
                    Img_UnSubmit.Visible = False
                Case 1 To 9
                    Img_UnSubmit.ImageUrl = "~/WebImage/NumIcon/" & UnSubmit & ".png"
                    Img_UnSubmit.Visible = True
                Case Is > 9
                    Img_UnSubmit.ImageUrl = "~/WebImage/NumIcon/9+.png"
                    Img_UnSubmit.Visible = True
            End Select
        End If
    End Sub
End Class
