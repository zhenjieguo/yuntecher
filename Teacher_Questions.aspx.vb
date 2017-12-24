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

    Protected Sub bt_QuestionSub_Gridview_Edit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim IDNum As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("IDNum"), Label)

        Response.Redirect("Teacher_Question_Information.aspx?subname=" & IDNum.Text)
    End Sub

    Protected Sub bt_QuestionSub_Gridview_Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim IDNum As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("IDNum"), Label)
        Dim SubnameLB As HyperLink = CType(GridView1.Rows(myRow.RowIndex).FindControl("SubnameLB"), HyperLink)

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
        ads.SelectCommand = "Select * From Homework Where [Subname] = '" & IDNum.Text & "'"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        If dv.Count <> 0 Then
            Dim TeacherIDList As New ArrayList
            For i = 0 To dv.Count - 1
                TeacherIDList.Add(dv(i)("Teacher_ID"))
            Next

            Dim TeacherList As String
            For i = 0 To TeacherIDList.Count - 1
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                ads.SelectCommand = "Select * From [User] Where [User_ID] = '" & TeacherIDList(i) & "'"
                dv = ads.Select(New DataSourceSelectArguments)
                If i = 0 Then
                    TeacherList = dv(0)("User_Name")
                Else
                    TeacherList &= "," & dv(0)("User_Name")
                End If
            Next

            Response.Write("<script> alert('無法刪除,因" & TeacherList & "老師正使用此題庫')</script>")
        Else
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.DeleteCommand = "DELETE FROM [Subname] WHERE [Subname_ID] = '" & IDNum.Text & "'"
            ads.Delete()

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "Select * From Question Where [Question_Subname] = '" & IDNum.Text & "'"
            dv = ads.Select(New DataSourceSelectArguments)
            If dv.Count > 0 Then
                For i = 0 To dv.Count - 1
                    If Not IsDBNull(dv(i)("Question_Picture")) Then
                        If InStr(dv(i)("Question_Picture"), ".") > 0 Then
                            System.IO.File.Delete(MapPath("Question_Pic\" & dv(i)("Question_Picture")))
                        End If
                    End If
                Next
            End If
            ads.DeleteCommand = "Delete From Question Where [Question_Subname] = '" & IDNum.Text & "'"
            ads.Delete()
            GridView1.DataBind()
        End If

    End Sub

    Protected Sub GridView1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.PreRender
        If GridView1.Rows.Count = 0 Then
            nodataLB.Visible = True
        Else
            nodataLB.Visible = False
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim SubnameLB As HyperLink = CType(e.Row.FindControl("SubnameLB"), HyperLink)
            Dim IDNum As Label = CType(e.Row.FindControl("IDNum"), Label)

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "Select [Question_ID] From [Question] Where [Question_Subname] = '" & IDNum.Text & "'"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            SubnameLB.Text &= "(" & dv.Count & ")"

            ads.SelectCommand = "SELECT DISTINCT [Question_Unit], [Question_SubName] FROM [Question] WHERE ([Question_SubName] = '" & IDNum.Text & "') ORDER BY [Question_Unit]"
            dv = ads.Select(New DataSourceSelectArguments)
            If dv.Count > 0 Then
                SubnameLB.NavigateUrl &= "&unit=" & dv(0)("Question_Unit")

                For i = 1 To dv.Count - 1
                    SubnameLB.NavigateUrl &= "-" & dv(i)("Question_Unit")
                Next
            End If



            Dim CH As CheckBox = CType(e.Row.FindControl("PublishCH"), CheckBox)
            Dim IG As Image = CType(e.Row.FindControl("PublishIG"), Image)
            If Not CH.Checked Then IG.ImageUrl = "~/WebImage/Icon_Cross.png"



        End If
    End Sub

    Protected Sub bt_QuestionSub_Insert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_QuestionSub_Insert.Click
        Response.Redirect("Teacher_Question_Information.aspx")
    End Sub
End Class
