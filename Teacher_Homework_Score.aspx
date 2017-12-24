<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Homework_Score.aspx.vb" Inherits="Teacher_Homework_Score" %>

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
       
        <h2>學生繳交作業 Score of Homework</h2>
        <p>以下是所有此項作業的學生上繳情況</p>
        <p>▲可清除單筆學生上傳成績，重新釋放上傳權限。</p>

        <br />

        <div align="center" >

          
            <div align="center">
                <p style="margin-bottom: 10px"><asp:Button ID="Button1" runat="server" Text="缺交名單統計" /></p>
                <p style="margin-bottom: 10px"><asp:Button ID="Button2" runat="server" Text="學生錯誤統計" /></p>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" CellSpacing="2" DataKeyNames="User_ID" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="班級" SortExpression="User_Group">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_Group") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="學號" SortExpression="User_Account">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_Account") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名" SortExpression="User_Name">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="成績">
                            <ItemTemplate>
                                <asp:Label ID="lb_Score" runat="server"></asp:Label>
                                <asp:Label ID="lb_UserID" runat="server" Text='<%# Bind("User_ID") %>' 
                                    Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="測驗時間">
                            <ItemTemplate>
                                <asp:Label ID="lb_TestTime" runat="server"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="清除繳交">
                            <ItemTemplate>
                                <a class="vtip" href="" title="清除繳交紀錄(釋放上繳權限)">
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="44px" 
                                    ImageUrl="~/WebImage/Icon_Delete.png" onclick="ImageButton1_Click" 
                                    onclientclick="return confirm('確定要要求重傳成績嗎？')" Width="44px" />
                                </a>
                                <asp:Label ID="Scoreid" runat="server" Visible="False"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </div>
            <asp:Label ID="nodataLB" runat="server" Font-Names="Berlin Sans FB" 
                Font-Size="30pt" ForeColor="Red" Text="Oh!Oh! No Data!!" Visible="False"></asp:Label>

          
        </div>
      </article>
    </section>
    
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


            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Account %>" 
                  SelectCommand="SELECT * FROM [Score] WHERE ([Upload] = @Upload)">
                  <SelectParameters>
                      <asp:QueryStringParameter Name="Upload" QueryStringField="Homeworkid" 
                          Type="String" />
                  </SelectParameters>
            </asp:SqlDataSource>
    
   
      
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
