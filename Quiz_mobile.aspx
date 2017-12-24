<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Quiz_mobile.aspx.vb" Inherits="Quiz_mobile" %>

<!DOCTYPE html>

<html class="no-js" lang="en">

<head id="Head1" runat="server">

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
    {
        border: 3px double #808080;
        width: 100%;
        background-color: #CCCCCC;
        font-family: 微軟正黑體;
        color: #333333;
        font-size: 14pt;
        text-align: center;
        margin-bottom: 15px;
    }
    .style2
    {
        width: 100%;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    .Q_1
    {
        font-family: 微軟正黑體;
        font-size: 10pt;
        color: #FFFFFF;
        text-align: center;
        background-color: #003366;
        vertical-align: middle;
    }
    .Q_2
    {
        font-family: 微軟正黑體;
        font-size: 10pt;
        color: #FFFFFF;
        text-align: center;
        background-color: #6699FF;
        vertical-align: middle;
    }
    .Q_3
    {
        font-family: 微軟正黑體;
        font-size: 11pt;
        color: #000000;
        text-align: left;
        background-color: #FFFFFF;
    }
    .Q_4
    {
        margin: 10px 0px 0px 0px;
        border: 3px dashed #999999;
        padding: 10px;
        font-family: 微軟正黑體;
        font-size: 10pt;
        color: #000000;
        text-align: center;
        vertical-align: middle;
    }
    .style3
    {
        font-family: 微軟正黑體;
        font-size: 11pt;
        color: #000000;
        text-align: left;
        background-color: #FFFFFF;
        height: 112px;
    }
    .style4
    {
        font-family: 微軟正黑體;
        font-size: x-small;
        color: #800000;
        text-decoration: underline;
    }
    </style>


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
    </nav>
    
  </header>
  
  
  <div class="about-page main grid-wrap" align="center">
    <header class="grid col-full"><hr></header>
    <section class="grid col-three-quarters mq2-col-full">
    <asp:Label ID="lb_Subname" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
          Font-Size="28pt"></asp:Label> 

     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>


      <asp:UpdatePanel ID="UpdatePanel1" runat="server" >
            <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Visible="false"> 
        <table class="style1">
            <tr>
                <td style="font-family: 微軟正黑體; font-size: 30pt">
                    <strong>成績：</strong><asp:Label 
                        ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                              Font-Size="30pt" ForeColor="Red" Text="100" Font-Names="微軟正黑體"></asp:Label>
                          &nbsp; <strong>分</strong>&nbsp;
                          <asp:Label ID="Test_Start_lb" runat="server" Visible="False"></asp:Label>
                      <asp:Label ID="TotalAndRight_lb" runat="server"></asp:Label>
                      <br>
                    <asp:Label ID="TotalTestTime_lb" runat="server"></asp:Label>
                      </td>
            </tr>
            <tr>
                <td  style="padding: 10px">
                    <p > 
                        <asp:Button ID="Button2" runat="server" Text="記錄" />
                    </p>
                    <p style="font-size: 12pt"><asp:Label ID="lb_Message" runat="server" Text="(分數、勾選題目)  ※需記錄比賽分數才會累計"></asp:Label></p><br />
                    <p  margin-bottom="10px">
                          &nbsp;<a href="Index.aspx"><asp:Image ID="Image_Home" runat="server" 
                              Height="80px" ImageUrl="~/WebImage/Icon_Home.png" />
                          </a>&nbsp;&nbsp;<a href="Quiz_Choose.aspx"><asp:Image ID="Image_GoList" 
                              runat="server" Height="80px" ImageUrl="~/WebImage/GoList.png" />
                          </a>&nbsp;
                         <a href="Student_Homework.aspx">
                          <asp:Image ID="Image_GoHomework" runat="server" Height="80px" 
                              ImageUrl="~/WebImage/GoHomework.png" /></a>
                    </p>
                </td>
            </tr>
        </table>
        </asp:Panel>
                 <p  margin-bottom="10px"><asp:Button ID="Button1" runat="server" 
                    onclientclick="return confirm('確定要交卷了嗎？')" Text="交卷" /></p>
                <asp:DropDownList ID="Quiz_Num_ddl" runat="server" AutoPostBack="True" 
                    CausesValidation="True">
                </asp:DropDownList>
                <br />
                <span class="style4">※「*」號為不熟題目※<br /> </span>
                <table class="style2">
                    <tr>
                        <td class="style1">
                            <asp:Label ID="NoLB" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style3">
                            <p margin-bottom="10px"><asp:Label ID="QuestionLB" runat="server" Font-Size="18pt"></asp:Label></p>
                            <br />
                            <asp:Button ID="Button9" runat="server" Text="顯示附圖" />
                            <br />
                            <asp:Panel ID="Panel2" runat="server" HorizontalAlign="Left" ScrollBars="Auto" 
                                Width="100%">
                                <asp:Image ID="Image1" runat="server" />
                            </asp:Panel>
                            <br />
                            <asp:Label ID="Ans" runat="server" ForeColor="Red" Visible="False" 
                                Font-Size="18pt"></asp:Label>
                            <asp:RadioButtonList ID="RadioOptions1" runat="server" Font-Names="微軟正黑體" 
                                Font-Size="18pt" AutoPostBack="True" CausesValidation="True">
                            </asp:RadioButtonList>
                            <asp:CheckBoxList ID="CheckOptions1" runat="server" AutoPostBack="True" 
                                CausesValidation="True" Font-Size="18pt">
                            </asp:CheckBoxList>
                            (<asp:Label ID="UnitLabel0" runat="server" Visible="False"></asp:Label>
                            -<asp:Label ID="QuestionNumLabel0" runat="server" Visible="False"></asp:Label>
                            )&nbsp;</td>
                    </tr>
                    <tr >
                        <td class="Q_4">
                            <asp:Button ID="Strange_bt" runat="server" Text="此題不熟悉" />
                        </td>
                    </tr>
                </table>
                
                <p margin-bottom="7px"><asp:Button ID="Up_Question_bt" runat="server" Text="上一題"/></p> 
                <asp:Button ID="Button8" runat="server" Text="下一題" />
                <asp:Label ID="Subname_Optition_lb" runat="server" Visible="False"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server" 
                    placeholder="我不會告訴你只要輸入製作者的電話，系統就會幫你做答的" TextMode="Password" Visible="False"></asp:TextBox>
                <asp:Button ID="Button6" runat="server" Text="不顯示" Visible="False" />
            </ContentTemplate>
         </asp:UpdatePanel>
    </section>
  </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Question %>" 
        SelectCommand="SELECT Top 80* FROM [Question] WHERE ([Question_SubName] = @Question_SubName) ORDER BY NewID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="Question_SubName" QueryStringField="Quizid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Question %>" 
        SelectCommand="SELECT Top 80* FROM [Question] WHERE ([Question_SubName] = @Question_SubName) ORDER BY NewID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="Question_SubName" QueryStringField="Quizid" />
        </SelectParameters>
    </asp:SqlDataSource>

  <!--main-->
 <div class="divide-top">
    <footer class="grid-wrap" >
      <nav class="grid col-full" >
        <ul>
          <li>Copyright©</li>
          <li>CSS：<a href="http://www.free-css.com/" target="blank"> Free Css </a>- <a href="http://www.free-css.com/free-css-templates/page163/designa-2.01" target="blank">Sylvain Lafitte</a></li>
          <li><asp:LinkButton ID="LinkButton1" runat="server">.</asp:LinkButton></li>
        </ul>
      </nav>
    </footer>
    
  </div>
</div>

<!-- Javascript - jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]><script src="js/selectivizr.js"></script><![endif]-->
<script src="js/scripts.js"></script>
    </form>
</body>
</html>
