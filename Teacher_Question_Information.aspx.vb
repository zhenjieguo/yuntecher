Imports System.Data

Partial Class Teacher_Question_Information
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

            If Val(Request.QueryString("subname")) <> 0 Then
                bt_QuestionSub_Submit.Text = "確定修改"

                Dim ads As New System.Web.UI.WebControls.SqlDataSource
                ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString



                ads.SelectCommand = "Select * From [Subname] Where ([Subname_ID] = '" & Val(Request.QueryString("subname")) & "')"
                Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
                QusetionSubName.Text = dv(0)("Subname_Name")
                If dv(0)("Publish") Then Radio_Publish.SelectedIndex = 0
            Else
                bt_QuestionSub_Submit.Text = "新增題庫"
            End If

        End If

    End Sub

    Protected Sub bt_QuestionSub_Submit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_QuestionSub_Submit.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString


        ads.SelectCommand = "Select * From [Subname] Where ([Subname_Name] = '" & QusetionSubName.Text & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        If dv.Count <> 0 Then
            Dim pub As Boolean = CType(dv(0)("Publish"), Boolean) '檢查是否有此筆名稱

            If dv(0)("User_ID") = lb_User_ID.Text Then                                                  '檢查是否和自己的重複
                If Val(Request.QueryString("subname")) > 0 And dv(0)("Subname_ID") <> Val(Request.QueryString("subname")) Then '//編輯狀態 相同名字不等於自己

                ElseIf Val(Request.QueryString("subname")) = 0 Then '//新增狀態 相同名字不等於自己
                    Response.Write("<script> alert('題組名稱已和自己的題庫重複，請使用「編輯」功能') </script>")
                    Exit Sub
                End If
            ElseIf dv(0)("User_ID") <> lb_User_ID.Text And pub And Radio_Publish.SelectedValue Then  '檢查是否和他人公開的重複
                Response.Write("<script> alert('題組名稱已和其他老師公開的題庫重複，請使用更換名稱或使用其他老師的題庫') </script>")
                Exit Sub
            End If
        End If


        If bt_QuestionSub_Submit.Text = "確定修改" Then

            ads.SelectCommand = "Select * From [Style] Where ([Style_Name] = '" & DropDownList1.SelectedItem.Text & "' And [Style_Options] = '" & DropDownList1.SelectedValue & "')"
            dv = ads.Select(New DataSourceSelectArguments)

            ads.UpdateCommand = "Update Subname Set [Subname_Name] = '" & QusetionSubName.Text & "' , [Style_ID]= '" & dv(0)("Style_ID") & "' , [Publish] = '" & Radio_Publish.SelectedValue & "', [Retest] = '" & Radio_Retest.SelectedValue & "'  Where ([Subname_ID] = '" & Val(Request.QueryString("subname")) & "')"
            ads.Update()
            Response.Redirect("Teacher_Questions.aspx")

        Else

            ads.SelectCommand = "Select * From [Style] Where ([Style_Name] = '" & DropDownList1.SelectedItem.Text & "' And [Style_Options] = '" & DropDownList1.SelectedValue & "')"
            dv = ads.Select(New DataSourceSelectArguments)

            ads.InsertCommand = "INSERT INTO [Subname] ([Subname_Name], [User_ID],[Style_ID], [Publish], [Retest]) VALUES ('" & QusetionSubName.Text & "', '" & lb_User_ID.Text & "',  '" & dv(0)("Style_ID") & "','" & Radio_Publish.SelectedValue & "', '" & Radio_Retest.SelectedValue & "')"
            ads.Insert()

            Response.Write("<script> alert('題庫新增成功'); location.href='Teacher_Questions.aspx'; </script>")

        End If
    End Sub

    Protected Sub EditStyleBT_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles EditStyleBT.Click
        Response.Write("<script>window.open('Teacher_Question_Information_Style.aspx', '選項類型編輯', config='height=380,width=380');</script>")
    End Sub

    Protected Sub DropDownList1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.DataBound
        If Not IsPostBack And bt_QuestionSub_Submit.Text = "確定修改" Then
            Dim ads As New System.Web.UI.WebControls.SqlDataSource
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

            ads.SelectCommand = "Select * From [Subname] Where ([Subname_ID] = '" & Val(Request.QueryString("subname")) & "')"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

            ads.SelectCommand = "Select * From [Style] Where ([Style_ID] = '" & dv(0)("Style_ID") & "')"
            dv = ads.Select(New DataSourceSelectArguments)
            If dv.Count > 0 Then
                For i = 0 To DropDownList1.Items.Count - 1
                    If DropDownList1.Items(i).Text = dv(0)("Style_Name") And DropDownList1.Items(i).Value = dv(0)("Style_Options") Then
                        DropDownList1.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If
        End If

        SelectValue.Text = DropDownList1.SelectedItem.Value
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        SelectValue.Text = DropDownList1.SelectedItem.Value
    End Sub
End Class
