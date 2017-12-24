Imports System.Data

Partial Class Quiz_mobile
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '================================身分檢測==============================================
        Dim Bass_Dll As New System_Base
        Bass_Dll.Show_User_Name_To_Title(lb_UserName)

        If lb_UserName.Text = "" Then
            lb_UserName.Text = "訪客"
            Button2.Visible = False
            lb_Message.Visible = False
            Image_GoHomework.Visible = False
        ElseIf lb_UserName.Text Like "*同學*" Then
            Button2.Enabled = True
        Else
            Button2.Enabled = False
        End If

        Try
            If Not IsPostBack Then
                Response.Write("<script> alert('作答完畢不一定代表繳交成績。\n\n若需繳交成績請『先登入』再進行測驗，交卷後點選「紀錄」按鈕，再回學生後台進行繳交成績。') </script>")

                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
                ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & Request.QueryString("Quizid") & "')"
                Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

                If dv.Count > 0 Then
                    Page.Title = "測驗-" & dv(0)("Subname_Name") & "Yuntecher"
                    lb_Subname.Text = dv(0)("Subname_Name")

                    ads.SelectCommand = "SELECT * FROM [Style] WHERE ([Style_ID] = '" & dv(0)("Style_ID") & "')"
                    dv = ads.Select(New DataSourceSelectArguments)
                    Subname_Optition_lb.Text = dv(0)("Style_Options")

                    If Val(Request.QueryString("S")) > 0 Then
                        ads.SelectCommand = "SELECT Top " & Request.QueryString("S") & "* FROM [Question] WHERE ([Question_SubName] = '" & Request.QueryString("Quizid") & "' And [Question_AnsCount] = '1' And [Question_Unit] Like '%" & Request.QueryString("Unit") & "%') ORDER BY NewID()"
                        dv = ads.Select(New DataSourceSelectArguments)
                        For i = 0 To dv.Count - 1
                            Quiz_Num_ddl.Items.Add("()第" & Quiz_Num_ddl.Items.Count + 1 & "題─單選")
                            Quiz_Num_ddl.Items(Quiz_Num_ddl.Items.Count - 1).Value = dv(i)("Question_ID")
                        Next
                    End If

                    If Val(Request.QueryString("M")) > 0 Then
                        ads.SelectCommand = "SELECT Top " & Request.QueryString("M") & "* FROM [Question] WHERE ([Question_SubName] = '" & Request.QueryString("Quizid") & "' And [Question_AnsCount] > '1'And [Question_Unit] Like '%" & Request.QueryString("Unit") & "%') ORDER BY NewID()"
                        dv = ads.Select(New DataSourceSelectArguments)
                        For i = 0 To dv.Count - 1
                            Quiz_Num_ddl.Items.Add("()第" & Quiz_Num_ddl.Items.Count + 1 & "題─複選")
                            Quiz_Num_ddl.Items(Quiz_Num_ddl.Items.Count - 1).Value = dv(i)("Question_ID")
                        Next
                    End If
                End If

                Test_Start_lb.Text = Now
                Quiz_Num_ddl_SelectedIndexChanged(Nothing, Nothing)
            Else
                Page.Title = lb_Subname.Text
            End If
        Catch ex As Exception
            Response.Redirect("Quiz_Choose.aspx")
        End Try
    End Sub

    Protected Sub Quiz_Num_ddl_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Quiz_Num_ddl.SelectedIndexChanged
        '============================進行[上一題]等「按鈕」的顯示設定=============================
        If Quiz_Num_ddl.SelectedIndex = Quiz_Num_ddl.Items.Count - 1 Then
            Button8.Visible = False
            Up_Question_bt.Visible = True
        ElseIf Quiz_Num_ddl.SelectedIndex = 0 Then
            Button8.Visible = True
            Up_Question_bt.Visible = False
        Else
            Button8.Visible = True
            Up_Question_bt.Visible = True
        End If

        '============================初始顯示設定=============================
        Button9.Text = "顯示附圖" '//附圖按鈕 設定
        NoLB.Text = "Q." & Val(Mid(Quiz_Num_ddl.SelectedItem.Text, InStr(Quiz_Num_ddl.SelectedItem.Text, "第") + 1)) '//題號文字 設定

        If Right(Quiz_Num_ddl.SelectedItem.Text, 1) = "*" Then '//[熟悉/不熟悉] 按鈕顯示
            Strange_bt.Text = "此題已熟悉"
        Else
            Strange_bt.Text = "此題不熟悉"
        End If

        '============================題目載入=============================
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_ID] = '" & Quiz_Num_ddl.SelectedValue & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        QuestionLB.Text = dv(0)("Question_Question").ToString.Replace("@@@", "'") '//題目 特殊符號 取代
        QuestionLB.Text = dv(0)("Question_Question").ToString.Replace(vbCrLf, "<br/>")


        Try   '//題目 附圖 顯示設定
            If Val(dv(0)("Question_Picture")) <> 0 Then
                Image1.ImageUrl = "~/Question_Pic/" & dv(0)("Question_Picture")
                Button9.Visible = True
                Panel2.Visible = False
            Else
                Button9.Visible = False
                Panel2.Visible = False
            End If
        Catch ex As Exception
            Button9.Visible = False
            Panel2.Visible = False
        End Try



        Dim Optition As String() = Split(Subname_Optition_lb.Text, ",")  '//題目 選項 顯示設定
        If InStr(Quiz_Num_ddl.SelectedItem.Text, "單選") > 0 Then
            CheckOptions1.Visible = False
            RadioOptions1.Visible = True
            RadioOptions1.Items.Clear()
            For i = 0 To UBound(Optition)
                If i = UBound(Optition) Then
                    RadioOptions1.Items.Add(Mid(QuestionLB.Text, InStr(QuestionLB.Text, "(" & Optition(i) & ")")))
                    RadioOptions1.Items(RadioOptions1.Items.Count - 1).Value = Optition(i)
                Else
                    RadioOptions1.Items.Add(Mid(QuestionLB.Text, InStr(QuestionLB.Text, "(" & Optition(i) & ")"), InStr(QuestionLB.Text, "(" & Optition(i + 1) & ")") - InStr(QuestionLB.Text, "(" & Optition(i) & ")")))
                    RadioOptions1.Items(RadioOptions1.Items.Count - 1).Value = Optition(i)
                End If
            Next
        Else
            CheckOptions1.Visible = True
            RadioOptions1.Visible = False
            CheckOptions1.Items.Clear()
            For i = 0 To UBound(Optition)
                If i = UBound(Optition) Then
                    CheckOptions1.Items.Add(Mid(QuestionLB.Text, InStr(QuestionLB.Text, "(" & Optition(i) & ")")))
                    CheckOptions1.Items(CheckOptions1.Items.Count - 1).Value = Optition(i)
                Else
                    CheckOptions1.Items.Add(Mid(QuestionLB.Text, InStr(QuestionLB.Text, "(" & Optition(i) & ")"), InStr(QuestionLB.Text, "(" & Optition(i + 1) & ")") - InStr(QuestionLB.Text, "(" & Optition(i) & ")")))
                    CheckOptions1.Items(CheckOptions1.Items.Count - 1).Value = Optition(i)
                End If
            Next
        End If


        QuestionLB.Text = Mid(QuestionLB.Text, 1, InStr(QuestionLB.Text, "(" & Optition(0) & ")") - 1) '//剷除選項 只留題目

        '============================選答案的顯示=============================
        If Mid(Quiz_Num_ddl.SelectedItem.Text, 2, 1) <> ")" Then
            If InStr(Quiz_Num_ddl.SelectedItem.Text, "單選") > 0 Then
                For i = 0 To RadioOptions1.Items.Count - 1
                    If RadioOptions1.Items(i).Value = Mid(Quiz_Num_ddl.SelectedItem.Text, 2, InStr(Quiz_Num_ddl.SelectedItem.Text, ")") - 2) Then
                        RadioOptions1.SelectedIndex = i
                        Exit For
                    End If
                Next
            Else
                For i = 0 To CheckOptions1.Items.Count - 1
                    CheckOptions1.Items(i).Selected = False
                Next

                Dim UserCheckAns As String() = Split(Mid(Quiz_Num_ddl.SelectedItem.Text, 2, InStr(Quiz_Num_ddl.SelectedItem.Text, ")") - 2), ",")
                For i = 0 To UBound(UserCheckAns)
                    For j = 0 To CheckOptions1.Items.Count - 1
                        If CheckOptions1.Items(j).Value = UserCheckAns(i) Then
                            CheckOptions1.Items(j).Selected = True
                        End If
                    Next
                Next


            End If

        End If


        '============================交卷後的顯示=============================
        If InStr(Quiz_Num_ddl.SelectedItem.Text, "　【錯誤】") > 0 Then
            Ans.Text = dv(0)("Question_Ans")
            Ans.Visible = True
        Else
            Ans.Visible = False
        End If
    End Sub

    Protected Sub Up_Question_bt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Up_Question_bt.Click '//[上一題]按鈕
        Quiz_Num_ddl.SelectedIndex -= 1
        Quiz_Num_ddl_SelectedIndexChanged(Nothing, Nothing)
    End Sub

    Protected Sub Button8_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button8.Click '//[上一題]按鈕
        Quiz_Num_ddl.SelectedIndex += 1
        Quiz_Num_ddl_SelectedIndexChanged(Nothing, Nothing)
    End Sub

    Protected Sub Strange_bt_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Strange_bt.Click '//[不熟悉]按鈕
        If Strange_bt.Text = "此題不熟悉" Then
            Quiz_Num_ddl.SelectedItem.Text &= "*"
            Strange_bt.Text = "此題已熟悉"
        Else
            Quiz_Num_ddl.SelectedItem.Text = Left(Quiz_Num_ddl.SelectedItem.Text, Len(Quiz_Num_ddl.SelectedItem.Text) - 1)
            Strange_bt.Text = "此題不熟悉"
        End If
    End Sub

    Protected Sub Button9_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button9.Click
        If Button9.Text = "顯示附圖" Then
            Button9.Text = "隱藏附圖"
            Panel2.Visible = True
        Else
            Button9.Text = "顯示附圖"
            Panel2.Visible = False
        End If
    End Sub

    Protected Sub RadioOptions1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioOptions1.SelectedIndexChanged
        Quiz_Num_ddl.SelectedItem.Text = "(" & RadioOptions1.SelectedValue & Mid(Quiz_Num_ddl.SelectedItem.Text, InStr(Quiz_Num_ddl.SelectedItem.Text, ")"))
    End Sub

    Protected Sub CheckOptions1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckOptions1.SelectedIndexChanged
        Dim Ans As String = ""
        For i = 0 To CheckOptions1.Items.Count - 1
            If CheckOptions1.Items(i).Selected Then Ans &= CheckOptions1.Items(i).Value & ","
        Next
        Try
            Quiz_Num_ddl.SelectedItem.Text = "(" & Left(Ans, Len(Ans) - 1) & Mid(Quiz_Num_ddl.SelectedItem.Text, InStr(Quiz_Num_ddl.SelectedItem.Text, ")"))
        Catch ex As Exception
            Quiz_Num_ddl.SelectedItem.Text = "(" & Mid(Quiz_Num_ddl.SelectedItem.Text, InStr(Quiz_Num_ddl.SelectedItem.Text, ")"))
        End Try
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
            For i = 0 To Quiz_Num_ddl.Items.Count - 1
                Dim ans As String
                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
                ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_ID] = '" & Quiz_Num_ddl.Items(i).Value & "')"
                Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

                ans = dv(0)("Question_Ans")
                For j = ans.Length To 2 Step -1
                    ans = Mid(ans, 1, j - 1) & "," & Mid(ans, j)
                Next

                Quiz_Num_ddl.Items(i).Text = "(" & ans & Mid(Quiz_Num_ddl.Items(i).Text, InStr(Quiz_Num_ddl.Items(i).Text, ")"))

                Quiz_Num_ddl.SelectedIndex = 0
                Quiz_Num_ddl_SelectedIndexChanged(Nothing, Nothing)
            Next
        End If

        TextBox1.Visible = False
        Button6.Visible = False
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim Total As Single = Val(Request.QueryString("S")) + Val(Request.QueryString("M"))
        Dim SingleSorce As Single = Math.Round(100 / Total, 1)
        Dim TotalScore As Single = 100
        Dim QueNum As Integer() = New Integer(1) {0, Total}

        TotalTestTime_lb.Text = "測驗總時間：" & CType(DateDiff(DateInterval.Minute, CType(Test_Start_lb.Text, Date), Now), Integer) & "分鐘"


        For i = 0 To Quiz_Num_ddl.Items.Count - 1
            Dim UserAns As String = Mid(Quiz_Num_ddl.Items(i).Text, 2, InStr(Quiz_Num_ddl.Items(i).Text, ")") - 2)
            UserAns = UserAns.Replace(",", "")

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_ID] = '" & Quiz_Num_ddl.Items(i).Value & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            If dv(0)("Question_Ans") <> UserAns Then
                Ans.Visible = True
                TotalScore -= SingleSorce
                Quiz_Num_ddl.Items(i).Text &= "　【錯誤】"
                QueNum(0) -= 1
            Else
                QueNum(0) += 1
            End If
        Next

        If TotalScore < 1 Then TotalScore = 0
        RadioOptions1.Enabled = False
        CheckOptions1.Enabled = False
        Label1.Text = Val(Format(TotalScore, "#.#"))
        Button1.Visible = False
        Panel1.Visible = True
        Strange_bt.Enabled = False
        TotalAndRight_lb.Text = QueNum(0) & "/" & QueNum(1)
        Strange_bt.Visible = False
        TotalAndRight_lb.Visible = False


        If Val(Request.QueryString("Test")) > 0 Then
            Recoring_Score()
        End If

        Quiz_Num_ddl.SelectedIndex = 0
        Quiz_Num_ddl_SelectedIndexChanged(Nothing, Nothing)
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
            For i = 0 To Quiz_Num_ddl.Items.Count - 1
                Dim WrongAns As String

                If InStr(Quiz_Num_ddl.Items(i).Text, "　【錯誤】") > 0 Or InStr(Quiz_Num_ddl.Items(i).Text, "*") > 0 Then
                    Try
                        WrongAns = Mid(Quiz_Num_ddl.Items(i).Text, 2, InStr(Quiz_Num_ddl.Items(i).Text, ")") - 2)
                    Catch ex As Exception
                        WrongAns = ""
                    End Try
                    WrongAns = WrongAns.Replace(",", "")

                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
                    ads.InsertCommand = "Insert Into Wrong ([Score_ID],[Question_ID],[Wrong_Ans]) Values ('" & dv(0)("Score_ID") & "','" & Quiz_Num_ddl.Items(i).Value & "','" & WrongAns & "')"
                    ads.Insert()
                    Familiar_Recorded = True
                End If
            Next


            CompeitionScoreRecode() '//紀錄比賽成績

            '=================完成紀錄，遮蔽記錄功能=============================================
            Button2.Enabled = False
            Button2.Text = "記錄完成"
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
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", "alert('●成績及勾選題目紀錄完成" & Message_Uploaded & "')", True)
            Else
                ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", "alert('●紀錄成績已完成" & Message_Uploaded & "')", True)
            End If



        Else
            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "", "alert('無法取得測驗總時間，記錄失敗')", True)
        End If
    End Sub

    Sub CompeitionScoreRecode()
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

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Recoring_Score()
    End Sub
End Class
