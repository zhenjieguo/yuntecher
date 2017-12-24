Imports System.Data

Partial Class Quiz_pc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '================================身分檢測==============================================
        Dim Bass_Dll As New System_Base
        Bass_Dll.Show_User_Name_To_Title(lb_UserName)

        If lb_UserName.Text = "" Then
            lb_UserName.Text = "訪客"
            Button_Recording.Visible = False
            lb_Message.Visible = False
            Image_GoHomework.Visible = False
        ElseIf lb_UserName.Text Like "*同學*" Then
            Button_Recording.Enabled = True
        Else
            Button_Recording.Enabled = False
        End If


        '================================出題==============================================
        If Not IsPostBack Then
            Response.Write("<script> alert('作答完畢不一定代表繳交成績。\n\n若需繳交成績請『先登入』再進行測驗，交卷後點選「紀錄」按鈕，再回學生後台進行繳交成績。') </script>")

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & Request.QueryString("Quizid") & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            If dv.Count > 0 Then
                Page.Title = "測驗-" & dv(0)("Subname_Name") & " |Yuntecher"
                lb_Subname.Text = dv(0)("Subname_Name")

                SqlDataSource1.SelectCommand = "SELECT Top " & Request.QueryString("S") & "* FROM [Question] WHERE ([Question_SubName] = '" & Request.QueryString("Quizid") & "' And [Question_AnsCount] = '1' And [Question_Unit] Like '%" & Request.QueryString("Unit") & "%') ORDER BY NewID()"
                SqlDataSource1.DataBind()
                GridView_Single.DataBind()

                If Val(Request.QueryString("M")) > 0 Then
                    Panel_Mul.Visible = True
                    SqlDataSource2.SelectCommand = "SELECT Top " & Request.QueryString("M") & "* FROM [Question] WHERE ([Question_SubName] = '" & Request.QueryString("Quizid") & "' And [Question_AnsCount] > '1'And [Question_Unit] Like '%" & Request.QueryString("Unit") & "%') ORDER BY NewID()"
                    SqlDataSource2.DataBind()
                    GridView_Mul.DataBind()
                End If
            End If

            Test_Start_lb.Text = Now
        End If
    End Sub

    Sub Quiz_GridView_DataBound(ByRef Gridview_Bound As GridViewRow, ByVal Gridview_name As String)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & Request.QueryString("Quizid") & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        ads.SelectCommand = "SELECT * FROM [Style] WHERE ([Style_ID] = '" & dv(0)("Style_ID") & "')"
        dv = ads.Select(New DataSourceSelectArguments)
        Dim t As String = dv(0)("Style_Options")
        Dim options As String() = Split(t, ",")

        If Gridview_Bound.RowType = DataControlRowType.DataRow Then
            Dim NoLB As Label = CType(Gridview_Bound.FindControl("NoLB"), Label)
            NoLB.Text = Gridview_Bound.RowIndex + 1

            Dim RadioOptions As Object
            If Gridview_name = "Single" Then
                RadioOptions = CType(Gridview_Bound.FindControl("RadioOptions"), RadioButtonList)
            Else
                RadioOptions = CType(Gridview_Bound.FindControl("RadioOptions"), CheckBoxList)
            End If

            RadioOptions.Items.Clear()
            For i = 0 To UBound(options)
                RadioOptions.Items.Add(options(i))
            Next





            Dim QuestionLB As Label = CType(Gridview_Bound.FindControl("QuestionLB"), Label)
            QuestionLB.Text = QuestionLB.Text.Replace("@@@", "'")
            QuestionLB.Text = QuestionLB.Text.Replace(vbCrLf, "<br/>")
            For i = 0 To RadioOptions.Items.Count - 1
                QuestionLB.Text = QuestionLB.Text.Replace("(" & RadioOptions.Items(i).Text & ")", "<br/>(" & RadioOptions.Items(i).Text & ")")
            Next


            Dim Image1 As Image = CType(Gridview_Bound.FindControl("Image1"), Image)
            Dim Label2 As Label = CType(Gridview_Bound.FindControl("Label2"), Label)
            If Label2.Text <> "~/Question_Pic/" Then Image1.Visible = True
        End If
    End Sub

    Protected Sub GridView_Single_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView_Single.RowDataBound
        Quiz_GridView_DataBound(e.Row, "Single")
    End Sub

    Protected Sub GridView_Mul_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView_Mul.RowDataBound
        Quiz_GridView_DataBound(e.Row, "Mul")
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        TextBox1.Visible = True
        Button6.Visible = True
    End Sub

    Protected Sub Button6_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button6.Click
        Dim ads1 As New System.Web.UI.WebControls.SqlDataSource
        ads1.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads1.SelectCommand = "SELECT * FROM [Ans] WHERE ([id] = '1')"
        Dim dv2 As DataView = ads1.Select(New DataSourceSelectArguments)
        If TextBox1.Text = dv2(0)("ps") Then

            For i = 0 To GridView_Single.Rows.Count - 1
                If GridView_Single.Rows(i).RowType = DataControlRowType.DataRow Then
                    Dim QuestionID As Label = CType(GridView_Single.Rows(i).FindControl("QSID"), Label)
                    Dim RadioOptions As RadioButtonList = CType(GridView_Single.Rows(i).FindControl("RadioOptions"), RadioButtonList)

                    Dim ads As New System.Web.UI.WebControls.SqlDataSource
                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
                    ads.SelectCommand = "SELECT Question_Ans FROM [Question] WHERE ([Question_ID] = '" & QuestionID.Text & "')"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                    Dim ans As String = dv(0)("Question_Ans")
                    For j = 0 To RadioOptions.Items.Count - 1
                        If RadioOptions.Items(j).Text = ans Then RadioOptions.Items(j).Selected = True
                    Next
                End If
            Next

            For i = 0 To GridView_Mul.Rows.Count - 1
                If GridView_Mul.Rows(i).RowType = DataControlRowType.DataRow Then
                    Dim QuestionID As Label = CType(GridView_Mul.Rows(i).FindControl("QSID"), Label)
                    Dim RadioOptions As CheckBoxList = CType(GridView_Mul.Rows(i).FindControl("RadioOptions"), CheckBoxList)

                    Dim ads As New System.Web.UI.WebControls.SqlDataSource
                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
                    ads.SelectCommand = "SELECT Question_Ans FROM [Question] WHERE ([Question_ID] = '" & QuestionID.Text & "')"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                    Dim ans As New ArrayList
                    For j = 1 To dv(0)("Question_Ans").ToString.Length
                        ans.Add(Mid(dv(0)("Question_Ans").ToString, j, 1))
                    Next
                    For j = 0 To RadioOptions.Items.Count - 1
                        For k = 0 To ans.Count - 1
                            If RadioOptions.Items(j).Text = ans(k) Then RadioOptions.Items(j).Selected = True
                        Next
                    Next
                End If
            Next

        End If

        TextBox1.Visible = False
        Button6.Visible = False
    End Sub

    Sub Ans_Check(ByRef Quiz_Row As GridViewRow, ByVal Gridview_Name As String, ByVal SingleSorce As Single, ByRef TotalScore As Single, ByRef QueNum As Integer())

        Dim QuestionID As Label = CType(Quiz_Row.FindControl("QSID"), Label)
        Dim Ans As Label = CType(Quiz_Row.FindControl("Ans"), Label)
        Dim RadioOptions As Object
        If Gridview_Name = "Single" Then
            RadioOptions = CType(Quiz_Row.FindControl("RadioOptions"), RadioButtonList)
        Else
            RadioOptions = CType(Quiz_Row.FindControl("RadioOptions"), CheckBoxList)
        End If
        Dim checkbox1 As CheckBox = CType(Quiz_Row.FindControl("CheckBox1"), CheckBox)
        Dim UnitLabel As Label = CType(Quiz_Row.FindControl("UnitLabel"), Label)
        Dim QuestionNumLabel As Label = CType(Quiz_Row.FindControl("QuestionNumLabel"), Label)

        '顯示單元數及題數
        UnitLabel.Visible = True
        QuestionNumLabel.Visible = True


        '查詢題目答案
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT Question_Ans FROM [Question] WHERE ([Question_ID] = '" & QuestionID.Text & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        Ans.Text = dv(0)("Question_Ans")


        Dim User_Ans As String
        Try
            If Gridview_Name = "Single" Then
                User_Ans = RadioOptions.SelectedItem.Text
            Else
                For j = 0 To RadioOptions.Items.Count - 1
                    If RadioOptions.Items(j).Selected Then User_Ans &= RadioOptions.Items(j).Text
                Next
            End If
        Catch ex As Exception

        End Try



        Try
            If User_Ans <> Ans.Text Then
                Ans.Visible = True '錯誤則顯示紅字答案
                TotalScore -= SingleSorce '總分扣除一單位分數
                checkbox1.Checked = True '不熟題目勾選
                QueNum(0) -= 1 '正確率+1
            Else
                QueNum(0) += 1 '正確率-1
            End If
        Catch ex As Exception
            Ans.Visible = True
            TotalScore -= SingleSorce
            checkbox1.Checked = True
            QueNum(0) -= 1
        End Try
    End Sub

    Protected Sub Button_TestEnd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_TestEnd.Click
        Dim Total As Single = Val(Request.QueryString("S")) + Val(Request.QueryString("M"))
        Dim SingleSorce As Single = Math.Round(100 / Total, 1)
        Dim TotalScore As Single = 100
        Dim QueNum As Integer() = New Integer(1) {0, Total}

        TotalTestTime_lb.Text = "測驗總時間：" & CType(DateDiff(DateInterval.Minute, CType(Test_Start_lb.Text, Date), Now), Integer) & "分鐘"

        If Val(Request.QueryString("S")) > 0 Then
            For i = 0 To GridView_Single.Rows.Count - 1
                If GridView_Single.Rows(i).RowType = DataControlRowType.DataRow Then
                    Ans_Check(GridView_Single.Rows(i), "Single", SingleSorce, TotalScore, QueNum)
                End If
            Next
        End If

        If Val(Request.QueryString("M")) > 0 Then
            For i = 0 To GridView_Mul.Rows.Count - 1
                If GridView_Mul.Rows(i).RowType = DataControlRowType.DataRow Then
                    Ans_Check(GridView_Mul.Rows(i), "Mul", SingleSorce, TotalScore, QueNum)
                End If
            Next
        End If


        If TotalScore < 1 Then TotalScore = 0
        Panel2.Visible = True
        Label1.Text = Format(TotalScore, "0.#")
        Button_TestEnd.Enabled = False
        TotalAndRight_lb.Text = QueNum(0) & "/" & QueNum(1)

        If Val(Request.QueryString("Test")) > 0 Then
            Recoring_Score()
        End If
    End Sub

    Sub Recoring_Score()
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        Dim Familiar_Recorded As Boolean = False

        If Val(Mid(TotalTestTime_lb.Text, InStr(TotalTestTime_lb.Text, "：") + 1)) >= 0 Then '查看測驗時間是否大於等於0分鐘
            Dim Total As Single = Val(Request.QueryString("S")) + Val(Request.QueryString("M"))
            Dim Rightrace As Integer = Total - (100 - Val(Label1.Text)) \ Math.Round(100 / Total, 1)

            '=================記錄此次測驗[成績]資訊=============================================
            ads.InsertCommand = "Insert Into Score ([Subname_ID],[Unit],[User_ID],[TestCount],[Rightrace],[Score],[TestDate],[TestTime],[Upload]) Values ('" & Request.QueryString("Quizid") & "','" & Request.QueryString("Unit") & "','" & Val(Session("User")) & "','" & Request.QueryString("S") & "," & Request.QueryString("M") & "','" & Rightrace & "/" & Total & "','" & Val(Label1.Text) & "','" & Test_Start_lb.Text & "','" & Val(Mid(TotalTestTime_lb.Text, InStr(TotalTestTime_lb.Text, "：") + 1)) & "','')"
            ads.Insert()
            ads.SelectCommand = "Select Score_ID From Score Where ([User_ID] = '" & Val(Session("User")) & "' And [TestDate] = '" & Test_Start_lb.Text & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            Dim Score_ID_Recording As Integer = dv(0)("Score_ID")

            '=================記錄此次測驗[不熟]題目=============================================
            For i = 0 To GridView_Single.Rows.Count - 1 '//單選題[不熟]
                If GridView_Single.Rows(i).RowType = DataControlRowType.DataRow Then
                    Recording_Wrong_Question(Score_ID_Recording, GridView_Single.Rows(i), "Single", Familiar_Recorded)
                End If
            Next


            For i = 0 To GridView_Mul.Rows.Count - 1
                If GridView_Mul.Rows(i).RowType = DataControlRowType.DataRow Then
                    Recording_Wrong_Question(Score_ID_Recording, GridView_Mul.Rows(i), "Mul", Familiar_Recorded)
                End If
            Next


            CompeitionScoreRecode() '//紀錄比賽成績

            '=================完成紀錄，遮蔽記錄功能=============================================
            Button_Recording.Enabled = False
            Button_Recording.ImageUrl = "~/WebImage/Icon_Recorded.png"
            lb_Message.Visible = False

            '=================自動上傳[測驗]成績=============================================
            Dim Message_Uploaded As String

            If Val(Request.QueryString("Test")) > 0 Then
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
                ads.SelectCommand = "Select * From [Homework] Where ([HW_ID] = '" & Request.QueryString("Test") & "') "
                dv = ads.Select(New DataSourceSelectArguments)
                Dim Test_Time_Limit As Integer = CType(dv(0)("TestTime"), Integer) '//[測驗限時]取得
                Dim HW_EndDate As Date = CType(dv(0)("Date_End"), Date) '//取得作業截止時間

                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                ads.SelectCommand = "Select * From [Score] Where ([User_ID] = '" & Val(Session("User")) & "') And ([Upload] = '" & Val(Request.QueryString("Test")) & "') Order By [Score_ID] DESC"
                dv = ads.Select(New DataSourceSelectArguments)
                Dim Uploaded As Boolean
                If dv.Count = 0 Then Uploaded = False '//若沒有此次作業成績

                If HW_EndDate >= CType(Test_Start_lb.Text, Date) Then '//表示已超過截止時間

                    If Test_Time_Limit > 0 Then '//表示此項作業為[測驗類別]
                        If Val(Mid(TotalTestTime_lb.Text, InStr(TotalTestTime_lb.Text, "：") + 1)) <= Test_Time_Limit Then '//超過測驗限時
                            ads.UpdateCommand = "UPDATE [Score] SET [Upload] = '" & Val(Request.QueryString("Test")) & "' WHERE ([Score_ID] = '" & Score_ID_Recording & "')"
                            ads.Update()

                            Message_Uploaded = "\n●「測驗成績」已自動上繳"
                        Else
                            Message_Uploaded = "\n●測驗成績因「逾時」無法上繳"
                        End If

                    Else  '//表示此項作業為[練習類別]
                        ads.SelectCommand = "Select * From [Score] Where ([User_ID] = '" & Val(Session("User")) & "') And ([Upload] = '" & Val(Request.QueryString("Test")) & "')"
                        dv = ads.Select(New DataSourceSelectArguments)
                        Dim Old_Score As Single
                        If dv.Count > 0 Then Old_Score = CType(dv(0)("Score"), Single)

                        If Old_Score < Val(Label1.Text) Then '//若已繳交的成績分數較此次低的話....
                            If dv.Count > 0 Then
                                ads.UpdateCommand = "UPDATE [Score] SET [Upload] = '' WHERE ([Score_ID] = '" & dv(0)("Score_ID") & "')"
                                ads.Update()
                            End If
                            ads.UpdateCommand = "UPDATE [Score] SET [Upload] = '" & Val(Request.QueryString("Test")) & "' WHERE ([Score_ID] = '" & Score_ID_Recording & "')"
                            ads.Update()

                            Message_Uploaded = "\n●因成績高於已繳交分數，故「練習作業成績」已自動取代上繳"
                        Else
                            Message_Uploaded = "\n●因成績未高於已繳交分數，故「練習作業成績」無變動"
                        End If
                    End If '//<END IF> 表示此項作業為[測驗類別]

                Else
                    Message_Uploaded = "\n●因已超過截止時間，故「成績」無法上繳"

                End If '//<END IF> 表示已超過截止時間

            End If

            '=============發布提醒訊息=========================
            If Familiar_Recorded Then
                Response.Write("<script> alert('●成績及勾選題目紀錄完成" & Message_Uploaded & "') </script>")
            Else
                Response.Write("<script> alert('●紀錄成績已完成" & Message_Uploaded & "') </script>")
            End If



        Else
            Response.Write("<script> alert('無法取得測驗總時間，記錄失敗') </script>")
        End If
    End Sub

    Sub Recording_Wrong_Question(ByVal Score_ID As Integer, ByRef CheckRow As GridViewRow, ByVal Gridvied_Name As String, ByRef Familiar_Recorded As Boolean)
        Dim QuestionID As Label = CType(CheckRow.FindControl("QSID"), Label)
        Dim Familiar As CheckBox = CType(CheckRow.FindControl("CheckBox1"), CheckBox)
        Dim UserAns_List As Object
        If Gridvied_Name = "Single" Then
            UserAns_List = CType(CheckRow.FindControl("RadioOptions"), RadioButtonList)
        Else
            UserAns_List = CType(CheckRow.FindControl("RadioOptions"), CheckBoxList)
        End If


        If Familiar.Checked Then  '//若是[不熟]核取勾選
            Dim UserAns As String = ""

            Try
                If Gridvied_Name = "Single" Then '//單選的使用者答題情況

                    UserAns = UserAns_List.SelectedItem.Text

                Else '//複選的使用者答題情況
                    For j = 0 To UserAns_List.Items.Count - 1
                        If UserAns_List.Items(j).Selected Then UserAns &= UserAns_List.Items(j).Text
                    Next
                End If

            Catch ex As Exception
                UserAns = ""
            End Try


            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            ads.InsertCommand = "Insert Into Wrong ([Score_ID],[Question_ID],[Wrong_Ans]) Values ('" & Score_ID & "','" & QuestionID.Text & "','" & UserAns & "')"
            ads.Insert()

            If Familiar_Recorded = False Then Familiar_Recorded = True
        End If
    End Sub


    Sub CompeitionScoreRecode() '////// 2016-06-23重新整理程式碼時未檢查此段
        Dim t As String() = Session("User").Split("/")
        Dim RecordScore As String() = TotalAndRight_lb.Text.Split("/")
        Dim StudentNum As String = Val(t(1))

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Group] WHERE ([Group_Member] like '%" & StudentNum & "%')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        For i = 0 To dv.Count - 1
            ads.SelectCommand = "SELECT * FROM [Competition] WHERE ([Competition_ID] = '" & Val(dv(i)("Competition_ID")) & "')"
            Dim dv2 As DataView = ads.Select(New DataSourceSelectArguments)

            If CType(Test_Start_lb.Text, Date) <= dv2(0)("Competition_EndTime") And (dv2(0)("Question_SubnameID") = Request.QueryString("Quizid") And dv2(0)("Question_Unit") = Request.QueryString("Unit")) Then
                Dim member As String() = dv(i)("Group_Member").ToString.Split(",")
                Dim score As String() = dv(i)("Group_CompetitionScore").ToString.Split(",")
                Dim score_tx, QuesNum_tx As String
                Dim QuesNumAs As String() = dv(i)("Group_TotalQuesNum").ToString.Split(",")

                For j = 0 To UBound(member)
                    If member(j) = t(1) Then
                        score(j) = Val(score(j)) + Val(RecordScore(0))
                        QuesNumAs(j) = Val(QuesNumAs(j)) + Val(RecordScore(1))
                        Exit For
                    End If
                Next


                Dim totolScore As Single = 0
                Dim max, min As Integer
                min = 1000000
                For j = 0 To UBound(member)
                    totolScore += Val(score(j))
                    If max < Val(QuesNumAs(j)) Then
                        max = Val(QuesNumAs(j))
                    ElseIf min > Val(QuesNumAs(j)) Then
                        min = Val(QuesNumAs(j))
                    End If

                    score_tx &= score(j) & ","
                    QuesNum_tx &= QuesNumAs(j) & ","
                Next

                totolScore = (totolScore / (UBound(member) + 1)) - ((max - min) * (0.1 * Val(UBound(member) + 1)))

                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Competition").ConnectionString
                ads.UpdateCommand = "UPDATE [Group] SET [Group_CompetitionScore] = '" & Left(score_tx, score_tx.Length - 1) & "',[Group_TotalQuesNum] = '" & Left(QuesNum_tx, QuesNum_tx.Length - 1) & "',[Group_Score] = '" & Format(Val(totolScore), "#.#") & "' Where [Group_ID] = '" & dv(i)("Group_ID") & "'"
                ads.Update()
            End If

        Next

    End Sub

    Protected Sub Button_Recording_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles Button_Recording.Click
        Recoring_Score()
    End Sub
End Class
