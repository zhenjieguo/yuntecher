<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_Competition.aspx.vb" Inherits="Student_Competition" %>
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
                ID="lb_User_ID" runat="server" Visible="False"></asp:Label><asp:Label 
                ID="lb_User_Class" runat="server" Visible="False"></asp:Label>
            </li>
        
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
        <li><a href="Student_TestRecord.aspx">紀錄 <font size="1pt">Record</font></a></li>        
        <li><a href="Student_Competition.aspx" class="navactive">競賽 <font size="1pt">Competition</font></a></li>
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
       
        <h2>測驗競賽 Competition of Test</h2>

        <asp:Panel ID="Panel_Home" runat="server">
          <p>為了促使同學們主動進行測驗、幫助複習，透過教師建立的群組進行競賽，以小組為一單位，比較出各組分數高低的排名。<br />希望大家能督促彼此，為了學習、也為了榮耀。</p>
        <p>※為防止組別當中有成員以亂測來獲取分數<br />&nbsp;&nbsp;&nbsp;&nbsp;1.參與率：為解決組別成員參與率不均情況，成績計算公式為：(總成績÷總人數)-(最高測驗次數-最低測驗次數)X(0.1*總人數)<br />&nbsp;&nbsp;&nbsp;&nbsp;2.亂測以獲取分數：正確一題得一分，錯誤一題扣一分。</p>
        <br />

        <div align="center" >
            
            <asp:DataList ID="DataList1" runat="server" BackColor="White" 
                BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" 
                DataKeyField="Competition_ID" DataSourceID="SqlDataSource1" ForeColor="Black" 
                GridLines="Vertical" Width="100%">
                <AlternatingItemStyle BackColor="#CCCCCC" />
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    <table width="100%">
                        <tr>
                            <td colspan="2">
                                <asp:Label ID="IDNum" runat="server" Text='<%# Eval("Competition_ID") %>' 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="Left" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; background-color: #655091; text-decoration: blink; border-right-style: none; border-right-width: 3px; border-right-color: #C0C0C0; vertical-align: middle; text-align: center;">
                                競賽項目</td>
                            <td class="Right" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #B49EB6">
                                <asp:Label ID="Question_lb" runat="server" 
                                    Text='<%# Bind("Question_SubnameID") %>'></asp:Label>
                                &nbsp;單元<asp:Label ID="Unit_lb" runat="server" Text='<%# Eval("Question_Unit") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="Left" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; background-color: #655091; text-decoration: blink; border-right-style: none; border-right-width: 3px; border-right-color: #C0C0C0; vertical-align: middle; text-align: center;">
                                結束時間</td>
                            <td class="Right" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #B49EB6">
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Competition_EndTime") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="Left" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; background-color: #655091; text-decoration: blink; border-right-style: none; border-right-width: 3px; border-right-color: #C0C0C0; vertical-align: middle; text-align: center;">
                                教師備註</td>
                            <td class="Right" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #B49EB6">
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("Competition_Note") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="Left" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; background-color: #655091; text-decoration: blink; border-right-style: none; border-right-width: 3px; border-right-color: #C0C0C0; vertical-align: middle; text-align: center;">
                                參賽班級</td>
                            <td class="Right" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #B49EB6">
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Competition_People") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="Left" colspan="2" 
                                style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-decoration: blink; border-right-style: none; border-right-width: 3px; border-right-color: #C0C0C0; vertical-align: middle; text-align: center;">
                                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="戰況" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            </asp:DataList>
        </asp:Panel>
      
            <asp:Panel ID="Panel2" runat="server" Visible="False">
                <p style="margin-bottom: 10px; text-align: center"><asp:Button ID="Button2" runat="server" Text="返回" /></p>

                <table width="100%">
                    <tr>
                        <td class="Top">
                            <asp:Panel ID="Panel3" runat="server" Visible="False" 
                                Width="100%">
                                <table width="100%">
                                    <tr>
                                        <td valign="middle"  
                                            style="padding: 0px; border-color: #333333; border-width: 3px 3px 2px 3px; border-style: solid solid dotted solid; background-color: #A5A5E3; vertical-align: middle; text-align: center; font-family: 微軟正黑體; font-size: 28pt; color: #000000; text-decoration: blink;" 
                                            colspan="2">
                                            
                                                第一名</td>
                                    </tr>
                                    <tr>
                                        <td style="padding: 10px; border-color: #333333; border-width: 3px 2px 2px 3px; border-style: solid dashed dotted solid; background-color: #A5A5E3; vertical-align: middle; text-align: center; width: 50%;" 
                                            valign="middle" width="50%">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/WebImage/No1.png" 
                                                Width="300px" />
                                        </td>
                                        <td style="border-color: #333333; vertical-align: middle; text-align: center; background-color: #A5A5E3; border-top-style: solid; border-top-width: 3px; border-right-style: solid; border-right-width: 3px; border-bottom-style: dotted; border-bottom-width: 2px;">
                                            <asp:Label ID="NO1_Member_lb" runat="server" Font-Names="微軟正黑體" 
                                                ForeColor="#3333CC" Font-Bold="True" Font-Size="26pt"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" 
                                            
                                            style="background-color: #A5A5E3; vertical-align: middle; text-align: center; font-family: 微軟正黑體; border-style: none solid solid solid; border-width: 3px; border-color: #333333">
                                           
                                                <asp:Label ID="NO1_Score_lb" runat="server" Font-Names="微軟正黑體" Font-Size="24pt" 
                                                    ForeColor="#FF3300"></asp:Label>
                                                <span style="font-family: 微軟正黑體; font-size: 24pt" >分</span>
                                        </td>
  </div>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel4" runat="server" Height="100%" Visible="False" 
                                Width="100%">
                                <table  width="100%">
                                    <tr>
                                        <td valign="middle" colspan="2" 
                                            
                                            style="padding: 0px; border-color: #333333; border-width: 3px 3px 2px 3px; border-style: solid solid dotted solid; background-color: #BCBCEB; vertical-align: middle; text-align: center; font-family: 微軟正黑體; font-size: 28pt; color: #000000; text-decoration: blink;">
                                            第二名</td>
                                    </tr>
                                    <tr>
                                        <td valign="middle" 
                                            
                                            style="padding: 10px; border-color: #333333; border-width: 3px 2px 2px 3px; border-style: solid dashed dotted solid; background-color: #BCBCEB; vertical-align: middle; text-align: center; width: 50%;">
                                                <asp:Image ID="Image3" runat="server" ImageUrl="~/WebImage/No2.png" 
                                                    Width="250px" />
                                        </td>
                                        <td style="border-color: #333333; vertical-align: middle; text-align: center; background-color: #BCBCEB; border-top-style: solid; border-top-width: 3px; border-right-style: solid; border-right-width: 3px; border-bottom-style: dotted; border-bottom-width: 2px;">
                                                <asp:Label ID="NO2_Member_lb" runat="server" Font-Names="微軟正黑體" 
                                                ForeColor="#3333CC" Font-Bold="True" Font-Size="26pt"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="background-color: #BCBCEB; vertical-align: middle; text-align: center; font-family: 微軟正黑體; border-style: none solid solid solid; border-width: 3px; border-color: #333333">
                                           
                                                <asp:Label ID="NO2_Score_lb" runat="server" Font-Names="微軟正黑體" Font-Size="24pt" 
                                                    ForeColor="#FF3300"></asp:Label>
                                                <span style="font-family: 微軟正黑體; font-size: 24pt">分</span></div>
                                        </td>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td class="Bottom">
                            <asp:Panel ID="Panel5" runat="server" Height="100%" Visible="False" 
                                Width="100%">
                                <table width="100%">
                                    <tr>
                                        <td valign="middle" colspan="2" 
                                            
                                            style="padding: 0px; border-color: #333333; border-width: 3px 3px 2px 3px; border-style: solid solid dotted solid; background-color: #E4E4F8; vertical-align: middle; text-align: center; font-family: 微軟正黑體; font-size: 28pt; color: #000000; text-decoration: blink;">
                                            第三名</td>
                                    </tr>
                                    <tr>
                                        <td class="style8" valign="middle" 
                                            
                                            style="padding: 10px; border-color: #333333; border-width: 3px 2px 2px 3px; border-style: solid dashed dotted solid; background-color: #E4E4F8; vertical-align: middle; text-align: center; width: 50%;" >
                                                <asp:Image ID="Image4" runat="server" ImageUrl="~/WebImage/No3.png" 
                                                    Width="200px" />
                                        </td>
                                        <td style="border-color: #333333; vertical-align: middle; text-align: center; background-color: #E4E4F8; border-top-style: solid; border-top-width: 3px; border-right-style: solid; border-right-width: 3px; border-bottom-style: dotted; border-bottom-width: 2px;" >
                                                <asp:Label ID="NO3_Member_lb" runat="server" Font-Names="微軟正黑體" 
                                                ForeColor="#3333CC" Font-Bold="True" Font-Size="26pt"></asp:Label>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" 
                                            
                                            style="background-color: #E4E4F8; vertical-align: middle; text-align: center; font-family: 微軟正黑體; border-style: none solid solid solid; border-width: 3px; border-color: #333333">
                                                <asp:Label ID="NO3_Score_lb" runat="server" Font-Names="微軟正黑體" Font-Size="24pt" 
                                                    ForeColor="#FF3300"></asp:Label>
                                                <span style="font-family: 微軟正黑體; font-size: 24pt">分</span>
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            
           <br />
                     <table width="100%">
                         <tr>
                             <td style="border-color: #333333; font-family: 微軟正黑體; font-size: 16pt; text-decoration: blink; text-align: center; vertical-align: middle; border-bottom-style: dashed; border-bottom-width: 3px; background-color: #FFF6BE; border-top-style: solid; border-top-width: 3px; border-left-style: solid; border-left-width: 3px;">
                                 成員姓名</td>
                             <td style="border-color: #333333; font-family: 微軟正黑體; font-size: 16pt; text-decoration: blink; text-align: center; vertical-align: middle; border-bottom-style: dashed; border-bottom-width: 3px; background-color: #FFF6BE; border-top-style: solid; border-top-width: 3px;">
                                 分數累積</td>
                             <td style="border-color: #333333; font-family: 微軟正黑體; font-size: 16pt; text-decoration: blink; text-align: center; vertical-align: middle; border-bottom-style: dashed; border-bottom-width: 3px; background-color: #FFF6BE; border-top-style: solid; border-top-width: 3px; border-right-style: solid; border-right-width: 3px;">
                                 測驗次數</td>
                         </tr>
                         <tr>
                             <td style="background-color: #FFF6BE; font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-left-style: solid; border-left-width: 3px; border-left-color: #333333;">
                                 <asp:Label ID="Group_Member_lb" runat="server"></asp:Label>
                             </td>
                             <td style="background-color: #FFF6BE; font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center">
                                 <asp:Label ID="Group_Score_lb" runat="server"></asp:Label>
                             </td>
                             <td style="background-color: #FFF6BE; font-family: 微軟正黑體; font-size: 14pt; color: #333333; vertical-align: middle; text-align: center; border-right-style: solid; border-right-width: 3px; border-right-color: #333333;">
                                 <asp:Label ID="Group_Time_lb" runat="server"></asp:Label>
                             </td>
                         </tr>
                         <tr class="style7">
                             <td colspan="3" 
                                 style="border-color: #333333; background-color: #FFF6BE; font-family: 微軟正黑體; color: #333333; vertical-align: middle; text-align: center; border-right-style: solid; border-right-width: 3px; border-left-style: solid; border-left-width: 3px;">
                             </td>
                         </tr>
                         <tr class="style7">
                             <td colspan="3" 
                                 style="border-style: dashed solid solid solid; border-width: 2px 3px 3px 3px; border-color: #333333; background-color: #FFF6BE; font-family: 微軟正黑體; color: #333333; vertical-align: middle; text-align: center; font-size: 16pt;">
                                 積分：<asp:Label ID="Group_TotalScore_lb" runat="server" Font-Underline="True"></asp:Label>
                                 &nbsp;-目前名次：第<asp:Label ID="Group_NoNum_lb" runat="server"></asp:Label>
                                 名<asp:Label ID="Group_id_lb" runat="server" Visible="False"></asp:Label>
                             </td>
                         </tr>
                </table>
                      
                      <br />
                      <span class="style10">※成績計算公式：(總成績÷總人數) - (最高測驗次數-最低測驗次數) X (0.1*總人數)</span></div>
            </asp:Panel>
            
        </div>
      </article>
    </section>
    

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Competition %>" 
          SelectCommand="SELECT * FROM [Competition] WHERE ([Competition_People] LIKE '%' + @Competition_People + '%') ORDER BY [Competition_EndTime]">
          <SelectParameters>
              <asp:ControlParameter ControlID="lb_User_Class" Name="Competition_People" 
                  PropertyName="Text" Type="String" />
          </SelectParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Competition %>" 
          SelectCommand="SELECT * FROM [Group]"></asp:SqlDataSource>
    

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