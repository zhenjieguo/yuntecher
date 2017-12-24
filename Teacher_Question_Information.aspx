<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Question_Information.aspx.vb" Inherits="Teacher_Question_Information" %>

<!DOCTYPE html>

<html class="no-js" lang="en">

<head>

<title>Yuntecher</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">

<link rel="shortcut icon" type="WebImage/System/x-icon" href="WebImage/System/yuntech.ico">
<link rel="shortcut icon" type="WebImage/System/png" href="WebImage/System/favicon.png">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">

    <style type="text/css">


    .style1
    {
        width: 100%;
    }
        .style17
        {
            width: 293px;
        }
    </style>

</head>



<body>
<form id="form1" runat="server">
<div class="container">
  <header id="navtop"> 
  
  	<a href="Index.aspx" class="logo fleft"> <img src="WebImage/System/logo.png" alt=""> </a> <!--Logo Title><!-->
  
     <nav class="fright">  <!--Head Link><!-->
       <ul>
        <li><asp:Label ID="lb_UserName" runat="server" Text="使用者"></asp:Label> 您好<asp:Label 
                ID="lb_User_ID" runat="server" Visible="False"></asp:Label></li>
         <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
      <ul>
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font></a></li>
        <li><asp:HyperLink ID="hy_Backend" runat="server">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
      </ul>
      <ul>
        <li><a href="Teacher_Questions.aspx" class="navactive">題庫 <font size="1pt">Question</font></a></li>
        <li><a href="Teacher_Homework.aspx">作業 <font size="1pt">Homework</font></a></li>
      </ul>
       <ul>
        <li><a href="Teacher_Competition.aspx">競賽 <font size="1pt">Competition</font></a></li>        
        <li><a href="PasswordChange.aspx">密碼 <font size="1pt">Password</font></a></li>
      </ul>
    </nav>
    
  </header>
  
  <div class="about-page main grid-wrap">
    <header class="grid col-full">
      <hr>
      <p class="fleft"><asp:SiteMapPath ID="SiteMapPath1" runat="server">
          <CurrentNodeStyle Font-Names="微軟正黑體" ForeColor="#333333" />
          <NodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          <RootNodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          </asp:SiteMapPath></p>
    </header>

     
  <section class="grid col-three-quarters mq2-col-full" > 
       <article id="navteam">
       
        <h2>題庫設定 Question Manage</h2>
        <p>您可在下方設定題庫的資訊。</p>
        <p>▲選項類型為題目中的選項(如A,B,C,D或1,2,3等)，可點擊「編輯」新增或刪除選項類型。</p>
        <p>▲公開測驗設定是否將此題庫公開給「所有」同學測驗，及提供所有老師能以此題本為作業。</p>

        <br />

        <div align="center" >


            

            
            <table cellpadding="0" cellspacing="0" class="style1">
                <tr>
                    <td>
                        <table cellpadding="0" cellspacing="0" 
                            style="width: 100%; font-family: 微軟正黑體; font-size: 12pt; color: #333333">
                            <tr>
                                <td class="style17" 
                                    
                                    style="border-style: solid dashed dashed solid; border-color: #D1A98F; border-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; ">
                                    試題名稱：</td>
                                <td align="left" 
                                    
                                    style="padding: 6px; border-style: solid solid dashed none; border-color: #D1A98F; border-width: 3px; vertical-align: middle; text-align: left; background-color: #FAF1E7; ">
                                    <asp:TextBox ID="QusetionSubName" runat="server" CssClass="style14"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="QusetionSubName" ErrorMessage="*必填" Font-Names="微軟正黑體" 
                                        Font-Size="10pt" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17" 
                                    
                                    style="border-color: #D1A98F; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed; border-bottom-style: dashed; border-bottom-width: 3px;">
                                    選項類型：</td>
                                <td align="left" 
                                    
                                    style="padding: 6px; border-width: 3px; border-color: #D1A98F; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid; border-bottom-style: dashed;">
                                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                        DataSourceID="SqlDataSource4" DataTextField="Style_Name" 
                                        DataValueField="Style_Options">
                                    </asp:DropDownList>
                                    <asp:Label ID="SelectValue" runat="server" Font-Names="微軟正黑體" Font-Size="10pt" 
                                        Font-Underline="False" ForeColor="#333333"></asp:Label>
                                    &nbsp;<asp:Button ID="EditStyleBT" runat="server" Text="編輯" 
                                        CausesValidation="False" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style17" 
                                    
                                    style="border-color: #D1A98F; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed; border-bottom-style: dashed; border-bottom-width: 3px;">
                                    重複測驗：</td>
                                <td align="left" 
                                    
                                    style="padding: 6px; border-width: 3px; border-color: #D1A98F; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid; border-bottom-style: dashed;">
                                    <asp:RadioButtonList ID="Radio_Retest" runat="server" Font-Names="微軟正黑體" 
                                        Font-Overline="False" Font-Size="10pt" ForeColor="#333333">
                                        <asp:ListItem Value="True" Selected="True">允許(無法用於考試測驗，可反覆練習)</asp:ListItem>
                                        <asp:ListItem Value="False">禁止(無法當作練習測驗，只許一次測驗)</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td class="style17" 
                                    
                                    style="border-color: #D1A98F; border-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-right-style: dashed; border-bottom-style: solid;">
                                    公開測驗：</td>
                                <td align="left" 
                                    
                                    style="padding: 6px; border-color: #D1A98F; border-width: 3px; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid; border-bottom-style: solid;">
                                    <asp:RadioButtonList ID="Radio_Publish" runat="server" Font-Names="微軟正黑體" 
                                        Font-Overline="False" Font-Size="10pt" ForeColor="#333333">
                                        <asp:ListItem Value="True">公開(允許其他老師檢視、使用此題庫)</asp:ListItem>
                                        <asp:ListItem Selected="True" Value="False">隱私(禁止其他老師檢視、使用此題庫)</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center; margin-top: 10px; padding-top: 6px;">
                                    <asp:Button ID="bt_QuestionSub_Submit" runat="server" Text="新增題庫" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>


            

            
        </div>
      </article>
    </section>
    
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Question %>" 
                  
                  SelectCommand="SELECT * FROM [Question] WHERE (([Question_SubName] = @Question_SubName) AND ([Question_Uploader] = @Question_Uploader))" 
                  DeleteCommand="DELETE FROM [Question] WHERE [Question_ID] = @Question_ID" 
                  InsertCommand="INSERT INTO [Question] ([Question_SubName], [Question_Style], [Question_Unit], [Question_Ans], [Question_AnsCount], [Question_Question], [Question_Picture], [Question_Uploader], [Question_Remark]) VALUES (@Question_SubName, @Question_Style, @Question_Unit, @Question_Ans, @Question_AnsCount, @Question_Question, @Question_Picture, @Question_Uploader, @Question_Remark)" 
                  UpdateCommand="UPDATE [Question] SET  [Question_Style] = @Question_Style, [Question_Unit] = @Question_Unit, [Question_Ans] = @Question_Ans, [Question_Question] = @Question_Question, [Question_Remark] = @Question_Remark WHERE [Question_ID] = @Question_ID">
                  <DeleteParameters>
                      <asp:Parameter Name="Question_ID" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="Question_SubName" Type="String" />
                      <asp:Parameter Name="Question_Style" Type="Int32" />
                      <asp:Parameter Name="Question_Unit" Type="String" />
                      <asp:Parameter Name="Question_Ans" Type="String" />
                      <asp:Parameter Name="Question_AnsCount" Type="Int32" />
                      <asp:Parameter Name="Question_Question" Type="String" />
                      <asp:Parameter Name="Question_Picture" Type="String" />
                      <asp:Parameter Name="Question_Uploader" Type="Int32" />
                      <asp:Parameter Name="Question_Remark" Type="String" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:ControlParameter ControlID="QusetionSubName" Name="Question_SubName" 
                          PropertyName="Text" Type="String" />
                      <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
                  </SelectParameters>
                  <UpdateParameters>
                     <asp:Parameter Name="Question_Style" Type="Int32" />
                      <asp:Parameter Name="Question_Unit" Type="String" />
                      <asp:Parameter Name="Question_Ans" Type="String" />
                     <asp:Parameter Name="Question_Question" Type="String" />
                      <asp:Parameter Name="Question_Remark" Type="String" />
                      <asp:Parameter Name="Question_ID" Type="Int32" />
                  </UpdateParameters>
              </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Question %>" 
                  SelectCommand="SELECT * FROM [Style] ORDER BY [Style_Name]">
              </asp:SqlDataSource>
      
  </div>

  <!--main-->
  
  <!--main-->
   <div class="divide-top">
    <footer class="grid-wrap">
      <nav class="grid col-full">
        <ul>
          <li>Copyright© </li>
           <li>CSS：<a href="http://www.free-css.com/" target="blank"> Free Css </a>- <a href="http://www.free-css.com/free-css-templates/page163/designa-2.01" target="blank">Sylvain Lafitte</a></li>
          
        </ul>
      </nav>
    </footer>
    
  </div>
  
</div>


<!-- Javascript - jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]><script src="js/selectivizr.js"></script><![endif]-->
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/scripts.js"></script>
</form>
</body>
</html>
