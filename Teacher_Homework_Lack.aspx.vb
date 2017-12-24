Imports System.Data

Partial Class Teacher_Homework_Lack
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
            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
            ads.SelectCommand = "SELECT * FROM [User] WHERE ([User_Style] = '學生') ORDER BY [User_Account]"
            Dim dv0 As DataView = ads.Select(New DataSourceSelectArguments)

            ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Homework").ConnectionString
            ads.SelectCommand = "SELECT * FROM [Homework] WHERE [HW_ID] = '" & Request.QueryString("Homeworkid") & "'"
            Dim dv As DataView = ads.Select(New DataSourceSelectArguments)
            Dim Group As String = dv(0)("Student_Group")

            lb_LackHomework_Name.Text = dv(0)("Subname")
            PageInformation_Load(lb_LackHomework_Name.Text)

            For i = dv0.Count - 1 To 0 Step -1
                Dim classlabel As String = dv0(i)("User_Group")
                Dim Userid As String = dv0(i)("User_ID")

                If Not (Group Like "*" & classlabel & "*") Then
                    dv0(i).Delete()
                Else
                    ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Account").ConnectionString
                    ads.SelectCommand = "SELECT * FROM [Score] WHERE ([Upload] = '" & Request.QueryString("Homeworkid") & "')"
                    dv = ads.Select(New DataSourceSelectArguments)

                    Dim Uploaded As New ArrayList
                    For j = 0 To dv.Count - 1
                        Uploaded.Add(dv(j)("User_ID"))
                    Next

                    For j = 0 To Uploaded.Count - 1
                        If Userid = Uploaded(j) Then dv0(i).Delete()
                    Next
                End If
            Next

            GridView1.DataSource = dv0
            GridView1.DataBind()
        End If
    End Sub

    Sub PageInformation_Load(ByVal sub_id As Integer)
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString
        ads.SelectCommand = "SELECT * FROM [Subname] WHERE ([Subname_ID] = '" & sub_id & "')"
        Dim dv As DataView = ads.Select(New DataSourceSelectArguments)

        lb_LackHomework_Name.Text = dv(0)("Subname_Name")
        lb_LackHomework_Date.Text = "統計 :" & Now
    End Sub
End Class
