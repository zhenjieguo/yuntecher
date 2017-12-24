Imports System.Data

Partial Class Student_TestRecord
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
        Dim Subname As Label = CType(e.Item.FindControl("Subname"), Label)
        Dim SubnameID As Label = CType(e.Item.FindControl("Subname_IDLabel"), Label)
        Dim scoreid As Label = CType(e.Item.FindControl("Label_ScoreID"), Label)
        Dim ScoreLabel As Label = CType(e.Item.FindControl("ScoreLabel"), Label)
        Dim UnitLabel As Label = CType(e.Item.FindControl("UnitLabel"), Label)
        Dim bt_DataList_View As Button = CType(e.Item.FindControl("bt_DataList_View"), Button)

        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & SubnameID.Text & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
        If dv.Count > 0 Then Subname.Text = dv(0)("Subname_Name")

        Dim CheckBox_Upload As CheckBox = CType(e.Item.FindControl("CheckBox_Upload"), CheckBox)
        Dim Image_Upload As Image = CType(e.Item.FindControl("Image_Upload"), Image)
        If CheckBox_Upload.Text <> "" Then
            Image_Upload.ImageUrl = "~/WebImage/Icon_Check.png"
        Else
            Image_Upload.ImageUrl = "~/WebImage/Icon_Cross.png"
        End If

        Dim Testcount As Label = CType(e.Item.FindControl("TestCountLabel"), Label)
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

        If UnitLabel.Text = "" Then
            UnitLabel.Text = "全部"
        Else
            UnitLabel.Text = "第" & UnitLabel.Text & "單元"
        End If

        If Val(ScoreLabel.Text) = 100 Then
            bt_DataList_View.Visible = False
        End If
    End Sub

    Protected Sub bt_DataList_View_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As DataListItem = CType(EdBT.NamingContainer, DataListItem)
        Dim NoNum As Label = CType(DataList1.Items(myRow.ItemIndex).FindControl("Score_IDLabel"), Label)
        Dim LabelSubname As Label = CType(DataList1.Items(myRow.ItemIndex).FindControl("Subname_IDLabel"), Label)
        Dim UnitLabel As Label = CType(DataList1.Items(myRow.ItemIndex).FindControl("UnitLabel"), Label)
        Session("TestRecord") = LabelSubname.Text & " 單元" & UnitLabel.Text
        Response.Redirect("Student_Record_Wrong.aspx?Scoreid=" & NoNum.Text)
    End Sub

    Protected Sub bt_DataList_Delete_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim EdBT As Button = CType(sender, Button)
        Dim myRow As DataListItem = CType(EdBT.NamingContainer, DataListItem)
        Dim NoNum As Label = CType(DataList1.Items(myRow.ItemIndex).FindControl("Score_IDLabel"), Label)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
        ads.DeleteCommand = "Delete From Wrong Where [Score_ID] = '" & NoNum.Text & "'"
        ads.Delete()
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
        ads.DeleteCommand = "Delete From Score Where [Score_ID] = '" & NoNum.Text & "'"
        ads.Delete()
        DataList1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Response.Redirect("Student_WrongStatistics.aspx")
    End Sub

    Protected Sub DataList1_PreRender(sender As Object, e As System.EventArgs) Handles DataList1.PreRender
        Button1.Visible = (DataList1.Items.Count > 0)
    End Sub
End Class
