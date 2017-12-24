Imports System.Data

Partial Class Teacher_Homework_Score
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

        Try
            If Val(Request.QueryString("Homeworkid")) = 0 Then Response.Redirect("Teacher_Homework.aspx")
        Catch ex As Exception
            Response.Redirect("Teacher_Homework.aspx")
        End Try
        
        If Not IsPostBack Then
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            ads.SelectCommand = "SELECT * FROM [User] WHERE ([User_Style] = '學生') ORDER BY [User_Account]"
            Dim dv0 As DataView = ads.Select(New DataSourceSelectArguments)

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Homework] WHERE [HW_ID] = '" & Request.QueryString("Homeworkid") & "'"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            Dim Group As String = dv(0)("Student_Group")


            For i = dv0.Count - 1 To 0 Step -1
                Dim classlabel As String = dv0(i)("User_Group")
                Dim Userid As String = dv0(i)("User_ID")

                If Not (Group Like "*" & classlabel & "*") Then
                    dv0(i).Delete()
                Else
                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                    ads.SelectCommand = "SELECT * FROM [Score] WHERE ([Upload] = '" & Request.QueryString("Homeworkid") & "')"
                    dv = ads.Select(New DataSourceSelectArguments)

                    Dim Uploaded As New ArrayList
                    For j = 0 To dv.Count - 1
                        Uploaded.Add(dv(j)("User_ID"))
                    Next


                End If
            Next

            GridView2.DataSource = dv0
            GridView2.DataBind()
        End If
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs)
        Dim EdBT As ImageButton = CType(sender, ImageButton)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim scoreid As Label = CType(GridView2.Rows(myRow.RowIndex).FindControl("Scoreid"), Label)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.UpdateCommand = "Update Score Set [Upload] = '' Where [Score_ID] = '" & scoreid.Text & "'"
        ads.Update()
        GridView2.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Teacher_Homework_Lack.aspx?Homeworkid=" & Request.QueryString("Homeworkid"))
    End Sub

    Protected Sub GridView2_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.PreRender
        nodataLB.Visible = (GridView2.Rows.Count = 0)
        Button1.Visible = Not (GridView2.Rows.Count = 0)
        Button1.Visible = Not (GridView2.Rows.Count = 0)
    End Sub

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim User_ID As Label = CType(e.Row.FindControl("lb_UserID"), Label)

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Score] WHERE ([User_ID] = '" & User_ID.Text & "' And [Upload] = '" & Request.QueryString("Homeworkid") & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            If dv.Count > 0 Then
                Dim ScoreLB As Label = CType(e.Row.FindControl("lb_Score"), Label)
                Dim TestTimeLB As Label = CType(e.Row.FindControl("lb_TestTime"), Label)
                Dim Score_ID_LB As Label = CType(e.Row.FindControl("Scoreid"), Label)
                ScoreLB.Text = dv(0)("Score")
                TestTimeLB.Text = dv(0)("TestDate") & "<br/>(測驗" & dv(0)("TestTime") & "分鐘)"
                Score_ID_LB.Text = dv(0)("Score_ID")
            Else
                Dim ImageButton1 As ImageButton = CType(e.Row.FindControl("ImageButton1"), ImageButton)
                ImageButton1.Visible = False
            End If
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Response.Redirect("Teacher_StatisticsWrong.aspx?Homeworkid=" & Request.QueryString("Homeworkid"))
    End Sub
End Class
