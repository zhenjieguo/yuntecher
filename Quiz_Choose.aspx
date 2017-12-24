<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Quiz_Choose.aspx.vb" Inherits="Quiz_Choose" %>
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
        <li><a href="Index.aspx">首頁 <font size="1pt">Home</font></a></li>
      </ul>
      <ul>
        <li><a href="Login.aspx"><asp:Label ID="lb_Login_Chen" runat="server" Text="登入"></asp:Label> <font size="1pt"><asp:Label ID="lb_Login_Eng" runat="server" Text="Login"></asp:Label> </font></a></li>
      </ul>
       <ul>
        <li><asp:HyperLink ID="hy_Backend" runat="server">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
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

    <section class="grid col-three-quarters mq2-col-full" > 
     <article id="navteam">
        <h2>測驗題目選擇 Quiz Set Up</h2>
        <p>不論你有沒有登入，現在就選擇你想要的題目，來檢測自己的實力吧！</p>
        <br />
        <p>▲扣分標準將依題數來配給。</p>
        <p>※唯有登入「學生」身分[錯誤題目]、[不熟]等題測驗資訊才能儲存紀錄。</p>
        <BR>

        <div align="center" >
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Question %>" 
                  
                  SelectCommand="SELECT * FROM [Subname] WHERE ([Publish] = @Publish) ORDER BY [Subname_Name]">
                  <SelectParameters>
                      <asp:Parameter DefaultValue="True" Name="Publish" Type="Boolean" />
                  </SelectParameters>
              </asp:SqlDataSource>
           
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Question %>" 
                  SelectCommand="SELECT DISTINCT [Question_Unit] FROM [Question] WHERE ([Question_SubName] = @Question_SubName) ORDER BY [Question_Unit]">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="ddl_Quiz_Choose_Subname" Name="Question_SubName" 
                          PropertyName="SelectedValue" Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>
            <p margin-botton="10px">題庫名稱：<asp:DropDownList ID="ddl_Quiz_Choose_Subname" 
                    runat="server" DataSourceID="SqlDataSource1" DataTextField="Subname_Name" 
                    DataValueField="Subname_ID" AutoPostBack="True"></asp:DropDownList></p>
            <p margin-botton="10px">單元選擇：<asp:DropDownList ID="ddl_Quiz_Choose_Unit" 
                    runat="server" DataSourceID="SqlDataSource2" DataTextField="Question_Unit" 
                    DataValueField="Question_Unit" AutoPostBack="True"></asp:DropDownList></p>
            <p margin-botton="10px">單選題數：<asp:DropDownList ID="ddl_Quiz_Choose_Single" runat="server"></asp:DropDownList></p>
            <p margin-botton="10px">複選題數：<asp:DropDownList ID="ddl_Quiz_Choose_Multiple" runat="server"></asp:DropDownList></p>
            <p margin-botton="10px">測驗介面：
                <asp:DropDownList ID="ddl_Test_Form" runat="server">
                    <asp:ListItem>電腦版</asp:ListItem>
                    <asp:ListItem>手機板</asp:ListItem>
                </asp:DropDownList>
                </p>
            <p margin-botton="10px"><asp:Label ID="lb_ErrorMessage" runat="server" 
                    Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="Red"></asp:Label></p>
            <asp:Button ID="bt_Quiz_Choose_StartTest" runat="server" Text="開始測驗"></asp:Button>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        </div>

      </article>
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