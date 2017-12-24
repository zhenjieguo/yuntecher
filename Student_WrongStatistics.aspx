<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_WrongStatistics.aspx.vb" Inherits="Student_WrongStatistics" %>
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
       
        <h2>測驗紀錄統計 Statistic of Record</h2>
        <p>這個功能可幫彙總統計題目在所有測驗記錄中的錯誤次數，讓同學們可以針對重點題目加強複習。</p>
        <br />

        <div align="center" style="font-family: 微軟正黑體; font-size: 12pt" >
           
            題庫選擇：<asp:DropDownList 
                ID="Drop_Question" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource1" DataTextField="Subname_ID" 
                DataValueField="Subname_ID">
            </asp:DropDownList>
           
            <br />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Statistics_ID" 
                DataSourceID="SqlDataSource2" Width="100%">
                <ItemTemplate>
                    <table style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; width: 100%">
                        <tr>
                            <td class="style1" 
                                style="border-style: solid dashed none solid; border-width: 3px; border-color: #666666; vertical-align: middle; text-align: center; width: 50px">
                                <asp:Label ID="Label_No" runat="server" Text="Label_No"></asp:Label>
                                <br />
                                (<asp:Label ID="LB_AnsCount" runat="server" Text='<%# Bind("QuestionStyle") %>'></asp:Label>
                                )</td>
                            <td class="style1" colspan="2" 
                                style="border-style: solid dotted solid none; border-width: 3px 1px 1px 3px; border-color: #333333">
                                <asp:Label ID="LB_Question" runat="server" 
                                    Text='<%# Bind("QuestionQuestion") %>'></asp:Label>
                                <br />
                                <br />
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# "~/Question_Pic/" & Eval("QuestionPic") %>' Width="50%" />
                                <br />
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# "~/Question_Pic/" & Eval("QuestionPic") %>' Target="_blank" 
                                    Text='<%# Eval("QuestionPic") %>'></asp:HyperLink>
                                <br />
                                <br />
                                ─(<asp:Label ID="QuestionNumLabel" runat="server" 
                                    Text='<%# Eval("QuestionNum") %>' />
                                )</td>
                        </tr>
                        <tr>
                            <td class="style1" 
                                style="border-style: solid dashed solid solid; border-width: 1px 3px 3px 3px; border-color: #666666; vertical-align: middle; text-align: center; width: 50px">
                                錯<asp:Label ID="WrongTimeLabel" runat="server" 
                                    Text='<%# Eval("WrongTime") %>' />
                                次</td>
                            <td style="background-color: #9393CA; color: #FFFFFF; vertical-align: middle; text-align: center; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333;">
                                正確答案</td>
                            <td style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333; border-right-style: solid; border-right-width: 3px; border-right-color: #333333; text-align: center;">
                                <asp:Label ID="QuestionAnsLabel" runat="server" 
                                    Text='<%# Eval("QuestionAns") %>' />
                            </td>
                        </tr>
                    </table>
<br />
                </ItemTemplate>
            </asp:DataList>
           
        </div>
      </article>
    </section>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Account %>" 
          
          SelectCommand="SELECT DISTINCT [Subname_ID], [User_ID] FROM [Score] WHERE ([User_ID] = @User_ID) ORDER BY [Subname_ID]">
          <SelectParameters>
               <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Account %>" 
          SelectCommand="SELECT * FROM [Statistics] WHERE ([User_ID] = @User_ID) ORDER BY [WrongTime] DESC">
          <SelectParameters>
               <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
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

