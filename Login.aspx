<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

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
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font><asp:Label ID="lb_Histroy" 
                runat="server" Visible="False"></asp:Label>
            </a></li>
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

    <section class="grid col-three-quarters mq2-col-full"  align=center> 
     <article id="navteam">
        <h2>登入 Login</h2>
        <p>現在就用教師提供的線上測驗帳號密碼進行登入，獲得更多學習的利器吧！</p>
        <BR>
        <div style="margin-bottom: 8px"><p><asp:TextBox ID="tb_Account" runat="server" placeholder="帳號 Account"></asp:TextBox></p></div>
        <p><asp:TextBox ID="tb_Password" runat="server" placeholder="密碼 Password" TextMode="Password"></asp:TextBox></p>
       
        <asp:Panel ID="Panel_Check" runat="server" Visible="False">
            <br />
            <div  style="margin-bottom: 3px"><asp:Image ID="imgChkCode" ImageUrl="CheckImageCode.aspx" runat="server" Height="40px" /></div>
            <p><asp:TextBox ID="tb_Check" runat="server" placeholder="驗證碼 Captcha" ></asp:TextBox></p>
        </asp:Panel>
        <br />
        <asp:CheckBox ID="ckb_Remeberme" runat="server" Text="記住我 Remeber"></asp:CheckBox>
        <br />
        <div align="center" style="margin-top: 8px"><asp:Button ID="bt_Login" runat="server" Text="登入"></asp:Button></div>
      </article>
    </section>
  </div>


  <!--main-->
<div class="divide-top">
    <footer class="grid-wrap" >
      <nav class="grid col-full" >
        <ul>
          <li>Copyright©</li>
          <li>CSS：<a href="http://www.free-css.com/" target="blank"> Free Css </a>- <a href="http://www.free-css.com/free-css-templates/page163/designa-2.01" target="blank">Sylvain Lafitte</a></li>
          
        </ul>
      </nav>
    </footer>
    
  </div>

<!-- Javascript - jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]><script src="js/selectivizr.js"></script><![endif]-->
<script src="js/scripts.js"></script>
</form>
</body>
</html>
