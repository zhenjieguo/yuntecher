Imports System.Data

Partial Class Teacher_Question_View
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
            ads.SelectCommand = "Select * From Subname Where [Subname_ID] = '" & Request.QueryString("Questionid") & "'"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            lb_Question_Subname.Text = dv(0)("Subname_Name")
        End If


    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim Question_Img1 As Image = CType(e.Row.FindControl("Image1"), Image)
            If Question_Img1.ImageUrl = "~/Question_Pic/" Then Question_Img1.Visible = False

            Dim lb_Question_AnsCount As Label = CType(e.Row.FindControl("Question_AnsCountLabel"), Label)
            If Val(lb_Question_AnsCount.Text) > 1 Then
                lb_Question_AnsCount.Text = "複選"
            Else
                lb_Question_AnsCount.Text = "單選"
            End If

            Dim lb_Question_Question As Label = CType(e.Row.FindControl("Question_QuestionLabel"), Label)
            lb_Question_Question.Text = Replace(lb_Question_Question.Text, "@@@", "'")
            lb_Question_Question.Text = Replace(lb_Question_Question.Text, vbCrLf, "<br/>")

            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & Request.QueryString("Questionid") & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            ads.SelectCommand = "SELECT * FROM [Style] WHERE ([Style_ID] = '" & dv(0)("Style_ID") & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            Dim t As String = dv(0)("Style_Options")
            Dim options As String() = Split(t, ",")

            For i = 0 To UBound(options)
                lb_Question_Question.Text = lb_Question_Question.Text.Replace("(" & options(i) & ")", "<br/>(" & options(i) & ")")
            Next
        End If
    End Sub

    Protected Sub lb_Row_Del_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim Question_IDLabel As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("Question_IDLabel"), Label)
        Dim dv As DataView
        Dim del_info As Boolean '//true = 單選


        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_ID] = '" & Question_IDLabel.Text & "')"
        dv = ads.Select(New DataSourceSelectArguments)
        If Val(dv(0)("Question_AnsCount")) > 1 Then
            del_info = False
        Else
            del_info = True
        End If


        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
        ads.DeleteCommand = "Delete FROM [Wrong] WHERE ([Question_ID] = '" & Question_IDLabel.Text & "')"
        ads.Delete()


        Do
            ads.SelectCommand = "SELECT * FROM [Wrong] WHERE ([Question_ID] = '" & Question_IDLabel.Text & "')"
            dv = ads.Select(New DataSourceSelectArguments)
        Loop Until dv.Count = 0

        Chekc_Homework_TestQuestionCount(del_info)
        CheckBoxList1_SelectedIndexChanged(Nothing, Nothing)
    End Sub

    Sub Chekc_Homework_TestQuestionCount(ByVal Sing As Boolean)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString

        ads.SelectCommand = "SELECT * FROM [Homework] WHERE ([Subname] = '" & Request.QueryString("Questionid") & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        For i = 0 To dv.Count - 1
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

            Dim Singel, Multiple As Integer

            If Val(dv(i)("Subname_Unit")) > 0 Then
                ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_SubName] = '" & dv(i)("Subname") & "') And ([Question_Unit] = '" & dv(i)("Subname_Unit") & "')" & " And ([Question_AnsCount] = '1')"
            Else
                ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_SubName] = '" & dv(i)("Subname") & "')" & " And ([Question_AnsCount] = '1')"
            End If
            Dim dv_Ques As DataView = ads.Select(New DataSourceSelectArguments)
            Singel = dv_Ques.Count

            If Val(dv(i)("Subname")) > 0 Then
                ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_SubName] = '" & dv(i)("Subname") & "') And ([Question_Unit] = '" & dv(i)("Subname_Unit") & "')" & " And ([Question_AnsCount] > '1')"
            Else
                ads.SelectCommand = "SELECT * FROM [Question] WHERE ([Question_SubName] = '" & dv(i)("Subname") & "')" & " And ([Question_AnsCount] > '1')"
            End If
            dv_Ques = ads.Select(New DataSourceSelectArguments)
            Multiple = dv_Ques.Count

            If Sing Then
                Singel -= 1
            Else
                Multiple -= 1
            End If

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            If Multiple + Singel > 0 Then
                Dim old_TestCount As String() = dv(i)("TestCount").ToString.Split(",")

                If old_TestCount(0) > Singel Then old_TestCount(0) = Singel
                If old_TestCount(1) > Multiple Then old_TestCount(1) = Multiple

                ads.UpdateCommand = "UPDATE [Homework] SET [TestCount] = '" & old_TestCount(0) & "," & old_TestCount(1) & "' WHERE [HW_ID] = '" & dv(i)("HW_ID") & "'"
            Else
                If InStr(dv(i)("TestCount"), ",") > 0 Then
                    ads.UpdateCommand = "UPDATE [Homework] SET [TestCount] = '0,0' WHERE [HW_ID] = '" & dv(i)("HW_ID") & "'"
                Else
                    ads.UpdateCommand = "UPDATE [Homework] SET [TestCount] = '0' WHERE [HW_ID] = '" & dv(i)("HW_ID") & "'"
                End If
            End If

            ads.Update()

        Next
    End Sub

    Protected Sub CheckBoxList1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList1.PreRender
        If Not IsPostBack Then
            For i = 0 To CheckBoxList1.Items.Count - 1
                If Request.QueryString("unit") Like ("*" & CheckBoxList1.Items(i).Text & "*") Then CheckBoxList1.Items(i).Selected = True
            Next
        End If
    End Sub

    Protected Sub CheckBoxList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles CheckBoxList1.SelectedIndexChanged
        If IsPostBack Then
            Dim Url_String As String
            For i = 0 To CheckBoxList1.Items.Count - 1
                If CheckBoxList1.Items(i).Selected = True Then
                    Url_String &= CheckBoxList1.Items(i).Text & "-"
                End If
            Next
            Try
                If Url_String.Length > 0 Then Url_String = Mid(Url_String, 1, Len(Url_String) - 1)

            Catch ex As Exception

            End Try

            If InStr(Request.RawUrl, "unit=") > 0 Then
                Response.Redirect(Request.RawUrl.Replace("unit=" & Request.QueryString("unit"), "unit=" & Url_String))
            Else
                Response.Redirect(Request.RawUrl & "&unit=" & Url_String)
            End If

        End If
    End Sub

    Protected Sub lb_Row_Edit_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As GridViewRow = CType(EdBT.NamingContainer, GridViewRow)
        Dim Question_IDLabel As Label = CType(GridView1.Rows(myRow.RowIndex).FindControl("Question_IDLabel"), Label)

        Response.Write("<script>window.open('Teacher_Question_Edit.aspx?questionid=" & Question_IDLabel.Text & "', '選項類型編輯', config='height=680,width=1000');</script>")
    End Sub

    Protected Sub bt_DataBind_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_DataBind.Click
        GridView1.DataBind()
    End Sub

    Protected Sub bt_QuestionFile_Upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_QuestionFile_Upload.Click
        Response.Redirect("Teacher_Question_Insert.aspx?Questionid=" & Request.QueryString("Questionid"))
    End Sub
End Class
