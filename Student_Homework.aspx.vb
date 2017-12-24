Imports System.Data

Partial Class Student_Homework
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
    End Sub

    Protected Sub bt_Tab_Test_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_Tab_Test.Click
        GridView2.Visible = True
        GridView1.Visible = False
        Label1.Visible = True
        Label2.Visible = False
    End Sub

    Protected Sub bt_Tab_Exercise_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_Tab_Exercise.Click
        GridView1.Visible = True
        GridView2.Visible = False
        Label2.Visible = True
        Label1.Visible = False
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim Subname_lb As HyperLink = CType(e.Row.FindControl("Subname_lb"), HyperLink)
            Dim HWID As Label = CType(e.Row.FindControl("WH_ID"), Label)
            Dim Image1 As Image = CType(e.Row.FindControl("Image1"), Image)

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            ads.SelectCommand = "Select * From [Score] Where ([User_ID] = '" & Val(Session("User")) & "' And [Upload] = '" & HWID.Text & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            If dv.Count <> 0 Then
                Image1.ImageUrl = "~/WebImage/Icon_Check.png"
            Else
                Image1.ImageUrl = "~/WebImage/Icon_Cross.png"
            End If


            Dim Unit As String = Microsoft.VisualBasic.Right(Trim(Subname_lb.Text), 1)
            If Val(Unit) = 0 Then Subname_lb.Text &= "全部"

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "Select * From [Subname] Where ([Subname_ID] = '" & Val(Subname_lb.Text) & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            Subname_lb.Text = dv(0)("Subname_Name") & Mid(Subname_lb.Text, InStr(Subname_lb.Text, " "))
        End If
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim Subname_lb As HyperLink = CType(e.Row.FindControl("Subname_lb"), HyperLink)
            Dim HWID As Label = CType(e.Row.FindControl("WH_ID"), Label)
            Dim Image1 As Image = CType(e.Row.FindControl("Image1"), Image)

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            ads.SelectCommand = "Select * From [Score] Where ([User_ID] = '" & Val(Session("User")) & "' And [Upload] = '" & HWID.Text & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            If dv.Count <> 0 Then
                Image1.ImageUrl = "~/WebImage/Icon_Check.png"
            Else
                Image1.ImageUrl = "~/WebImage/Icon_Cross.png"
            End If


            Dim Unit As String = Microsoft.VisualBasic.Right(Trim(Subname_lb.Text), 1)
            If Val(Unit) = 0 Then Subname_lb.Text &= "全部"

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "Select * From [Subname] Where ([Subname_ID] = '" & Val(Subname_lb.Text) & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            Subname_lb.Text = dv(0)("Subname_Name") & Mid(Subname_lb.Text, InStr(Subname_lb.Text, " "))
        End If
    End Sub
End Class
