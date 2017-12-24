Imports System.Data

Partial Class Student_Competition
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
            lb_User_ID.Text = t(0)
        Else
            Response.Redirect(Re)
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As DataListItem = CType(EdBT.NamingContainer, DataListItem)
        Dim IDNum As Label = CType(DataList1.Items(myRow.ItemIndex).FindControl("IDNum"), Label)
        Dim t As String() = Session("User").Split("/")

        Group_Member_lb.Text = ""

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
        ads.SelectCommand = "Select * From [Group] Where (Competition_ID = '" & IDNum.Text & "' And [Group_Member] Like '%" & t(1) & "%')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then
            Dim member As String() = dv(0)("Group_Member").ToString.Split(",")
            For i = 0 To UBound(member)
                Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
                ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                ads2.SelectCommand = "Select * From [User] Where (User_Account = '" & member(i) & "')"
                Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)
                If dv2.Count > 0 Then
                    Group_Member_lb.Text &= dv2(0)("User_Name") & "<br/><br/>"
                End If
            Next

            Group_Member_lb.Text = Left(Group_Member_lb.Text, Group_Member_lb.Text.Length - 10)
            Group_Score_lb.Text = dv(0)("Group_CompetitionScore").ToString.Replace(",", "<br/><br/>")
            Group_Time_lb.Text = dv(0)("Group_TotalQuesNum").ToString.Replace(",", "<br/><br/>")
            Group_TotalScore_lb.Text = dv(0)("Group_Score")
            Group_id_lb.Text = dv(0)("Group_ID")


            ads.SelectCommand = "Select * From [Group] Where (Competition_ID = '" & IDNum.Text & "') Order By [Group_Score] DESC"
            dv = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count
                If Group_id_lb.Text = dv(i)("Group_ID") Then
                    Group_NoNum_lb.Text = i + 1
                    Exit For
                End If
            Next
        End If

        Panel_Home.Visible = False
        Panel2.Visible = True
        GroupSort(Val(IDNum.Text))
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        Dim Question_lb As Label = CType(e.Item.FindControl("Question_lb"), Label)

        Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
        ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads2.SelectCommand = "Select * From [Subname] Where (Subname_ID = '" & Question_lb.Text & "')"
        Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)
        Question_lb.Text = dv2(0)("Subname_Name")

    End Sub

    Sub GroupSort(ByVal Competition_ID As Integer)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
        ads.SelectCommand = "Select * From [Group] Where (Competition_ID = '" & Competition_ID & "') Order By [Group_Score] DESC"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then
            If Val(dv(0)("Group_Score")) > 0 Then
                Panel3.Visible = True

                NO1_Member_lb.Text = ""
                Dim member As String() = dv(0)("Group_Member").ToString.Split(",")
                For i = 0 To UBound(member)
                    Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
                    ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                    ads2.SelectCommand = "Select * From [User] Where (User_Account = '" & member(i) & "')"
                    Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)
                    If dv2.Count > 0 Then
                        NO1_Member_lb.Text &= dv2(0)("User_Name") & "<br/>"
                    End If
                Next

                NO1_Score_lb.Text = Val(dv(0)("Group_Score"))
                If Val(dv(1)("Group_Score")) > 0 Then
                    Panel4.Visible = True

                    NO2_Member_lb.Text = ""
                    Dim member_no2 As String() = dv(1)("Group_Member").ToString.Split(",")
                    For i = 0 To UBound(member)
                        Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
                        ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                        ads2.SelectCommand = "Select * From [User] Where (User_Account = '" & member_no2(i) & "')"
                        Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)
                        If dv2.Count > 0 Then
                            NO2_Member_lb.Text &= dv2(0)("User_Name") & "<br/>"
                        End If
                    Next

                    NO2_Score_lb.Text = Val(dv(1)("Group_Score"))
                    If Val(dv(2)("Group_Score")) > 0 Then
                        Panel5.Visible = True

                        NO3_Member_lb.Text = ""
                        Dim member_no3 As String() = dv(2)("Group_Member").ToString.Split(",")
                        For i = 0 To UBound(member)
                            Dim ads2 As New System.Web.UI.WebControls.SqlDataSource
                            ads2.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                            ads2.SelectCommand = "Select * From [User] Where (User_Account = '" & member_no3(i) & "')"
                            Dim dv2 As DataView = ads2.Select(New DataSourceSelectArguments)
                            If dv2.Count > 0 Then
                                NO3_Member_lb.Text &= dv2(0)("User_Name") & "<br/>"
                            End If
                        Next


                        NO3_Score_lb.Text = Val(dv(2)("Group_Score"))
                    End If
                End If
            End If
        End If
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Panel2.Visible = False
        Panel_Home.Visible = True
    End Sub
End Class
