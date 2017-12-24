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

    Protected Sub bt_CompetitionSub_Insert_Click(sender As Object, e As System.EventArgs) Handles bt_CompetitionSub_Insert.Click
        Response.Redirect("Teacher_Competition_Insert.aspx")
       
    End Sub

    

    Sub Update_Competition_Class(ByVal cmid As Integer)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Group] WHERE Competition_ID = '" & cmid & "'"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        Dim ClassList As New ArrayList
        Dim ClassListSt As String = ""
        If dv.Count > 0 Then
            For i = 0 To dv.Count - 1
                Dim Member As String() = Split(dv(i)("Group_Member"), ",")
                Dim k As Integer

                For j = 0 To UBound(Member)
                    Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
                    ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                    ads2.SelectCommand = "SELECT * FROM [User] WHERE [User_Account] = '" & Member(j) & "'"
                    Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)
                    For k = 0 To ClassList.Count - 1
                        If dv2(0)("User_Group") = ClassList(k) Then
                            Exit For
                        End If
                    Next
                    If k = ClassList.Count Then ClassList.Add(dv2(0)("User_Group"))
                Next
            Next

            ClassList.Sort()
            For i = 0 To ClassList.Count - 1
                ClassListSt &= ClassList(i) & "<br />"
            Next
            ClassListSt = Left(ClassListSt, Len(ClassListSt) - Len("<br />"))

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
            ads.UpdateCommand = "UPDATE [Competition] SET [Competition_People] = '" & ClassListSt & "' WHERE [Competition_ID] = '" & cmid & "'"
            ads.Update()
        End If
    End Sub

    Protected Sub GridView1_DataBound(sender As Object, e As System.EventArgs) Handles GridView1.DataBound
        For i = 0 To GridView1.Rows.Count - 1
            If GridView1.Rows(i).RowType = DataControlRowType.DataRow Then
                Dim id_N As Label = CType(GridView1.Rows(i).FindControl("IDNum"), Label)
                Update_Competition_Class(id_N.Text)
            End If
        Next

    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim IDNum As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("IDNum"), Label)
        Response.Redirect("Teacher_Competition_UserEdit.aspx?cmid=" & IDNum.Text)
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim IDNum As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("IDNum"), Label)
        Response.Redirect("Teacher_Competition_Edit.aspx?hwid=" & IDNum.Text)
    End Sub

    Protected Sub GridView1_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim id_N As Label = CType(e.Row.FindControl("Subname_lb"), Label)

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Subname] WHERE Subname_ID = '" & id_N.Text & "'"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            id_N.Text = dv(0)("Subname_Name")
        End If

    End Sub

    Protected Sub Button3_Click(sender As Object, e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim IDNum As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("IDNum"), Label)

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
        ads.DeleteCommand = "DELETE FROM [Group] WHERE [Competition_ID] = '" & IDNum.Text & "'"
        ads.Delete()

        ads.DeleteCommand = "DELETE FROM [Competition] WHERE [Competition_ID] = '" & IDNum.Text & "'"
        ads.Delete()

        GridView1.DataBind()
    End Sub
End Class
