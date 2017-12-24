<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Homework_Information.aspx.vb" Inherits="Teacher_Homework_Information" %>

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
        <li><a href="Teacher_Homework.aspx" class="navactive">作業 <font size="1pt">Homework</font></a></li>
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

            
            <table style="width: 100%; font-family: 微軟正黑體; font-size: 12pt; color: #333333;">
                <tr>
                    <td colspan="2" style="background-color: #D1A98F; font-size: 28pt; font-family: 微軟正黑體; color: #FFFFFF">
                        新增作業</td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        測驗模式：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                        
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True">練習</asp:ListItem>
                            <asp:ListItem>測驗</asp:ListItem>
                        </asp:RadioButtonList>
                       
                        <asp:Label ID="TittleTime_lb" runat="server" Text="測驗限時：" Visible="False"></asp:Label>
                        <asp:TextBox ID="TestTime_tx" runat="server" Visible="False"></asp:TextBox>
                        <asp:Label ID="TittleMin_lb" runat="server" Text="分鐘(1～120)" Visible="False"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        題庫名稱：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                       
                        <asp:DropDownList ID="Drop_Publish" runat="server" AutoPostBack="True" >
                            <asp:ListItem>自己</asp:ListItem>
                            <asp:ListItem>他人公開</asp:ListItem>
                        </asp:DropDownList>

                        &nbsp;

                        <asp:DropDownList ID="Drop_Question" runat="server" AutoPostBack="True">
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        單元選擇：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                        
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                            <asp:ListItem>全部</asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        題數設定：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                       
                        單選：<asp:DropDownList ID="DDL_Single" runat="server">
                        </asp:DropDownList>
                        
                        <br />
                        
                        複選：<asp:DropDownList ID="DDL_Multiple" runat="server">
                        </asp:DropDownList>

                    </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        學生設定：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                       
                        <asp:Label ID="ClassLabel" runat="server"></asp:Label>
                        &nbsp;<br />
                        <br />
                        
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="Group_Name" 
                            DataValueField="Group_Name">
                        </asp:DropDownList>

                        <asp:Button ID="Button4" runat="server" Text="新增" />
                        <asp:Button ID="Button5" runat="server" Text="移除" />

                    </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        期限：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                       
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

                        &nbsp;
                        
                        <asp:Label ID="StopTime" runat="server" Visible="False"></asp:Label>
                        <br />
                        <br />

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

                        時<br />
                        <asp:DropDownList ID="Drop_Min" runat="server">
                            <asp:ListItem>00</asp:ListItem>
                            <asp:ListItem>01</asp:ListItem>
                            <asp:ListItem>02</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>

                        分
                     </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; border-bottom-style: dashed; border-bottom-width: 3px; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed;">
                        備註說明：</td>
                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; border-bottom-style: dashed; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid;">
                       
                        <asp:TextBox ID="TextBox1" runat="server" Height="99px" TextMode="MultiLine" ></asp:TextBox>

                    </td>
                </tr>
                <tr>
                    <td style="border-color: #D1A98F; vertical-align: middle; text-align: center; background-color: #EDD5B3; border-left-style: solid; border-left-width: 3px; border-right-style: dashed; border-bottom-style: dashed; border-bottom-width: 3px;">
                    </td>

                    <td style="padding: 6px; border-width: 3px; border-color: #D1A98F; vertical-align: middle; text-align: left; background-color: #FAF1E7; border-left-style: none; border-right-style: solid; border-bottom-style: dashed;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="border-color: #D1A98F; vertical-align: middle; text-align: center; background-color: #D1A98F; border-left-style: solid; border-left-width: 3px; border-right-style: dashed; border-bottom-style: dashed; border-bottom-width: 3px;">
                       
                        <asp:Button ID="Button1" runat="server" Text="確定" />
                       <asp:Button ID="Button3" runat="server" Text="取消" />

                    </td>
                </tr>
            </table>

            
        </div>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Account %>" 
          SelectCommand="SELECT * FROM [Group] WHERE ([Group_TeacherID] = @Group_TeacherID) ORDER BY [Group_Name]">
          <SelectParameters>
             <asp:ControlParameter ControlID="lb_User_ID" Name="Group_TeacherID" PropertyName="Text" 
                          Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>
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

