
Partial Class Teacher_Question_Insert
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

    Protected Sub bt_QuestionFile_Upload_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles bt_QuestionFile_Upload.Click
        Dim ads As New System.Web.UI.WebControls.SqlDataSource
        ads.ConnectionString = System.Web.Configuration.WebConfigurationManager.ConnectionStrings("Question").ConnectionString

        Dim success As Single
        Dim s As String
        Dim Filename As String = FileUpload1.FileName



        If Filename.Length = 0 Then
            Response.Write("<script> alert('請選擇欲上傳之檔案') </script>")
            Exit Sub
        ElseIf Mid(Filename, InStrRev(Filename, ".") + 1) <> "txt" Then
            Response.Write("<script> alert('僅限上傳Txt文字檔') </script>")
            Exit Sub
        Else
            Dim t As String() = Session("User").Split("/")
            Dim st As String = MapPath("Temporarily/" & t(0) & ".txt")
            FileUpload1.SaveAs(st)

            '----------------讀取上傳的逗點檔案進dat ArrayList--------------
            Dim sr As New System.IO.StreamReader(st)

            Dim dat As New ArrayList
            Dim startload As Boolean = False

            Do While sr.Peek > -1
                Dim line As String = sr.ReadLine
                If startload And line <> "" Then
                    dat.Add(line.Split(vbTab))
                ElseIf line Like "*序號*單元*答案*題目*" Then
                    startload = True
                End If
            Loop

            sr.Close()
            System.IO.File.Delete(st)
            '----------------------------------------------------------------
            If dat.Count = 0 Then
                Response.Write("<script> alert('資料檔格式錯誤，請使用範本檔案。共匯入0筆資料。') </script>")
                Exit Sub
            Else


                For i = 0 To dat.Count - 1
                    Try

                        Dim ok As Boolean = True '資料完整
                        For j = 1 To 3
                            If dat(i)(j) = "" Then
                                ok = False
                            End If
                            'If Val(dat(i)(1)) <> dat(i)(1) Then
                            '    ok = False
                            'End If
                        Next


                        If ok Then
                            '--------------------讀取此筆資料並加入Account中-----------------
                            Dim AnsCount As Single = 1
                            Dim ans As String = dat(i)(2)
                            Dim temp As String
                            AnsCount = ans.Length
                            temp = Mid(ans, 1, 1)
                            For x = 2 To ans.Length
                                temp = "," & Mid(ans, x, 1)
                            Next
                            ans = temp

                            Dim qs As String = dat(i)(3)
                            qs = qs.Replace("'", "@@@")
                            If Asc(Mid(qs, 1, 1)) = 34 And Asc(Mid(qs, qs.Length, 1)) = 34 Then qs = Mid(qs, 2, qs.Length - 1)


                            ads.InsertCommand = "INSERT INTO [Question] ([Question_SubName], [Question_Unit], [Question_Ans], [Question_AnsCount], [Question_Question],[Question_Remark]) VALUES ('" & Request.QueryString("Questionid") & "' , '" & dat(i)(1) & "', '" & dat(i)(2) & "', '" & AnsCount & "', '" & qs & "','" & dat(i)(0) & "')"
                            ads.Insert()
                            '-------------------------------------------------------------------
                            success += 1
                            s &= dat(i)(0) & ","
                        End If
                    Catch ex As Exception

                    End Try
                Next
                '----------------------------------------------------------------
            End If
        End If

        Response.Write("<script> alert('共匯入" & success & "筆資料。\n\n" & s & "');history.go(-2);</script>")
    End Sub
End Class
