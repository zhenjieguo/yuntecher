Imports System.Data

Partial Class Homework_Detail
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

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            ads.SelectCommand = "Select * From [Homework] Where ([HW_ID] = '" & Request.QueryString("HW_ID") & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            If Val(dv(0)("TestTime")) > 0 Then
                ddl_ScoreList.Visible = False
                Score_ID.Visible = False
            End If

        Else
            Response.Redirect(Re)
        End If
    End Sub

    Protected Sub DetailsView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DetailsView1.DataBound
        Dim Subname_lb As Label = CType(DetailsView1.FindControl("Subname_lb"), Label)
        Dim HWID As Label = CType(DetailsView1.FindControl("HW_ID"), Label)
        Dim Teacher_lb As Label = CType(DetailsView1.FindControl("Teacher_lb"), Label)
        Dim Score_lb As Label = CType(DetailsView1.FindControl("Score_lb"), Label)
        Dim HWMode_lb As Label = CType(DetailsView1.FindControl("HWMode_lb"), Label)
        Dim Subname_ID As Label = CType(DetailsView1.FindControl("Subname_ID"), Label)
        Dim EndtimeLabel As Label = CType(DetailsView1.FindControl("EndtimeLabel"), Label)
        Dim StarttimeLabel As Label = CType(DetailsView1.FindControl("StarttimeLabel"), Label)

        If HWMode_lb.Text = 0 Then
            HWMode_lb.Text = "練習"
        Else
            HWMode_lb.Text = "測驗(時限" & HWMode_lb.Text & "分鐘)"
        End If




        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "Select [User_Name] From [User] Where ([User_ID] = '" & Teacher_lb.Text & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        Teacher_lb.Text = dv(0)("User_Name") & "老師"


        Dim Unit As String = Microsoft.VisualBasic.Right(Trim(Subname_lb.Text), 1)
        UnitLabel.Text = Unit
        If Val(Unit) = 0 Then Subname_lb.Text &= "全部"

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "Select * From [Subname] Where ([Subname_ID] = '" & Val(Subname_lb.Text) & "')"
        dv = ads.Select(New DataSourceSelectArguments)
        Subname_lb.Text = dv(0)("Subname_Name") & "<br/>" & Mid(Subname_lb.Text, InStr(Subname_lb.Text, " ") + 1)

        Dim Testcount As Label = CType(DetailsView1.FindControl("Testcount"), Label)
        Dim Count_Single As Label = CType(DetailsView1.FindControl("Count_Single"), Label)
        Dim Count_Multiple As Label = CType(DetailsView1.FindControl("Count_Multiple"), Label)
        If InStr(Testcount.Text, ",") > 0 Then
            Dim p As String() = Testcount.Text.Split(",")
            Count_Single.Text = p(0)
            Count_Multiple.Text = p(1)
        Else
            Count_Single.Text = Testcount.Text
            Count_Multiple.Text = 0
        End If
        Count.Text = Testcount.Text

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "Select * From [Score] Where ([User_ID] = '" & Val(Session("User")) & "' And [Upload] = '" & HWID.Text & "')"
        dv = ads.Select(New DataSourceSelectArguments)
        If dv.Count <> 0 Then
            Score_lb.Text = dv(0)("Score")
            If HWMode_lb.Text Like "測驗(時限*" Then
                bt_StartTest_PC.Visible = False
                bt_StartTest_Mobile.Visible = False
            End If
        Else
            Score_lb.Text = "0"
        End If



        If HWMode_lb.Text Like "測驗*" And Val(Score_lb.Text) > 0 Then
            bt_Score_Submit.Visible = False
        End If

        Question_ID.Text = Val(Subname_ID.Text)
        EndTime.Text = EndtimeLabel.Text
        StartTime.Text = StarttimeLabel.Text
    End Sub

    Protected Sub ddl_ScoreList_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl_ScoreList.DataBound
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString

        If Not IsPostBack Then


            Dim deleindex As New ArrayList

            For i = 0 To ddl_ScoreList.Items.Count - 1


                If Val(ddl_ScoreList.Items(i).Text) = 0 Then '//若成績為零
                    deleindex.Add(i)
                Else

                    ads.SelectCommand = "Select * From [Score] Where ([Score_ID] = '" & ddl_ScoreList.Items(i).Value & "')"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments) '//此選項的[Score]資訊

                    Dim tempcp As String '//單元

                    If IsDBNull(dv(0)("Unit")) Then '範圍是全部
                        tempcp = ""
                    Else
                        If dv(0)("Unit").ToString.Length = 0 Then
                            tempcp = ""
                        Else
                            tempcp = dv(0)("Unit")
                        End If
                    End If  '<END IF>範圍是全部


                    If (Not (UnitLabel.Text Like ("*" & tempcp & "*"))) Then '//若[單元]不相等
                        deleindex.Add(i)
                    Else

                        Dim Student_Count As String() = dv(0)("TestCount").ToString.Split(",") '//題目數是否超過
                        Dim Teacher_Count As String() = Count.Text.Split(",")
                        If Val(Student_Count(0)) >= Val(Teacher_Count(0)) And Val(Student_Count(1)) >= Val(Teacher_Count(1)) Then
                            If Not ((Val(dv(0)("Upload")) <> 0) And (Val(dv(0)("Upload")) <> Request.QueryString("HW_ID"))) Then '//已用來繳交其他作業
                                ddl_ScoreList.Items(i).Text &= "分 - " & dv(0)("TestDate")

                                If Val(dv(0)("Upload")) <> 0 Then '//繳交此作業
                                    ddl_ScoreList.Items(i).Text &= " [目前繳交成績]"
                                    ddl_ScoreList.SelectedIndex = i

                                    Dim d As Date = CType(dv(0)("TestDate"), Date)
                                    If d >= CType(StartTime.Text, Date) And d <= CType(EndTime.Text, Date) Then '//繳交時間後的作答

                                    Else
                                        deleindex.Add(i)
                                    End If


                                End If
                            Else
                                deleindex.Add(i)
                            End If
                        Else
                            deleindex.Add(i)
                        End If

                    End If '<END IF>若[單元]不相等

                End If '<END IF>若成績為零
            Next



            For i = deleindex.Count - 1 To 0 Step -1
                ddl_ScoreList.Items.RemoveAt(deleindex(i))
            Next
            deleindex.Clear()
        End If


        If ddl_ScoreList.Items.Count = 0 Then bt_Score_Submit.Visible = False

        ddl_ScoreList_SelectedIndexChanged(Nothing, Nothing)
    End Sub

    Protected Sub bt_StartTest_PC_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_StartTest_PC.Click
        Dim hwid As Label = CType(DetailsView1.FindControl("HW_ID"), Label)
        Dim Subname_ID As Label = CType(DetailsView1.FindControl("Subname_ID"), Label)
        Dim UnitLB As Label = CType(DetailsView1.FindControl("Subname_lb"), Label)
        Dim Count_Single As Label = CType(DetailsView1.FindControl("Count_Single"), Label)
        Dim Count_Multiple As Label = CType(DetailsView1.FindControl("Count_Multiple"), Label)
        Dim Unit As String = Val(Mid(UnitLB.Text, InStr(UnitLB.Text, "單元：") + 3))
        If Unit = 0 Then Unit = ""


        Response.Redirect("Quiz_pc.aspx?HW_ID=" & Request.QueryString("HW_ID") & "&Quizid=" & Subname_ID.Text & "&Unit=" & Unit & "&S=" & Val(Count_Single.Text) & "&M=" & Val(Count_Multiple.Text) & "&Test=" & Hwid.Text)
    End Sub

    Protected Sub ddl_ScoreList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl_ScoreList.SelectedIndexChanged
        If ddl_ScoreList.Items.Count > 0 Then
            If ddl_ScoreList.SelectedItem.Text Like "*[目前繳交成績]*" Then
                bt_Score_Submit.Visible = False
            Else

                Dim SelectIndex_Old As Integer
                For i = 0 To ddl_ScoreList.Items.Count - 1
                    If ddl_ScoreList.Items(i).Text Like "*[目前繳交成績]*" Then  SelectIndex_Old = i
                Next

                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                ads.UpdateCommand = "UPDATE [Score] SET  [Upload] = '' WHERE [Score_ID] = '" & ddl_ScoreList.Items(SelectIndex_Old).Value & "'"
                ads.Update()

                ads.UpdateCommand = "UPDATE [Score] SET  [Upload] = '" & Val(Request.QueryString("HW_ID")) & "' WHERE [Score_ID] = '" & ddl_ScoreList.SelectedValue & "'"
                ads.Update()


                For i = 0 To ddl_ScoreList.Items.Count - 1

                    ads.SelectCommand = "Select * From [Score] Where ([Score_ID] = '" & ddl_ScoreList.Items(i).Value & "')"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments) '//此選項的[Score]資訊

                    If Val(dv(0)("Upload")) <> 0 Then '//繳交此作業
                        ddl_ScoreList.Items(i).Text &= " [目前繳交成績]"
                        ddl_ScoreList.SelectedIndex = i
                    Else
                        ddl_ScoreList.Items(i).Text = ddl_ScoreList.Items(i).Text.Replace(" [目前繳交成績]", "")
                    End If
                Next


                DetailsView1.DataBind()
            End If
        End If
    End Sub

    Protected Sub bt_StartTest_Mobile_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_StartTest_Mobile.Click
        Dim hwid As Label = CType(DetailsView1.FindControl("HW_ID"), Label)
        Dim Subname_ID As Label = CType(DetailsView1.FindControl("Subname_ID"), Label)
        Dim UnitLB As Label = CType(DetailsView1.FindControl("Subname_lb"), Label)
        Dim Count_Single As Label = CType(DetailsView1.FindControl("Count_Single"), Label)
        Dim Count_Multiple As Label = CType(DetailsView1.FindControl("Count_Multiple"), Label)
        Dim Unit As String = Val(Mid(UnitLB.Text, InStr(UnitLB.Text, "單元：") + 3))
        If Unit = 0 Then Unit = ""


        Response.Redirect("Quiz_mobile.aspx?HW_ID=" & Request.QueryString("HW_ID") & "&Quizid=" & Subname_ID.Text & "&Unit=" & Unit & "&S=" & Val(Count_Single.Text) & "&M=" & Val(Count_Multiple.Text) & "&Test=" & hwid.Text)
    End Sub

End Class
