<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Competition_Group.aspx.vb" Inherits="Teacher_Competition_Group" %>

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
        <li><a href="Teacher_Homework.aspx">作業 <font size="1pt">Homework</font></a></li>
      </ul>
       <ul>
        <li><a href="Teacher_Competition.aspx" class="navactive">競賽 <font size="1pt">Competition</font></a></li>        
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
       
        <h2>群組成績 Score of Group</h2>
        <p>	此為作業管理主頁面，可以瀏覽所有您新增的作業並進行編輯：</p>
        <p>▲點選題庫名稱可看到所有學生繳交的成績。</p>

        <br />

        <div align="center" >
             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                 BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" 
                 CellPadding="3" CellSpacing="2" DataKeyNames="Group_ID" 
                 DataSourceID="SqlDataSource3" Width="100%">
                 <Columns>
                     <asp:TemplateField HeaderText="序號" InsertVisible="False" 
                         SortExpression="Group_ID">
                         <ItemTemplate>
                             <asp:Label ID="IDNum_lb" runat="server"></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle Width="20px" />
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="成員" SortExpression="Group_Member">
                         <ItemTemplate>
                             <asp:Label ID="Member_lb" runat="server" Text='<%# Bind("Group_Member") %>'></asp:Label>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <asp:TextBox ID="Group_tb0" runat="server" Height="114px" 
                                 Text='<%# Bind("Group_Member") %>' TextMode="MultiLine" Width="68%"></asp:TextBox>
                             <asp:Label ID="Label8" runat="server" Text='<%# Eval("Group_ID") %>' 
                                 Visible="False"></asp:Label>
                         </EditItemTemplate>
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                         <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                     </asp:TemplateField>
                     <asp:TemplateField HeaderText="成績" SortExpression="Group_Score">
                         <ItemTemplate>
                             <asp:Label ID="Label1" runat="server" Text='<%# Bind("Group_Score") %>'></asp:Label>
                         </ItemTemplate>
                     </asp:TemplateField>
                     <asp:TemplateField>
                         <EditItemTemplate>
                             <asp:Button ID="Button3" runat="server" CommandName="Update" Text="確定" />
                             <asp:Button ID="Button4" runat="server" CommandName="Cancel" Text="取消" />
                         </EditItemTemplate>
                         <ItemTemplate>
                             <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="編輯" />
                             <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                                 onclientclick="return confirm('確定要刪除此組別及分數嗎？')" Text="刪除" />
                             <asp:Label ID="IDNum" runat="server" Text='<%# Eval("Group_ID") %>' 
                                 Visible="False"></asp:Label>
                         </ItemTemplate>
                         <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="15%" />
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
      </article>
    </section>
    
   
    
   
      
  </div>

  <!--main-->
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Competition %>" 
                  
                  
                  SelectCommand="SELECT * FROM [Group] WHERE ([Competition_ID] = @Competition_ID) ORDER BY [Group_Score] DESC" 
                  DeleteCommand="DELETE FROM [Group] WHERE [Group_ID] = @Group_ID" 
                  InsertCommand="INSERT INTO [Group] ([Competition_ID], [Group_Member], [Group_CompetitionScore], [Group_TotalQuesNum], [Group_Score], [Group_RelateClass]) VALUES (@Competition_ID, @Group_Member, @Group_CompetitionScore, @Group_TotalQuesNum, @Group_Score, @Group_RelateClass)" 
                  UpdateCommand="UPDATE [Group] SET  [Group_Member] = @Group_Member WHERE [Group_ID] = @Group_ID">
                  <DeleteParameters>
                      <asp:Parameter Name="Group_ID" Type="Int32" />
                  </DeleteParameters>
                  <InsertParameters>
                      <asp:Parameter Name="Competition_ID" Type="Int32" />
                      <asp:Parameter Name="Group_Member" Type="String" />
                      <asp:Parameter Name="Group_CompetitionScore" Type="String" />
                      <asp:Parameter Name="Group_TotalQuesNum" Type="String" />
                      <asp:Parameter Name="Group_Score" Type="Decimal" />
                      <asp:Parameter Name="Group_RelateClass" Type="String" />
                  </InsertParameters>
                  <SelectParameters>
                      <asp:QueryStringParameter Name="Competition_ID" QueryStringField="cmid" 
                          Type="Int32" />
                  </SelectParameters>
                  <UpdateParameters>
                      <asp:Parameter Name="Group_Member" Type="String" />
                      <asp:Parameter Name="Group_ID" />
                  </UpdateParameters>
              </asp:SqlDataSource>
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

