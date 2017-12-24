Imports System.Data

Partial Class Teacher_Question_Information_Style
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Bass_Dll As New System_Base
        Dim Re As String = ""
        Re = Bass_Dll.Identify_Check(System.IO.Path.GetFileName(Request.PhysicalPath))

        If Re.Length = 0 Then

            lb_User_ID.Text = Val(Session("User"))
        Else
            Response.Redirect(Re)
        End If
    End Sub

    Protected Sub DropDownList1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.PreRender
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "Select * From [Style] Where [Style_ID] = '" & Val(DropDownList1.SelectedValue) & "'"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        SelectValue.Text = dv(0)("Style_Options")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "Select * From [Style] Where [Style_ID] = '" & Val(DropDownList1.SelectedValue) & "'"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        SelectValue.Text = dv(0)("Style_Options")
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "Select Style_ID From Subname Where (Style_ID='" & DropDownList1.SelectedItem.Value & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then
            Response.Write("<script> alert('有題組正使用此選項，禁止刪除') </script>")
            Exit Sub
        End If

        If DropDownList1.SelectedValue >= 1 And DropDownList1.SelectedValue <= 6 Then
            Response.Write("<script> alert('此為預設選項，禁止刪除') </script>")
            Exit Sub
        End If

        ads.DeleteCommand = "DELETE FROM [Style] WHERE (Style_ID='" & DropDownList1.SelectedItem.Value & "')"
        ads.Delete()
        DropDownList1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If Not (StyleOptionsTB.Text.Length = 0 Or SytleNameTB.Text.Length = 0) Then
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.InsertCommand = "INSERT INTO Style (Style_Name,Style_Options) VALUES ('" & SytleNameTB.Text & "', '" & StyleOptionsTB.Text & "')"
            ads.Insert()
            DropDownList1.DataBind()
            StyleOptionsTB.Text = ""
            SytleNameTB.Text = ""
        Else
            Response.Write("<script> alert('資料不齊全')</script>")
        End If
    End Sub

    Protected Sub SiteMapPath1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles SiteMapPath1.PreRender
        SiteMapPath1.Enabled = False
    End Sub
End Class
