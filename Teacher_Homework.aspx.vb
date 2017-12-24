Imports System.Data

Partial Class Teacher_Homework
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

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

        Dim subnameid As Label = CType(e.Item.FindControl("Subname_ID"), Label)
        Dim subname As HyperLink = CType(e.Item.FindControl("Subname"), HyperLink)
        Dim unitlabel As Label = CType(e.Item.FindControl("UnitLabel"), Label)
        Dim classlabel As Label = CType(e.Item.FindControl("classlabel"), Label)
        If Not IsNothing(classlabel) Then classlabel.Text = classlabel.Text.Replace(",", "<br/>")
        Dim Endtime As Label = CType(e.Item.FindControl("Endtime"), Label)
        If Not IsNothing(Endtime) Then Endtime.Text = Endtime.Text.Replace(Mid(Endtime.Text, 1, InStr(Endtime.Text, "午") - 3) & " ", Mid(Endtime.Text, 1, InStr(Endtime.Text, "午") - 3))
        Dim starttime As Label = CType(e.Item.FindControl("starttime"), Label)
        If Not IsNothing(starttime) Then starttime.Text = starttime.Text.Replace(Mid(starttime.Text, 1, InStr(starttime.Text, "午") - 3) & " ", Mid(starttime.Text, 1, InStr(starttime.Text, "午") - 3))
        Dim QuizMode_lb As Label = CType(e.Item.FindControl("QuizMode_lb"), Label)
        If Val(QuizMode_lb.Text) > 0 Then
            QuizMode_lb.Text = "測驗(" & QuizMode_lb.Text & "分鐘)"

            Dim Panel1 As Panel = CType(e.Item.FindControl("Panel1"), Panel)
            Panel1.BackColor = Drawing.Color.Maroon

        Else
            QuizMode_lb.Text = "練習"
            e.Item.BackColor = Drawing.Color.White
        End If

        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & subnameid.Text & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then subname.Text = dv(0)("Subname_Name")
        If unitlabel.Text.ToString.Length = 0 Then unitlabel.Text = "全部"

        Dim Testcount As Label = CType(e.Item.FindControl("Testcount"), Label)
        Dim Count_Single As Label = CType(e.Item.FindControl("Count_Single"), Label)
        Dim Count_Multiple As Label = CType(e.Item.FindControl("Count_Multiple"), Label)
        If InStr(Testcount.Text, ",") > 0 Then
            Dim p As String() = Testcount.Text.Split(",")
            Count_Single.Text = p(0)
            Count_Multiple.Text = p(1)
        Else
            Count_Single.Text = Testcount.Text
            Count_Multiple.Text = 0
        End If
    End Sub

    Protected Sub DataList1_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataList1.PreRender
        nodataLB.Visible = (DataList1.Items.Count = 0)
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As DataListItem = CType(EdBT.NamingContainer, DataListItem)

        Dim Hwid As Label = CType(myRow.FindControl("Hwid"), Label)

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.UpdateCommand = "Update Score Set [Upload] = '' Where [Upload] = '" & Hwid.Text & "'"
        ads.Update()

        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
        ads.DeleteCommand = "DELETE FROM [Homework] WHERE [HW_ID] = '" & Hwid.Text & "'"
        ads.Delete()

        DataList1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As DataListItem = CType(EdBT.NamingContainer, DataListItem)
        Dim Hwid As Label = CType(myRow.FindControl("Hwid"), Label)

        Response.Redirect("Teacher_Homework_Information.aspx?hwid=" & Hwid.Text)
      
    End Sub

    Protected Sub bt_Homework_Insert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_Homework_Insert.Click
        Response.Redirect("Teacher_Homework_Information.aspx")
    End Sub
End Class
