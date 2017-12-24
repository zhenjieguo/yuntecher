<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_Record_Wrong.aspx.vb" Inherits="Student_Record_Wrong" %>

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
        {}
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
        
      </ul>
      <ul>
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font></a></li>
        <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
      <ul>
        <li><asp:HyperLink ID="hy_Backend" runat="server">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
        <li><a href="Student_Homework.aspx">作業 <font size="1pt">Homework</font></a></li>
      </ul>
       <ul>
        <li><a href="Student_TestRecord.aspx" class="navactive">紀錄 <font size="1pt">Record</font></a></li>        
        <li><a href="Student_Competition.aspx">競賽 <font size="1pt">Competition</font></a></li>
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
       
        <h2>測驗紀錄總覽 Record of Test</h2>
        <p>以下內容為所有按下「記錄」按鈕或教師作業的作答資訊紀錄。</p>
        <br />

        <div align="center" >
           
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Wrong_ID" 
                DataSourceID="SqlDataSource1" Width="100%">
                <ItemTemplate>
                    <asp:Label ID="Wrong_IDLabel" runat="server" Text='<%# Eval("Wrong_ID") %>' 
                        Visible="False" />
                    <asp:Label ID="Score_IDLabel" runat="server" Text='<%# Eval("Score_ID") %>' 
                        Visible="False" />
                    <asp:Label ID="Question_IDLabel" runat="server" 
                        Text='<%# Eval("Question_ID") %>' Visible="False" />
                  <br />
                    <table  
                        style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; width: 100%">
                        <tr>
                            <td class="style1" rowspan="2" 
                                style="border-style: solid dashed solid solid; border-width: 3px; border-color: #666666; vertical-align: middle; text-align: center; width: 50px">
                                <asp:Label ID="Label_No" runat="server" Text="Label_No"></asp:Label>
                            </td>
                            <td class="style1" colspan="4" 
                                
                                
                                style="border-style: solid solid solid none; border-width: 3px 3px 1px 3px; border-color: #333333">
                                <asp:Label ID="Label_Question" runat="server"></asp:Label>
                                <br />
                                <br />
                                <asp:Image ID="Image1" runat="server" Width="50%" />
                                <br />
                                <asp:HyperLink ID="HyperLink1" runat="server" Target="_blank"></asp:HyperLink>
                                <br />
                                <br />
                                ─(單元<asp:Label ID="Label_Unit" runat="server"></asp:Label>
                                -<asp:Label ID="Label_Remark" runat="server"></asp:Label>
                                )<asp:Label ID="Label_QuestionID" runat="server" 
                                    Text='<%# Bind("Question_ID") %>' Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="background-color: #9393CA; color: #FFFFFF; vertical-align: middle; text-align: center; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333;">
                                你的答案</td>
                            <td style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333; text-align: center;">
                                <asp:Label ID="Right_AnsLabel" runat="server" Text="Right_AnsLabel"></asp:Label>
                            </td>
                            <td style="background-color: #9393CA; color: #FFFFFF; vertical-align: middle; text-align: center; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333;">
                                正確答案</td>
                            <td style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333; border-right-style: solid; border-right-width: 3px; border-right-color: #333333; text-align: center;">
                                <asp:Label ID="Wrong_AnsLabel" runat="server" Text='<%# Eval("Wrong_Ans") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
           
        </div>
      </article>
    </section>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Homework %>" 
                  
                  SelectCommand="SELECT * FROM [Wrong] WHERE ([Score_ID] = @Score_ID) ORDER BY [Question_ID]">
                  <SelectParameters>
                      <asp:QueryStringParameter Name="Score_ID" QueryStringField="Scoreid" 
                          Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>
  </div>

  <!--main-->
  
  <!--main-->
   <div class="divide-top">
    <footer class="grid-wrap">
      <nav class="grid col-full">
        <ul>
          <li>Copyright©</li>
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
