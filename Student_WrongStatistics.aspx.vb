Imports System.Data

Partial Class Student_WrongStatistics
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

    Protected Sub Drop_Question_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles Drop_Question.DataBound
        Dim a As New ArrayList
        For i = 0 To Drop_Question.Items.Count - 1
            If Not (a.IndexOf(Drop_Question.Items(i).Text) > -1) Then a.Add(Drop_Question.Items(i).Text)
        Next

        Drop_Question.Items.Clear()
        For i = 0 To a.Count - 1
            Drop_Question.Items.Add(a(i))
            Drop_Question.Items(i).Value = a(i)
        Next


        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        For i = 0 To Drop_Question.Items.Count - 1
            ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & Drop_Question.Items(i).Value & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            Drop_Question.Items(i).Text = dv(0)("Subname_Name")
        Next

        Drop_Question_SelectedIndexChanged(Nothing, Nothing)

    End Sub

    Protected Sub Drop_Question_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Drop_Question.SelectedIndexChanged
        Dim ads As New System.Web.UI.WebControls.SqlDataSource

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.DeleteCommand = "DELETE FROM [Statistics] WHERE [User_ID] = '" & lb_User_ID.Text & "'"
        ads.Delete()

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Score] WHERE ([Subname_ID] = '" & Drop_Question.SelectedValue & "' And [User_ID] = '" & lb_User_ID.Text & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        Dim ScoreID As String
        Dim t As New ArrayList
        For i = 0 To dv.Count - 1
            If Val(dv(i)("Score")) < 100 Then t.Add("[Score_ID]='" & dv(i)("Score_ID") & "'")
        Next
        ScoreID = t(0)
        For i = 1 To t.Count - 1
            ScoreID &= " OR " & t(i)
        Next

        If ScoreID.Length > 0 Then
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Wrong] WHERE (" & ScoreID & ") Order BY [Question_ID]"
            Dim dv2 As DataView = ads.Select(New DataSourceSelectArguments)

            If dv2.Count > 0 Then
                Dim Wrong_QuestionID As New ArrayList
                Dim Wrong_Time As New ArrayList
                For i = 0 To dv2.Count - 1
                    If Wrong_QuestionID.Count > 0 Then
                        If Wrong_QuestionID(Wrong_QuestionID.Count - 1) = dv2(i)("Question_ID") Then
                            Wrong_Time(Wrong_QuestionID.Count - 1) += 1
                        Else
                            Wrong_QuestionID.Add(dv2(i)("Question_ID"))
                            Wrong_Time.Add(1)
                        End If
                    Else
                        Wrong_QuestionID.Add(dv2(i)("Question_ID"))
                        Wrong_Time.Add(1)
                    End If
                Next
                ScoreID = ""
                t.Clear()
                For i = 0 To Wrong_QuestionID.Count - 1
                    t.Add("[Question_ID]='" & Wrong_QuestionID(i) & "'")
                Next
                ScoreID = t(0)
                For i = 1 To t.Count - 1
                    ScoreID &= " OR " & t(i)
                Next

                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
                ads.SelectCommand = "SELECT * FROM [Question] WHERE (" & ScoreID & ") "
                Dim dv3 As DataView = ads.Select(New DataSourceSelectArguments)
                For i = 0 To dv3.Count - 1
                    Dim WTime As Integer
                    For j = 0 To Wrong_QuestionID.Count - 1
                        If Wrong_QuestionID(j) = dv3(i)("Question_ID") Then
                            WTime = Wrong_Time(j)
                            Exit For
                        End If
                    Next


                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString

                    ads.InsertCommand = "INSERT INTO [Statistics] ([WrongTime],[QuestionStyle],[QuestionNum],[QuestionAns],[QuestionQuestion],[QuestionPic],[User_ID]) Values ('" & WTime & "','" & dv3(i)("Question_AnsCount") & "','" & dv3(i)("Question_Unit") & "-" & dv3(i)("Question_Remark") & "','" & dv3(i)("Question_Ans") & "','" & dv3(i)("Question_Question") & "','" & dv3(i)("Question_Picture") & "','" & lb_User_ID.Text & "')"
                    ads.Insert()
                Next


                DataList1.DataBind()
            End If
        End If
    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        Dim LB_AnsCount As Label = CType(e.Item.FindControl("LB_AnsCount"), Label)
        If Val(LB_AnsCount.Text) = 1 Then
            LB_AnsCount.Text = "單選"
        Else
            LB_AnsCount.Text = "複選"
        End If

        Dim LB_Question As Label = CType(e.Item.FindControl("LB_Question"), Label)

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & Drop_Question.SelectedValue & "') "
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        ads.SelectCommand = "SELECT * FROM [Style] WHERE ([Style_ID] = '" & dv(0)("Style_ID") & "') "
        dv = ads.Select(New DataSourceSelectArguments)

        Dim QsTemp As String() = dv(0)("Style_Options").ToString.Split(",")
        For j = 0 To UBound(QsTemp)
            LB_Question.Text = LB_Question.Text.Replace("(" & QsTemp(j) & ")", "<br/>(" & QsTemp(j) & ")")
        Next

        Dim Label_No As Label = CType(e.Item.FindControl("Label_No"), Label)
        Label_No.Text = e.Item.ItemIndex + 1

        Dim QuestionAnsLabel As Label = CType(e.Item.FindControl("QuestionAnsLabel"), Label)
        Dim t As String = Mid(QuestionAnsLabel.Text, 1, 1)
        For i = 2 To Len(QuestionAnsLabel.Text)
            t &= "," & Mid(QuestionAnsLabel.Text, i, 1)
        Next
        QuestionAnsLabel.Text = t

        Dim img As Image = CType(e.Item.FindControl("Image1"), Image)
        If img.ImageUrl = "~/Question_Pic/" Then img.Visible = False
    End Sub
End Class
