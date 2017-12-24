Imports System.Data

Partial Class Teacher_Homework_Information
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

        If Not IsPostBack Then

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([User_ID] = '" & Val(Session("User")) & "') Order By [Subname_ID] DESC"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            If dv.Count = 0 Then
                Drop_Publish.Items.Clear()
                Drop_Publish.Items.Add("他人公開")
                Drop_Publish.Items(0).Value = "他人公開"
            Else
                Drop_Publish.Items.Clear()
                Drop_Publish.Items.Add("自己")
                Drop_Publish.Items(0).Value = "自己"
                Drop_Publish.Items.Add("他人公開")
                Drop_Publish.Items(1).Value = "他人公開"
            End If
            Drop_Publish_SelectedIndexChanged(Nothing, Nothing)


            If Val(Request.QueryString("hwid")) > 0 Then
                Edit()
            Else
                Insert()
            End If

        End If
    End Sub

    Protected Sub Drop_Publish_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Drop_Publish.SelectedIndexChanged
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        Drop_Question.Items.Clear()


        If Drop_Publish.SelectedValue = "自己" Then

            ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([User_ID] = '" & Val(Session("User")) & "') Order By [Subname_ID] DESC"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count - 1
                Drop_Question.Items.Add(dv(i)("Subname_Name"))
                Drop_Question.Items(Drop_Question.Items.Count - 1).Value = dv(i)("Subname_ID")
            Next

        Else

            ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Publish] = 'True') Order By [Subname_ID] DESC"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count - 1
                Drop_Question.Items.Add(dv(i)("Subname_Name"))
                Drop_Question.Items(Drop_Question.Items.Count - 1).Value = dv(i)("Subname_ID")
            Next
        End If

        Drop_Question_SelectedIndexChanged(Nothing, Nothing)
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click

        If RadioButtonList1.SelectedIndex = 0 Then '選擇練習

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString

            
            StopTime.Text = Drop_Year.SelectedItem.Text & "/" & Drop_Month.SelectedItem.Text & "/" & Drop_Day.SelectedItem.Text
            Dim Stopoftime As Date = CType(StopTime.Text & " " & Drop_AMPM.SelectedItem.Text & " " & Drop_Hors.SelectedItem.Text & ":" & Drop_Min.SelectedItem.Text & ":00", Date)
            If Stopoftime < Now Then
                Response.Write("<script> alert('時間已經超過了')</script>")
                Exit Sub
            End If

            If InStr(TextBox1.Text, "'") > 0 Then
                Response.Write("<script> alert('含有非法字元「'」')</script>")
                Exit Sub
            End If

            Dim note As String = TextBox1.Text.Replace(vbCrLf, "<br />")

            If Button1.Text = "新增" Then
                ads.InsertCommand = "Insert Into Homework ([Teacher_ID],[TestTime],[Date_End],[Subname],[Subname_Unit],[Student_Group],[HW_Note],[TestCount]) Values ('" & Val(Session("User")) & "','0','" & Stopoftime & "','" & Drop_Question.SelectedValue & "','" & DropDownList2.SelectedValue & "','" & ClassLabel.Text & "','" & note & "','" & DDL_Single.SelectedItem.Text & "," & DDL_Multiple.SelectedItem.Text & "')"
                ads.Insert()
                Response.Write("<script> alert('作業已新增');location.href='Teacher_Homework.aspx';</script>")
            Else
                ads.UpdateCommand = "Update Homework Set [TestTime] = '0',[Date_End] = '" & Stopoftime & "' ,[Subname_Unit] = '" & DropDownList2.SelectedValue & "', [Student_Group] = '" & ClassLabel.Text & "' , [HW_Note] = '" & note & "' , [TestCount] = '" & DDL_Single.SelectedItem.Text & "," & DDL_Multiple.SelectedItem.Text & "' Where [HW_ID] = '" & Request.QueryString("hwid") & "'"
                ads.Update()
                Response.Write("<script> alert('作業已修改');location.href='Teacher_Homework.aspx';</script>")

            End If


        Else '選擇測驗

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString

            StopTime.Text = Drop_Year.SelectedItem.Text & "/" & Drop_Month.SelectedItem.Text & "/" & Drop_Day.SelectedItem.Text
            Dim Stopoftime As Date = CType(StopTime.Text & " " & Drop_AMPM.SelectedItem.Text & Drop_Hors.SelectedItem.Text & ":" & Drop_Min.SelectedItem.Text, Date)
            If Stopoftime < Now Then
                Response.Write("<script> alert('時間已經超過了')</script>")
                Exit Sub
            End If

            If InStr(TextBox1.Text, "'") > 0 Then
                Response.Write("<script> alert('含有非法字元「'」')</script>")
                Exit Sub
            End If

            Dim note As String = TextBox1.Text.Replace(vbCrLf, "<br />")

            If Not IsNumeric(TestTime_tx.Text) Then
                Response.Write("<script> alert('測驗限時僅限輸入數字')</script>")
                Exit Sub
            ElseIf Val(TestTime_tx.Text) <= 0 Or Val(TestTime_tx.Text) > 120 Then
                Response.Write("<script> alert('測驗限時需大於0且小於等於120')</script>")
                Exit Sub
            End If


            Dim Testtime As Single = Val(TestTime_tx.Text)
            If RadioButtonList1.SelectedIndex = 0 Then Testtime = 0

            If Button1.Text = "新增" Then
                ads.InsertCommand = "Insert Into Homework ([Teacher_ID],[TestTime],[Date_End],[Subname],[Subname_Unit],[Student_Group],[HW_Note],[TestCount]) Values ('" & Val(Session("User")) & "','" & Testtime & "','" & Stopoftime & "','" & Drop_Question.SelectedValue & "','" & DropDownList2.SelectedValue & "','" & ClassLabel.Text & "','" & note & "','" & DDL_Single.SelectedItem.Text & "," & DDL_Multiple.SelectedItem.Text & "')"
                ads.Insert()
                Response.Write("<script> alert('作業已新增');location.href='Teacher_Homework.aspx';</script>")
            Else
                ads.UpdateCommand = "Update Homework Set [TestTime] = '" & Testtime & "',[Date_End] = '" & Stopoftime & "' ,[Subname_Unit] = '" & DropDownList2.SelectedValue & "', [Student_Group] = '" & ClassLabel.Text & "' , [HW_Note] = '" & note & "' , [TestCount] = '" & DDL_Single.SelectedItem.Text & "," & DDL_Multiple.SelectedItem.Text & "' Where [HW_ID] = '" & Request.QueryString("hwid") & "'"
                ads.Update()
                Response.Write("<script> alert('作業已修改');location.href='Teacher_Homework.aspx';</script>")
            End If
        End If
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        Response.Redirect("Teacher_Questions.aspx")
    End Sub

    Protected Sub Drop_Month_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Drop_Month.SelectedIndexChanged

        Select Case Drop_Month.SelectedItem.Text
            Case 1, 3, 5, 7, 8, 10, 12
                Drop_Day.Items.Clear()
                For i = 1 To 31
                    Drop_Day.Items.Add(i)
                Next
            Case Else
                Drop_Day.Items.Clear()
                For i = 1 To 30
                    Drop_Day.Items.Add(i)
                Next
        End Select

    End Sub

    Protected Sub Button4_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button4.Click

        If ClassLabel.Text.Length = 0 Then
            ClassLabel.Text = DropDownList1.SelectedValue
        Else
            If InStr(ClassLabel.Text, DropDownList1.SelectedValue) > 0 Then
                Response.Write("<script> alert('此班級已經存在')</script>")
                Exit Sub
            End If
            Dim t As String() = Split(ClassLabel.Text, ",")
            Dim classlist As New ArrayList
            For i = 0 To UBound(t)
                classlist.Add(t(i))
            Next
            classlist.Add(DropDownList1.SelectedValue)
            classlist.Sort()
            ClassLabel.Text = classlist(0)
            For i = 1 To classlist.Count - 1
                ClassLabel.Text &= "," & classlist(i)
            Next
        End If

    End Sub

    Protected Sub Button5_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button5.Click

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        Dim dv As DataView

        If Len(Request.QueryString("hwid")) > 0 Then
            ads.SelectCommand = "SELECT * FROM [Score] WHERE ([Upload] = '" & Request.QueryString("hwid") & "')"
            dv = ads.Select(New DataSourceSelectArguments)

            For i = 0 To dv.Count - 1
                ads.SelectCommand = "SELECT * FROM [User] WHERE ([User_ID] = '" & dv(i)("User_ID") & "')"
                Dim dv2 As DataView = ads.Select(New DataSourceSelectArguments)
                If dv2(0)("User_Group") = DropDownList1.SelectedValue Then
                    Response.Write("<script> alert('此班級已有學生繳交成績了')</script>")
                    Exit Sub
                End If
            Next
        End If


        If ClassLabel.Text.Length = 0 Then
            Response.Write("<script> alert('無選擇此班級')</script>")
            Exit Sub
        Else
            Dim t As String()
            Dim classlist As New ArrayList

            If InStr(ClassLabel.Text, "<br/>") <> 0 Then
                t = Split(ClassLabel.Text, "<br/>")
                For i = 0 To UBound(t)
                    classlist.Add(t(i))
                Next
            ElseIf InStr(ClassLabel.Text, ",") <> 0 Then
                t = Split(ClassLabel.Text, ",")
                For i = 0 To UBound(t)
                    classlist.Add(t(i))
                Next
            Else
                classlist.Add(ClassLabel.Text)
            End If




            If classlist.IndexOf(DropDownList1.SelectedValue) >= 0 Then
                classlist.RemoveAt(classlist.IndexOf(DropDownList1.SelectedValue))
                classlist.Sort()
                ClassLabel.Text = ""
                If classlist.Count <> 0 Then
                    ClassLabel.Text = classlist(0)
                    For i = 1 To classlist.Count - 1
                        ClassLabel.Text &= "," & classlist(i)
                    Next
                End If

            Else
                Response.Write("<script> alert('無選擇此班級')</script>")
                Exit Sub
            End If
        End If

    End Sub

    Protected Sub Drop_Question_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles Drop_Question.SelectedIndexChanged

        Try
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "SELECT DISTINCT [Question_Unit] FROM [Question] WHERE ([Question_SubName] = '" & Drop_Question.SelectedValue & "') ORDER BY [Question_Unit]"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            '================================================================================================================
            Dim boolen_IsNumber As Boolean = False
            Dim options As New ArrayList

            For i = 0 To dv.Count - 1
                If i = 0 Then If Val(dv(0)("Question_Unit")) > 0 Then boolen_IsNumber = True

                If boolen_IsNumber Then
                    If Val(dv(i)("Question_Unit")) < 10 Then
                        options.Add(Format(Val(dv(i)("Question_Unit")), "0#"))
                    Else
                        options.Add(dv(i)("Question_Unit"))
                    End If
                Else
                    options.Add(dv(i)("Question_Unit"))
                End If
            Next

            options.Sort()
            DropDownList2.Items.Clear()
            DropDownList2.Items.Add("全部")
            DropDownList2.Items(0).Value = ""


            If boolen_IsNumber Then
                For i = 0 To options.Count - 1
                    DropDownList2.Items.Add(options(i))
                    DropDownList2.Items(i + 1).Value = Val(options(i))
                Next
            Else
                For i = 0 To options.Count - 1
                    DropDownList2.Items.Add(options(i))
                    DropDownList2.Items(i + 1).Value = options(i)
                Next
            End If
            '================================================================================================================


            Dim subnameid As Integer = Drop_Question.SelectedValue

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            DDL_Multiple.Items.Clear()
            DDL_Single.Items.Clear()
            For i = 0 To dv.Count
                DDL_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count
                DDL_Multiple.Items.Add(i)
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged

        Dim subnameid As Integer = Drop_Question.SelectedValue

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

        If DropDownList2.SelectedItem.Text <> "全部" Then
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1' And [Question_Unit] = '" & DropDownList2.SelectedValue & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            DDL_Single.Items.Clear()
            For i = 0 To dv.Count
                DDL_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1' And [Question_Unit] = '" & DropDownList2.SelectedValue & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            DDL_Multiple.Items.Clear()
            For i = 0 To dv.Count
                DDL_Multiple.Items.Add(i)
            Next
        Else
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            DDL_Multiple.Items.Clear()
            DDL_Single.Items.Clear()
            For i = 0 To dv.Count
                DDL_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count
                DDL_Multiple.Items.Add(i)
            Next
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        If RadioButtonList1.SelectedIndex = 1 Then
            TittleTime_lb.Visible = True
            TestTime_tx.Visible = True
            TittleMin_lb.Visible = True
        Else
            TittleTime_lb.Visible = False
            TestTime_tx.Visible = False
            TittleMin_lb.Visible = False
        End If
        TestTime_tx.Text = ""
    End Sub

    Sub Edit()
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([User_ID] = '" & Val(Session("User")) & "') Order By [Subname_ID] DESC"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Homework] WHERE ([HW_ID] = '" & Val(Request.QueryString("hwid")) & "')"
        dv = ads.Select(New DataSourceSelectArguments)

        If Val(dv(0)("TestTime")) = 0 Then
            RadioButtonList1.SelectedIndex = 0
            TittleTime_lb.Visible = False
            TestTime_tx.Visible = False
            TittleMin_lb.Visible = False
        Else
            RadioButtonList1.SelectedIndex = 1
            TestTime_tx.Text = Val(dv(0)("TestTime"))
            TittleTime_lb.Visible = True
            TestTime_tx.Visible = True
            TittleMin_lb.Visible = True
        End If

        Drop_Day.Items.Clear()
        Drop_Month_SelectedIndexChanged(Nothing, Nothing)

        Drop_Min.Items.Clear()
        For i = 0 To 59
            Drop_Min.Items.Add(Format(i, "0#"))
            Drop_Min.Items(i).Value = Format(i, "0#")
        Next
        Drop_Year.Items.Clear()
        For i = Now.Year To Now.Year + 5
            Drop_Year.Items.Add(i)
        Next

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & dv(0)("Subname") & "')"
        Dim dv2 As DataView = ads.Select(New DataSourceSelectArguments)

        Drop_Publish.Items.Clear()
        If dv2(0)("User_ID") <> Session("User_ID") Then
            Drop_Publish.Items.Add("他人公開")
        Else
            Drop_Publish.Items.Add("自己")
        End If
        Drop_Question.Items.Clear()
        Drop_Question.Items.Add(dv2(0)("Subname_Name"))
        Drop_Question.Items(0).Value = dv2(0)("Subname_ID")

        Dim Date_end As String = dv(0)("Date_End").ToString


        Dim Endtime_Day As String() = Mid(Date_end, 1, InStr(Date_end, "午") - 3).Split("/")
        Dim Endtime_Noon As String = Mid(Date_end, InStr(Date_end, "午") - 1)
        Dim Endtime_Time As String() = Mid(Date_end, InStr(Date_end, "午") + 2).Split(":")
        Drop_Year.SelectedIndex = Endtime_Day(0) - Val(Now.Year)
        Drop_Month.SelectedIndex = Endtime_Day(1) - 1
        Drop_Day.SelectedIndex = Val(Endtime_Day(2)) - 1
        If Endtime_Noon = "上午" Then
            Drop_AMPM.SelectedIndex = 0
        Else
            Drop_AMPM.SelectedIndex = 1
        End If
        Drop_Hors.SelectedIndex = Val(Endtime_Time(0)) - 1
        Drop_Min.SelectedIndex = Val(Endtime_Time(1))

        '==============================================================================================================
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT DISTINCT [Question_Unit] FROM [Question] WHERE ([Question_SubName] = '" & Drop_Question.SelectedValue & "') ORDER BY [Question_Unit]"
        dv2 = ads.Select(New DataSourceSelectArguments)

        Dim boolen_IsNumber As Boolean = False
        Dim options As New ArrayList

        DropDownList2.Items.Clear()

        For i = 0 To dv.Count - 1
            If i = 0 Then If Val(dv2(0)("Question_Unit")) > 0 Then boolen_IsNumber = True

            If boolen_IsNumber Then
                If Val(dv2(i)("Question_Unit")) < 10 Then
                    options.Add(Format(Val(dv2(i)("Question_Unit")), "0#"))
                Else
                    options.Add(dv2(i)("Question_Unit"))
                End If
            End If
        Next

        options.Sort()

        Dim list_Item As New ListItem
        list_Item.Text = "全部"
        list_Item.Value = ""
        DropDownList2.Items.Add(list_Item)


        If boolen_IsNumber Then
            For i = 0 To options.Count - 1
                DropDownList2.Items.Add(options(i))
                DropDownList2.Items(i + 1).Value = Val(options(i))
            Next
        Else
            For i = 0 To options.Count - 1
                DropDownList2.Items.Add(options(i))
                DropDownList2.Items(i + 1).Value = options(i)
            Next
        End If
        '==============================================================================================================


        If Val(dv(0)("Subname_Unit").ToString) = 0 Then

            DropDownList2.SelectedIndex = 0

        Else
            For i = 0 To DropDownList2.Items.Count - 1
                If dv(0)("Subname_Unit") = DropDownList2.Items(i).Text Then
                    DropDownList2.SelectedIndex = i
                    Exit For
                End If
            Next
        End If

        TextBox1.Text = dv(0)("HW_Note").ToString.Replace("<br />", vbCrLf)


        ClassLabel.Text = dv(0)("Student_Group")
        Button1.Text = "修改"


        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Score] WHERE ([Upload] = '" & Val(Request.QueryString("hwid")) & "')"
        dv2 = ads.Select(New DataSourceSelectArguments)

        If dv.Count > 0 Then  '已有人繳交成績
            Drop_Publish.Enabled = False
            Drop_Question.Enabled = False
            DropDownList2.Enabled = False
            DDL_Multiple.Enabled = False
            DDL_Single.Enabled = False
        End If


        Dim subnameid As Integer = Drop_Question.SelectedValue

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        If DropDownList2.SelectedItem.Text <> "全部" Then
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1' And [Question_Unit] = '" & DropDownList2.SelectedValue & "')"
            dv2 = ads.Select(New DataSourceSelectArguments)
            DDL_Single.Items.Clear()
            For i = 0 To dv2.Count
                DDL_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1' And [Question_Unit] = '" & DropDownList2.SelectedValue & "')"
            dv2 = ads.Select(New DataSourceSelectArguments)
            DDL_Multiple.Items.Clear()
            For i = 0 To dv2.Count
                DDL_Multiple.Items.Add(i)
            Next
        Else
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
            dv2 = ads.Select(New DataSourceSelectArguments)
            DDL_Multiple.Items.Clear()
            DDL_Single.Items.Clear()
            For i = 0 To dv2.Count
                DDL_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
            dv2 = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv2.Count
                DDL_Multiple.Items.Add(i)
            Next
        End If

        Dim countNUM As String() = dv(0)("TestCount").ToString.Split(",")
        For i = 0 To DDL_Single.Items.Count - 1
            If DDL_Single.Items(i).Text = Val(countNUM(0)) Then DDL_Single.SelectedIndex = i
        Next
        For i = 0 To DDL_Multiple.Items.Count - 1
            If DDL_Multiple.Items(i).Text = Val(countNUM(1)) Then DDL_Multiple.SelectedIndex = i
        Next
    End Sub

    Sub Insert()
        Drop_Publish.Enabled = True
        Drop_Question.Enabled = True
        DropDownList2.Enabled = True
        DDL_Multiple.Enabled = True
        DDL_Single.Enabled = True

        Drop_Day.Items.Clear()
        Drop_Month_SelectedIndexChanged(Nothing, Nothing)

        Drop_Min.Items.Clear()
        For i = 0 To 59
            Drop_Min.Items.Add(Format(i, "0#"))
            Drop_Min.Items(i).Value = Format(i, "0#")
        Next
        Drop_Year.Items.Clear()
        For i = Now.Year To Now.Year + 5
            Drop_Year.Items.Add(i)
        Next

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT DISTINCT [Question_Unit] FROM [Question] WHERE ([Question_SubName] = '" & Drop_Question.SelectedValue & "') ORDER BY [Question_Unit]"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)


        Drop_Publish.SelectedIndex = 0
        Drop_Question.SelectedIndex = 0

        '================================================================================================================
        Dim boolen_IsNumber As Boolean = False
        Dim options As New ArrayList

        For i = 0 To dv.Count - 1
            If i = 0 Then If Val(dv(0)("Question_Unit")) > 0 Then boolen_IsNumber = True

            If boolen_IsNumber Then
                If Val(dv(i)("Question_Unit")) < 10 Then
                    options.Add(Format(Val(dv(i)("Question_Unit")), "0#"))
                Else
                    options.Add(dv(i)("Question_Unit"))
                End If
            Else
                options.Add(dv(i)("Question_Unit"))
            End If
        Next

        options.Sort()
        DropDownList2.Items.Clear()
        DropDownList2.Items.Add("全部")
        DropDownList2.Items(0).Value = ""


        If boolen_IsNumber Then
            For i = 0 To options.Count - 1
                DropDownList2.Items.Add(options(i))
                DropDownList2.Items(i + 1).Value = Val(options(i))
            Next
        Else
            For i = 0 To options.Count - 1
                DropDownList2.Items.Add(options(i))
                DropDownList2.Items(i + 1).Value = options(i)
            Next
        End If
        '================================================================================================================



        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([User_ID] = '" & Session("User_ID") & "') Order By [Subname_ID] DESC"
        dv = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then
            Drop_Publish.SelectedIndex = 0
            Drop_Publish_SelectedIndexChanged(Nothing, Nothing)
            Drop_Question.SelectedIndex = 0

            Dim subnameid As Integer = Drop_Question.SelectedValue

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            DDL_Multiple.Items.Clear()
            DDL_Single.Items.Clear()
            For i = 0 To dv.Count
                DDL_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count
                DDL_Multiple.Items.Add(i)
            Next
        End If

        Drop_Year.SelectedIndex = 0
        Drop_Month.SelectedIndex = Val(Now.Month) - 1
        Drop_Month_SelectedIndexChanged(Nothing, Nothing)
        Drop_Day.SelectedIndex = Val(Now.Day) - 1
        Drop_AMPM.SelectedIndex = 1
        Drop_Hors.SelectedIndex = 11
        Drop_Min.SelectedIndex = 0
        TextBox1.Text = ""
        ClassLabel.Text = ""
        Button1.Text = "新增"
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If RadioButtonList1.SelectedIndex = 1 Then
            TittleTime_lb.Visible = True
            TestTime_tx.Visible = True
            TittleMin_lb.Visible = True
        Else
            TittleTime_lb.Visible = False
            TestTime_tx.Visible = False
            TittleMin_lb.Visible = False
        End If
        TestTime_tx.Text = ""
    End Sub
End Class
