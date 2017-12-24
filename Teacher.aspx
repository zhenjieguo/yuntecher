<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher.aspx.vb" Inherits="Teacher" %>

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
        <li><asp:Label ID="lb_UserName" runat="server" Text="使用者"></asp:Label> 您好</li>
         <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
      <ul>
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font></a></li>
        <li><asp:HyperLink ID="hy_Backend" runat="server" class="navactive">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
      </ul>
      <ul>
        <li><a href="Teacher_Questions.aspx">題庫 <font size="1pt">Question</font></a></li>
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
          <RootNodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          </asp:SiteMapPath></p>
    </header>

     <section class="works grid-wrap">

      <figure class="grid col-one-quarter mq2-col-full"> <a href="Teacher_Questions.aspx"> <img src="WebImage/Button_Student_Record.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="Teacher_Questions.aspx" class="arrow">題庫管理 Question Manage</a>
          <p>編輯、管理自己建立的題庫及題目。</p>
        </figcaption>
      </figure>

      <figure class="grid col-one-quarter mq2-col-full"> <a href="Teacher_Homework.aspx"> <img src="WebImage/Button_Student_Homwork.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="Teacher_Homework.aspx" class="arrow">作業管理 Homework Manage</a>
          <p>指派的作業及測驗，要求學生上繳成績。</p>
        </figcaption>
      </figure>


      <figure class="grid col-one-quarter mq2-col-full"> <a href="Teacher_Competition.aspx"> <img src="WebImage/Button_Student_Competition.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="Teacher_Competition.aspx" class="arrow">測驗競賽 Competition</a>
          <p>舉辦團隊的測驗競賽提升學生自主學習意願。</p>
        </figcaption>
      </figure>

      <figure class="grid col-one-quarter mq2-col-full"> <a href="PasswordChange.aspx"> <img src="WebImage/Button_Student_Password.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="PasswordChange.aspx" class="arrow">密碼變更 Password Change</a>
          <p>變更自己的登入密碼。</p>
        </figcaption>
      </figure>

    </section>

  </div>
  <!--main-->
  
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
  
</div>


<!-- Javascript - jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]><script src="js/selectivizr.js"></script><![endif]-->
<script src="js/jquery.flexslider-min.js"></script>
<script src="js/scripts.js"></script>
</form>
</body>
</html>
