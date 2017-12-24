<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Index.aspx.vb" Inherits="Indexaspx" %>
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
      </ul>
      <ul>
        <li><a href="Index.aspx" class="navactive">首頁 <font size="1pt">Home</font></a></li>
      </ul>
      <ul>
        <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
      <ul>
        <li><asp:HyperLink ID="hy_Backend" runat="server">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
      </ul>
    </nav>
    
  </header>



  <div class="home-page main">
   
    <section class="grid-wrap">
        
      <div class="grid col-one-half mq2-col-full"><!--左文字框><!-->
        <h1>開始測驗 Start Test</h1>
        <p>&nbsp;&nbsp;&nbsp;不論你們聚在這的理由是什麼，但我相信「練習」正是你現在需要的。</p>
        <br><br>
        <p><a href="Quiz_Choose.aspx">開始測驗 Start</a></p>
      </div>
      
      
      <div class="slider grid col-one-half mq2-col-full"><!--右圖框><!-->
        <div class="flexslider">
          <div class="slides">
          
          
            <div class="slide">
              <figure> <img src="WebImage/System/Index_StartTest.jpg" alt="">
              	<figcaption>
                
                  <div>
                    <h5><p>唯有透過不斷的努力</p><p>才能掌握璀璨未來的鑰匙</p></h5>
                  </div>
                  
                </figcaption>
              </figure>
            </div>
            
            
          </div>
        </div>
      </div>      
        

  </div>

  <!--main-->
  
  <!--main-->
  <div class="divide-top">
    <footer class="grid-wrap">
      <nav class="grid col-full ">
        <ul>

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
