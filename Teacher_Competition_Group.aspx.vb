Imports System.Data

Partial Class Teacher_Competition_Group
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
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

    Protected Sub GridView3_RowDataBound(sender As Object, e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView3.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.RowState <> DataControlRowState.Edit Then
                Try
                    Dim IDNume_lb As Label = CType(e.Row.FindControl("IDNum_lb"), Label)
                    Dim Member_lb As Label = CType(e.Row.FindControl("Member_lb"), Label)
                    Dim Member As String() = Member_lb.Text.Split(",")
                    Dim t As String = ""

                    IDNume_lb.Text = e.Row.RowIndex + 1

                    For i = 0 To UBound(Member)
                        Dim ads As New System.Web.UI.WebControls.SqlDataSource
                        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                        ads.SelectCommand = "Select User_Name From [User] Where User_Account = '" & Val(Member(i)) & "'"
                        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                        If dv.Count > 0 Then t &= Member(i) & "(" & dv(0)("User_Name") & ")<br/>"
                    Next


                    Member_lb.Text = Left(t, t.Length - 5)
                Catch ex As Exception

                End Try

            End If

        End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim IDNum As Label = CType(GridView3.Rows(myRow.RowIndex).FindControl("IDNum"), Label)

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
        ads.DeleteCommand = "DELETE FROM [Group] WHERE [Group_ID] = '" & IDNum.Text & "'"
        ads.Delete()


        GridView3.DataBind()
    End Sub
End Class
