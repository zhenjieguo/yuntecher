<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Competition_Edit.aspx.vb" Inherits="Teacher_Questions" %>

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
         <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
      <ul>
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font></a></li>
        <li><asp:HyperLink ID="hy_Backend" runat="server">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
      </ul>
       <ul>
        <li><a href="Teacher_Questions.aspx">題庫 <font size="1pt">Question</font></a></li>
        <li><a href="Teacher_Homework.aspx">作業 <font size="1pt">Homework</font></a></li>
      </ul>
       <ul>
        <li><a href="Teacher_Competition.aspx" class="navactive">競賽 <font size="1pt">Competition</font></a></li>        
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
       
        <h2>競賽編輯 Competition Edit</h2>
        <p>您可以對此競賽進行個別的修改、編輯。</p>
        <br />

        <div align="center" >
            <p style="margin-bottom: 10px">
              <div align=center>
        <table width="100%" >
             <tr>
               <td colspan="2">
                   <asp:Label ID="EditCompetition_lb" runat="server" Visible="False"></asp:Label>
               </td>
             </tr>
             <tr>
               <td style="border-style: solid dashed dotted solid; font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-width: 3px; border-color: #666666;">
                          比賽題組
               </td>
               <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; vertical-align: middle; text-align: left; border-width: 3px; border-color: #666666; border-right-style: solid; border-bottom-style: dotted; border-top-style: solid;">
                    <asp:DropDownList ID="Drop_Question" runat="server" 
                       DataSourceID="SqlDataSource2" DataTextField="Subname_Name" 
                       DataValueField="Subname_ID" AutoPostBack="True">
                    </asp:DropDownList>
                          
                    <asp:Label ID="Question_lb" runat="server"></asp:Label>
                </td>
             </tr>
             <tr>
                 <td style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-width: 3px; border-color: #666666; border-left-style: solid; border-right-style: dashed; border-bottom-style: dotted;">
                          結束時間
                 </td>
                 <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; vertical-align: middle; text-align: left; border-width: 3px; border-color: #666666; border-right-style: solid; border-bottom-style: dotted">
                               <asp:DropDownList ID="Drop_Year" runat="server">
                               </asp:DropDownList>
                               <asp:DropDownList ID="Drop_Month" runat="server" AutoPostBack="True">
                                   <asp:ListItem>1</asp:ListItem>
                                   <asp:ListItem>2</asp:ListItem>
                                   <asp:ListItem>3</asp:ListItem>
                                   <asp:ListItem>4</asp:ListItem>
                                   <asp:ListItem>5</asp:ListItem>
                                   <asp:ListItem>6</asp:ListItem>
                                   <asp:ListItem>7</asp:ListItem>
                                   <asp:ListItem>8</asp:ListItem>
                                   <asp:ListItem>9</asp:ListItem>
                                   <asp:ListItem>10</asp:ListItem>
                                   <asp:ListItem>11</asp:ListItem>
                                   <asp:ListItem>12</asp:ListItem>
                               </asp:DropDownList>
                               <asp:DropDownList ID="Drop_Day" runat="server" AutoPostBack="True">
                               </asp:DropDownList>
                               &nbsp;<asp:Label ID="StopTime" runat="server" Visible="False"></asp:Label>
                               <asp:DropDownList ID="Drop_AMPM" runat="server">
                                   <asp:ListItem>上午</asp:ListItem>
                                   <asp:ListItem Selected="True">下午</asp:ListItem>
                               </asp:DropDownList>
                               <asp:DropDownList ID="Drop_Hors" runat="server">
                                   <asp:ListItem>1</asp:ListItem>
                                   <asp:ListItem>2</asp:ListItem>
                                   <asp:ListItem>3</asp:ListItem>
                                   <asp:ListItem>4</asp:ListItem>
                                   <asp:ListItem>5</asp:ListItem>
                                   <asp:ListItem>6</asp:ListItem>
                                   <asp:ListItem>7</asp:ListItem>
                                   <asp:ListItem>8</asp:ListItem>
                                   <asp:ListItem>9</asp:ListItem>
                                   <asp:ListItem>10</asp:ListItem>
                                   <asp:ListItem>11</asp:ListItem>
                                   <asp:ListItem Selected="True">12</asp:ListItem>
                               </asp:DropDownList>
                               時<asp:DropDownList ID="Drop_Min" runat="server">
                               </asp:DropDownList>
                               分</td>
                  </tr>
                  <tr>
                      <td  
                          style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-width: 3px; border-color: #666666; border-left-style: solid; border-right-style: dashed; border-bottom-style: solid;">
                          備註說明</td>
                      <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; vertical-align: middle; text-align: left; border-width: 3px; border-color: #666666; border-right-style: solid; border-bottom-style: solid">
                          <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine"></asp:TextBox>
                      </td>
                  </tr>
                 
                  <tr>
                      <td  colspan="2">
                          &nbsp;</td>
                  </tr>
                  <tr>
                      <td class="style7" colspan="2" align="center">
                          <p style="margin-bottom: 10px"><asp:Button ID="Button3" runat="server" Text="修改" /></p>
                          <p style="margin-bottom: 10px"><asp:Button ID="Button4" runat="server" Text="取消" /></p>
                      </td>
                  </tr>
              </table></div>
              
            
            </p>

        </div>
      </article>
    </section>
    

  </div>

  <!--main-->
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Question %>" 
                  SelectCommand="SELECT DISTINCT * FROM [Subname] WHERE (([User_ID] = @User_ID) OR ([Publish] = @Publish))">
                  <SelectParameters>
                      <asp:SessionParameter Name="User_ID" SessionField="User_ID" Type="Int32" />
                      <asp:Parameter DefaultValue="True" Name="Publish" Type="Boolean" />
                  </SelectParameters>
              </asp:SqlDataSource>
  <!--main-->
   <div class="divide-top">
    <footer class="grid-wrap">
      <nav class="grid col-full">
        <ul>
          <li>Copyright©         <li>CSS：<a href="http://www.free-css.com/" target="blank"> Free Css </a>- <a href="http://www.free-css.com/free-css-templates/page163/designa-2.01" target="blank">Sylvain Lafitte</a></li>
          
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
