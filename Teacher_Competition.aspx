<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Competition.aspx.vb" Inherits="Teacher_Questions" %>

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
        <li><a href="Teacher_Homework.aspx">作業 <font size="1pt">Homework</font></a></li>
      </ul>
       <ul>
        <li><a href="Teacher_Competition.aspx" class="navactive">競賽 <font size="1pt">Competition</font></a></li>        
        <li><a href="PasswordChange.aspx">密碼 <font size="1pt">Password</font></a></li>
      </ul>
    </nav>
    
  </header>
  <!--main-->


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
       
        <h2>競賽管理 Competition Manage</h2>
        <p>以下為所有您所建立的競賽，可以進行個別的競賽動作。</p>
        <br />

        <div align="center" >
            <p style="margin-bottom: 10px">
            <asp:Button ID="bt_CompetitionSub_Insert" runat="server" Text="舉辦比賽"></asp:Button>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                  CellPadding="3" DataKeyNames="Competition_ID" DataSourceID="SqlDataSource1" 
                    BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                    CellSpacing="2" Width="100%">
                  <Columns>
                      <asp:TemplateField InsertVisible="False" SortExpression="Competition_ID">
                          <ItemTemplate>
                              <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="編輯" />
                              <asp:Button ID="Button3" runat="server" Text="刪除" onclick="Button3_Click" />
                              &nbsp;<asp:Label ID="IDNum" runat="server" Text='<%# Eval("Competition_ID") %>' 
                                  Visible="False"></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="10%" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="比賽題目" SortExpression="Question_SubnameID">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox1" runat="server" 
                                  Text='<%# Bind("Question_SubnameID") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Subname_lb" runat="server" 
                                  Text='<%# Bind("Question_SubnameID") %>'></asp:Label>
                              &nbsp;單元<asp:Label ID="Label6" runat="server" Text='<%# Eval("Question_Unit") %>'></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="開始時間" SortExpression="Competition_StartTime">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox3" runat="server" 
                                  Text='<%# Bind("Competition_StartTime") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label3" runat="server" 
                                  Text='<%# Bind("Competition_StartTime") %>'></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="結束時間" SortExpression="Competition_EndTime">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox4" runat="server" 
                                  Text='<%# Bind("Competition_EndTime") %>'></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("Competition_EndTime") %>'></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="參與班級">
                          <EditItemTemplate>
                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                          </EditItemTemplate>
                          <ItemTemplate>
                              <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="新增組別" />
                              <br />
                              <asp:HyperLink ID="HyperLink1" runat="server" 
                                  NavigateUrl='<%# "~/Teacher_Competition_Group.aspx?cmid=" & Eval("Competition_ID") %>' 
                                  Text='<%# Eval("Competition_People") %>'></asp:HyperLink>
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
            </p>
        </div>
      </article>
    </section>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Competition %>" 
          SelectCommand="SELECT * FROM [Competition] WHERE ([User_ID] = @User_ID)" 
          DeleteCommand="DELETE FROM [Competition] WHERE [Competition_ID] = @Competition_ID" 
          InsertCommand="INSERT INTO [Competition] ([User_ID], [Question_SubnameID], [Question_Unit], [Competition_StartTime], [Competition_EndTime], [Competition_Note], [Competition_People]) VALUES (@User_ID, @Question_SubnameID, @Question_Unit, @Competition_StartTime, @Competition_EndTime, @Competition_Note, @Competition_People)" 
          UpdateCommand="UPDATE [Competition] SET [User_ID] = @User_ID, [Question_SubnameID] = @Question_SubnameID, [Question_Unit] = @Question_Unit, [Competition_StartTime] = @Competition_StartTime, [Competition_EndTime] = @Competition_EndTime, [Competition_Note] = @Competition_Note, [Competition_People] = @Competition_People WHERE [Competition_ID] = @Competition_ID">
        <DeleteParameters>
            <asp:Parameter Name="Competition_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_ID" Type="Int32" />
            <asp:Parameter Name="Question_SubnameID" Type="Int32" />
            <asp:Parameter Name="Question_Unit" Type="String" />
            <asp:Parameter Name="Competition_StartTime" Type="String" />
            <asp:Parameter Name="Competition_EndTime" Type="String" />
            <asp:Parameter Name="Competition_Note" Type="String" />
            <asp:Parameter Name="Competition_People" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="User_ID" Type="Int32" />
            <asp:Parameter Name="Question_SubnameID" Type="Int32" />
            <asp:Parameter Name="Question_Unit" Type="String" />
            <asp:Parameter Name="Competition_StartTime" Type="String" />
            <asp:Parameter Name="Competition_EndTime" Type="String" />
            <asp:Parameter Name="Competition_Note" Type="String" />
            <asp:Parameter Name="Competition_People" Type="String" />
            <asp:Parameter Name="Competition_ID" Type="Int32" />
        </UpdateParameters>
      </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Question %>" 
                  SelectCommand="SELECT DISTINCT * FROM [Subname] WHERE (([User_ID] = @User_ID) OR ([Publish] = @Publish))">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
                      <asp:Parameter DefaultValue="True" Name="Publish" Type="Boolean" />
                  </SelectParameters>
              </asp:SqlDataSource>

  </div>

  
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
