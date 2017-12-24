<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Question_Insert.aspx.vb" Inherits="Teacher_Question_Insert" %>


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

    .style12
    {
        color: #E10000;
    }
    .style11
    {
        color: #FF0000;
    }
    </style>



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
       
        <h2>新增題目 Questions Insert</h2>
        <p>	此為題目新增頁面，您可以下載標準格式檔，編修並按照說明儲存後上傳批量題目：</p>
        <table style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; text-align: center; vertical-align: middle; border: 2px dashed #C0C0C0">
            <tr>
                <td style="vertical-align: middle">
                    <a href="http://localhost:1678/OnlineTest/WebImage/Help/Help_ExcelEdit.PNG" 
                        target="_blank">
                    <asp:Image ID="Image11" runat="server" 
                        ImageUrl="~/WebImage/Help/Help_ExcelEdit.PNG" Width="406px" />
                    </a>
                </td>
                <td style="text-align: left">
                    題庫匯入請依序下載回來的標準檔進行輸入：<br />
                    <br />
                    ▲序號可不連續地輸入原始題號方便學生尋找。<br />
                    ※<span class="style12">題目只能占一格空間，請老師們上傳前先檢查TXT檔是否在兩個Tab之間</span>。<br />
                    ※<span class="style12">單元僅限輸入數字</span>。<br />
                    ▲編輯完成後須將檔案存成「文字檔(Tab分割)」。<br />
                    <a href="http://localhost:1678/OnlineTest/WebImage/Help_ExcelTab.PNG" target="_blank">
                    <asp:Image ID="Image13" runat="server" 
                        ImageUrl="~/WebImage/Help/Help_ExcelTab.PNG" />
                    </a>
                </td>
            </tr>
            <tr>
                <td style="border-top-style: dashed; border-top-width: 2px; border-top-color: #C0C0C0">
                    <a href="http://localhost:1678/OnlineTest/WebImage/Help/Help_ExcelToTxt.PNG" 
                        target="_blank">
                    <asp:Image ID="Image12" runat="server" Height="200px" 
                        ImageUrl="~/WebImage/Help/Help_ExcelToTxt.PNG" />
                    </a>
                </td>
                <td style="border-top-style: dashed; border-top-width: 2px; border-top-color: #C0C0C0; text-align: left;">
                    轉換完成的題目檔：<br />
                    <br />
                    ※<span class="style11">題目必須如圖中不換行，否則將出現錯誤結果</span>。<br />
                    ※若題目有過多換行，建議在匯入Excel前先在Word內將「^p」(換行)，取代成「」(空值)。</td>
            </tr>
      </table>

        <br />

        <div align="center" style="border: 3px double #333333" >
             <asp:HyperLink ID="HyperLink2" runat="server" Font-Names="微軟正黑體" 
                 Font-Size="10pt" ForeColor="Maroon" NavigateUrl="~/WebFile/Question.xlsx">標準格式檔</asp:HyperLink>
             <br />
             <asp:FileUpload ID="FileUpload1" runat="server" />
             &nbsp;
             <asp:Button ID="bt_QuestionFile_Upload" runat="server" Text="上傳題目" />
             &nbsp;
             </div>
      </article>
    </section>
    
   
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

