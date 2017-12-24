Imports System.Data

Partial Class Student_Record_Wrong
    Inherits System.Web.UI.Page

    Dim Num As Integer = 0

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

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        'If e.Item.ItemType = DataControlRowType.DataRow Then
        Dim Label_No As Label = CType(e.Item.FindControl("Label_No"), Label)
        '    Label_No.Text = e.Item.ItemIndex + 1

        Dim WrongAns As Label = CType(e.Item.FindControl("Wrong_AnsLabel"), Label)
        Dim RightAns As Label = CType(e.Item.FindControl("Right_AnsLabel"), Label)
        Dim Questionid As Label = CType(e.Item.FindControl("Label_QuestionID"), Label)
        Dim Unit As Label = CType(e.Item.FindControl("Label_Unit"), Label)
        Dim Reamark As Label = CType(e.Item.FindControl("Label_Remark"), Label)
        Dim Question As Label = CType(e.Item.FindControl("Label_Question"), Label)
        Dim HyperLink1 As HyperLink = CType(e.Item.FindControl("HyperLink1"), HyperLink)
        Dim Image1 As Image = CType(e.Item.FindControl("Image1"), Image)

        If WrongAns.Text.Length = 0 Then WrongAns.Text = "無"

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "Select * From [Question] Where [Question_ID] = '" & Questionid.Text & "'"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        RightAns.Text = dv(0)("Question_Ans")
        Unit.Text = dv(0)("Question_Unit")
        Reamark.Text = dv(0)("Question_Remark")
        Question.Text = dv(0)("Question_Question")

        Try
            HyperLink1.NavigateUrl = "~/Question_Pic/" & dv(0)("Question_Picture")
            HyperLink1.Text = dv(0)("Question_Picture")
            Image1.ImageUrl = "~/Question_Pic/" & dv(0)("Question_Picture")

            If Image1.ImageUrl = "~/Question_Pic/" Then
                HyperLink1.Visible = False
                Image1.Visible = False
            End If
        Catch ex As Exception
            HyperLink1.Visible = False
            Image1.Visible = False
        End Try


        ads.SelectCommand = "Select * From [Subname] Where [Subname_ID] = '" & dv(0)("Question_Subname") & "'"
        dv = ads.Select(New DataSourceSelectArguments)
        ads.SelectCommand = "Select * From [Style] Where [Style_ID] = '" & dv(0)("Style_ID") & "'"
        dv = ads.Select(New DataSourceSelectArguments)

        Dim t As String() = dv(0)("Style_Options").ToString.Split(",")
        For i = 0 To UBound(t)
            Question.Text = Question.Text.Replace("(" & t(i) & ")", "<br/>(" & t(i) & ")")
        Next
        Num += 1
        Label_No.Text = Num
        'End If
    End Sub
End Class
