Imports System_Base
Partial Class Indexaspx
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Bass_Dll As New System_Base

        Bass_Dll.Cookid_Login()

        Bass_Dll.Show_User_Name_To_Title(lb_UserName)
        Bass_Dll.Link_Login(lb_Login_Chen, lb_Login_Eng, hy_Backend)

        If CType("2016/9/05 上午 12:00:00", Date) > Now Then Response.Write("<script> alert('新版網站所有的連結都在右上角。\n點選進入後台可以看到更多事務資訊。\n首頁右下角可返回舊版網頁\n\n此訊息將會顯示到2016/09/05')</script>")
    End Sub
End Class
