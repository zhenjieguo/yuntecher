<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student.aspx.vb" Inherits="Student" %>
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
                ID="lb_User_Class" runat="server" Visible="False"></asp:Label></li>
        
      </ul>
      <ul>
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font></a></li>
        <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
      <ul>
        <li><asp:HyperLink ID="hy_Backend" runat="server" class="navactive">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
        <li><a href="Student_Homework.aspx">作業 <font size="1pt">Homework</font></a></li>
      </ul>
       <ul>
        <li><a href="Student_TestRecord.aspx">紀錄 <font size="1pt">Record</font></a></li>        
        <li><a href="Student_Competition.aspx">競賽 <font size="1pt">Competition</font></a></li>
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

      <figure class="grid col-one-third mq2-col-full"> 
      <a href="Student_Homework.aspx"> <img src="WebImage/Button_Student_Homwork.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="Student_Homework.aspx" class="arrow">個人作業 Homework</a><asp:Image 
         ID="Img_UnSubmit" runat="server" ImageUrl="~/WebImage/NumIcon/1.png" 
         Visible="False" />
&nbsp;<p>教師所指派的作業及測驗。</p>
        </figcaption>
      </figure>

      <figure class="grid col-one-third mq2-col-full"> <a href="Student_TestRecord.aspx"> <img src="WebImage/Button_Student_Record.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="Student_TestRecord.aspx" class="arrow">測驗紀錄 Record of Test</a>
          <p>瀏覽記錄的測驗結果、不熟或錯誤的題目。</p>
        </figcaption>
      </figure>

      <figure class="grid col-one-third mq2-col-full"> <a href="Student_Competition.aspx"> <img src="WebImage/Button_Student_Competition.jpg" alt=""> <span class="zoom"></span> </a>
        <figcaption> <a href="Student_Competition.aspx" class="arrow">測驗競賽 Competition</a>
          <p>教師所舉辦團隊的測驗競賽。</p>
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