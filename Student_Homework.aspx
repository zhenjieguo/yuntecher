<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_Homework.aspx.vb" Inherits="Student_Homework" %>

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
        <li><asp:HyperLink ID="hy_Backend" runat="server">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
        <li><a href="Student_Homework.aspx" class="navactive">作業 <font size="1pt">Homework</font></a></li>
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
          <NodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          <RootNodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          </asp:SiteMapPath></p>
    </header>

     
  <section class="grid col-three-quarters mq2-col-full" > 
       <article id="navteam">
       
        <h2>學生作業總覽 Student Homework</h2>
        <p>以下內容為教師派遣之作業，請使用以下按鈕切換「測驗」及「練習」兩個類別。</p>
        <p>點選文字瀏覽作業詳細資訊及繳交成績</p>
        <br />
        <p>※繳交狀態有顯示分數才算繳交完成。<br />※在期限內以「登入」的身分測驗，完成後並點選「紀錄」的成績才會出現</p>
        <br />

        <div align="center" >
        <p align="center">
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
            Font-Size="20pt" ForeColor="Black" Text="教師指派測驗"></asp:Label>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
            Font-Size="20pt" ForeColor="Black" Text="教師指派練習" Visible="False"></asp:Label></p>
        <br />
        <p margin-bottom="10px"><asp:Button ID="bt_Tab_Test" runat="server" Text="測驗" /></p>
        <p margin-bottom="10px"><asp:Button ID="bt_Tab_Exercise" runat="server" Text="練習" /></p>
        <br />
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="HW_ID" DataSourceID="SqlDataSource2" Width="95%" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" ForeColor="Black" GridLines="Vertical">
             <AlternatingRowStyle BackColor="#CCCCCC" />
             <Columns>
                 <asp:TemplateField HeaderText="作業" SortExpression="Subname">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Subname") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         &nbsp;<asp:HyperLink ID="Subname_lb" runat="server" 
                             NavigateUrl='<%# "~/Student_Homework_Detail.aspx?HW_ID=" & Eval("HW_ID") %>' 
                             Text='<%# Eval("Subname") & " 單元：" & Eval("Subname_Unit") %>' 
                             ForeColor="Black" Font-Names="微軟正黑體" Font-Size="12pt" ></asp:HyperLink>
                         <asp:Label ID="WH_ID" runat="server" Text='<%# Eval("HW_ID") %>' 
                             Visible="False"></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="85%" />
                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Font-Names="微軟正黑體" 
                         ForeColor="Black" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="繳交">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" ImageUrl="~/WebImage/Icon_Check.png" />
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                     <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                 </asp:TemplateField>
             </Columns>
             <FooterStyle BackColor="#CCCCCC" />
             <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
             <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
         </asp:GridView>
        </strong></span>
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
             DataKeyNames="HW_ID" DataSourceID="SqlDataSource1" Width="95%" 
            Visible="False">
             <Columns>
                 <asp:TemplateField HeaderText="作業" SortExpression="Subname">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Subname") %>'></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         &nbsp;<asp:HyperLink ID="Subname_lb" runat="server" 
                             NavigateUrl='<%# "~/Student_Homework_Detail.aspx?HW_ID=" & Eval("HW_ID") %>' 
                             Text='<%# Eval("Subname") & " 單元：" & Eval("Subname_Unit") %>' 
                             ForeColor="Black" Font-Names="微軟正黑體" Font-Size="12pt" ></asp:HyperLink>
                         <asp:Label ID="WH_ID" runat="server" Text='<%# Eval("HW_ID") %>' 
                             Visible="False"></asp:Label>
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="85%" />
                     <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Font-Names="微軟正黑體" 
                         ForeColor="Black" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="繳交">
                     <EditItemTemplate>
                         <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                     </EditItemTemplate>
                     <ItemTemplate>
                         <asp:Image ID="Image1" runat="server" ImageUrl="~/WebImage/Icon_Check.png" />
                     </ItemTemplate>
                     <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                     <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                 </asp:TemplateField>
             </Columns>
         </asp:GridView>
        </div>
      </article>
    </section>
    


     

  
      <asp:SqlDataSource ID="SqlDataSource1" 
                runat="server" ConnectionString="<%$ ConnectionStrings:Homework %>" 
                
          SelectCommand="SELECT * FROM [Homework] WHERE (([Student_Group] LIKE '%' + @Student_Group + '%') And ([TestTime] = 0))ORDER BY [Date_End] DESC,[Subname],[Subname_Unit]">
            <SelectParameters>
                <asp:ControlParameter ControlID="lb_User_Class" Name="Student_Group" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" 
                runat="server" ConnectionString="<%$ ConnectionStrings:Homework %>" 
                
          SelectCommand="SELECT * FROM [Homework] WHERE (([Student_Group] LIKE '%' + @Student_Group + '%') And ([TestTime] &gt; 0 ))ORDER BY [Date_End] DESC,[Subname],[Subname_Unit]">
            <SelectParameters>
                <asp:ControlParameter ControlID="lb_User_Class" Name="Student_Group" 
                    PropertyName="Text" Type="String" />
            </SelectParameters>
            </asp:SqlDataSource>
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