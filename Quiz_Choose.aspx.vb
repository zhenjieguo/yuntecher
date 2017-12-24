Imports System_Base
Imports System.Data

Partial Class Quiz_Choose
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim Bass_Dll As New System_Base

        Bass_Dll.Cookid_Login()

        Bass_Dll.Show_User_Name_To_Title(lb_UserName)
        Bass_Dll.Link_Login(lb_Login_Chen, lb_Login_Eng, hy_Backend)
    End Sub

    Protected Sub ddl_Quiz_Choose_Subname_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl_Quiz_Choose_Subname.SelectedIndexChanged
        SqlDataSource2.DataBind()
        ddl_Quiz_Choose_Unit.DataBind()
        Dim subnameid As Integer = ddl_Quiz_Choose_Subname.SelectedValue

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

        If ddl_Quiz_Choose_Unit.SelectedItem.Text <> "全部" Then
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1' And [Question_Unit] = '" & ddl_Quiz_Choose_Unit.SelectedValue & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            ddl_Quiz_Choose_Single.Items.Clear()
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1' And [Question_Unit] = '" & ddl_Quiz_Choose_Unit.SelectedValue & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            ddl_Quiz_Choose_Multiple.Items.Clear()
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Multiple.Items.Add(i)
            Next
        Else
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            ddl_Quiz_Choose_Multiple.Items.Clear()
            ddl_Quiz_Choose_Single.Items.Clear()
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Multiple.Items.Add(i)
            Next
        End If
    End Sub

    Protected Sub ddl_Quiz_Choose_Unit_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl_Quiz_Choose_Unit.DataBound
        Try
            Dim boolen_IsNumber As Boolean = False
            Dim options As New ArrayList

            For i = 0 To ddl_Quiz_Choose_Unit.Items.Count - 1
                'If i = 0 Then If Val(ddl_Quiz_Choose_Unit.Items(0).Text) > 0 Then boolen_IsNumber = True

                'If boolen_IsNumber Then
                '    If Val(ddl_Quiz_Choose_Unit.Items(i).Text) < 10 Then
                '        options.Add(Format(Val(ddl_Quiz_Choose_Unit.Items(i).Text), "0#"))
                '    Else
                '        options.Add(ddl_Quiz_Choose_Unit.Items(i).Text)
                '    End If
                'Else
                options.Add(ddl_Quiz_Choose_Unit.Items(i).Text)
                'End If

            Next
            options.Sort()
            ddl_Quiz_Choose_Unit.Items.Clear()

            ddl_Quiz_Choose_Unit.Items.Add("全部")
            ddl_Quiz_Choose_Unit.Items(0).Value = ""

            If boolen_IsNumber Then
                For i = 0 To options.Count - 1
                    ddl_Quiz_Choose_Unit.Items.Add(options(i))
                    ddl_Quiz_Choose_Unit.Items(i + 1).Value = val(options(i))
                Next
            Else
                For i = 0 To options.Count - 1
                    ddl_Quiz_Choose_Unit.Items.Add(options(i))
                    ddl_Quiz_Choose_Unit.Items(i + 1).Value = options(i)
                Next
            End If



            If Not IsPostBack Then
                Dim subnameid As Integer = ddl_Quiz_Choose_Subname.SelectedValue

                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

                If ddl_Quiz_Choose_Unit.SelectedItem.Text <> "全部" Then
                    ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1' And [Question_Unit] = '" & ddl_Quiz_Choose_Unit.SelectedValue & "')"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                    ddl_Quiz_Choose_Single.Items.Clear()
                    For i = 0 To dv.Count
                        ddl_Quiz_Choose_Single.Items.Add(i)
                    Next

                    ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1' And [Question_Unit] = '" & ddl_Quiz_Choose_Unit.SelectedValue & "')"
                    dv = ads.Select(New DataSourceSelectArguments)
                    ddl_Quiz_Choose_Multiple.Items.Clear()
                    For i = 0 To dv.Count
                        ddl_Quiz_Choose_Multiple.Items.Add(i)
                    Next
                Else
                    ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
                    Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                    ddl_Quiz_Choose_Multiple.Items.Clear()
                    ddl_Quiz_Choose_Single.Items.Clear()
                    For i = 0 To dv.Count
                        ddl_Quiz_Choose_Single.Items.Add(i)
                    Next

                    ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
                    dv = ads.Select(New DataSourceSelectArguments)
                    For i = 0 To dv.Count
                        ddl_Quiz_Choose_Multiple.Items.Add(i)
                    Next
                End If

            End If
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub ddl_Quiz_Choose_Unit_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddl_Quiz_Choose_Unit.SelectedIndexChanged
        Dim subnameid As Integer = ddl_Quiz_Choose_Subname.SelectedValue

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

        If ddl_Quiz_Choose_Unit.SelectedItem.Text <> "全部" Then
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1' And [Question_Unit] = '" & ddl_Quiz_Choose_Unit.SelectedValue & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            ddl_Quiz_Choose_Single.Items.Clear()
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1' And [Question_Unit] = '" & ddl_Quiz_Choose_Unit.SelectedValue & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            ddl_Quiz_Choose_Multiple.Items.Clear()
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Multiple.Items.Add(i)
            Next
        Else
            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] = '1')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            ddl_Quiz_Choose_Multiple.Items.Clear()
            ddl_Quiz_Choose_Single.Items.Clear()
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Single.Items.Add(i)
            Next

            ads.SelectCommand = "Select * From [Question] Where ([Question_Subname] = '" & subnameid & "' And [Question_AnsCount] > '1')"
            dv = ads.Select(New DataSourceSelectArguments)
            For i = 0 To dv.Count
                ddl_Quiz_Choose_Multiple.Items.Add(i)
            Next
        End If
    End Sub

    Protected Sub bt_Quiz_Choose_StartTest_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_Quiz_Choose_StartTest.Click
        If ddl_Quiz_Choose_Subname.SelectedValue.Length > 0 Then
            If (Val(ddl_Quiz_Choose_Single.SelectedItem.Text) = 0 And Val(ddl_Quiz_Choose_Multiple.SelectedItem.Text) = 0) Then
                lb_ErrorMessage.Text = "沒有選擇題數"
            ElseIf ddl_Test_Form.SelectedValue = "電腦版" Then
                Response.Redirect("Quiz_pc.aspx?Quizid=" & ddl_Quiz_Choose_Subname.SelectedValue & "&Unit=" & ddl_Quiz_Choose_Unit.SelectedValue & "&S=" & ddl_Quiz_Choose_Single.SelectedItem.Text & "&M=" & ddl_Quiz_Choose_Multiple.SelectedItem.Text)
            Else
                Response.Redirect("Quiz_mobile.aspx?Quizid=" & ddl_Quiz_Choose_Subname.SelectedValue & "&Unit=" & ddl_Quiz_Choose_Unit.SelectedValue & "&S=" & ddl_Quiz_Choose_Single.SelectedItem.Text & "&M=" & ddl_Quiz_Choose_Multiple.SelectedItem.Text)
            End If
        Else
            lb_ErrorMessage.Text = "沒有選擇題組"
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_Quiz_Choose_StartTest.Click
        If ddl_Quiz_Choose_Subname.SelectedValue.Length > 0 Then
            If (Val(ddl_Quiz_Choose_Single.SelectedItem.Text) = 0 And Val(ddl_Quiz_Choose_Multiple.SelectedItem.Text) = 0) Then
                lb_ErrorMessage.Text = "沒有選擇題數"
            ElseIf ddl_Test_Form.SelectedValue = "電腦版" Then
                Response.Redirect("Quiz_pc.aspx?Quizid=" & ddl_Quiz_Choose_Subname.SelectedValue & "&Unit=" & ddl_Quiz_Choose_Unit.SelectedValue & "&S=" & ddl_Quiz_Choose_Single.SelectedItem.Text & "&M=" & ddl_Quiz_Choose_Multiple.SelectedItem.Text)
            Else
                Response.Redirect("Quiz_mobile.aspx?Quizid=" & ddl_Quiz_Choose_Subname.SelectedValue & "&Unit=" & ddl_Quiz_Choose_Unit.SelectedValue & "&S=" & ddl_Quiz_Choose_Single.SelectedItem.Text & "&M=" & ddl_Quiz_Choose_Multiple.SelectedItem.Text)
            End If
        Else
            lb_ErrorMessage.Text = "沒有選擇題組"
        End If
    End Sub
End Class
