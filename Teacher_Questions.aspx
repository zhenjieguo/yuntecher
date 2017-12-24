<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Questions.aspx.vb" Inherits="Teacher_Questions" %>

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
       
        <h2>題庫管理 Question Manage</h2>
        <p>以下為所有您所建立的題庫，可以進行個別的編刪動作。</p>
        <p>▲題庫名稱後方括弧內數字代表目前總題數。</p>
        <br />

        <div align="center" >
            <p style="margin-bottom: 10px"><asp:Button ID="bt_QuestionSub_Insert" 
                    runat="server" Text="新增題庫"></asp:Button></p>

            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" 
                AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" 
                BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" 
                DataKeyNames="Subname_ID" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="動作" ShowHeader="False">
                        <EditItemTemplate>
                            &nbsp;
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="bt_QuestionSub_Gridview_Edit" runat="server" 
                                onclick="bt_QuestionSub_Gridview_Edit_Click" Text="編輯" />
                            <asp:Button ID="bt_QuestionSub_Gridview_Delete" runat="server" 
                                onclick="bt_QuestionSub_Gridview_Delete_Click" Text="刪除" />
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="題庫名稱" SortExpression="Subname_Name" ItemStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:HyperLink ID="SubnameLB" runat="server" 
                                NavigateUrl='<%# "Teacher_Question_View.aspx?Questionid=" & Eval("Subname_ID") %>' 
                                Text='<%# Eval("Subname_Name") %>' Font-Size="12pt"></asp:HyperLink>
                            <asp:Label ID="IDNum" runat="server" Text='<%# Eval("Subname_ID") %>' 
                                Visible="False"></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="公開狀態" SortExpression="Publish">
                        <ItemTemplate>
                            <asp:CheckBox ID="PublishCH" runat="server" Checked='<%# Bind("Publish") %>' 
                                Enabled="false" Visible="False" />
                            <asp:Image ID="PublishIG" runat="server" ImageUrl="~/WebImage/Icon_Check.png" />
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

            <asp:Label ID="nodataLB" runat="server" Font-Names="Berlin Sans FB" 
                  Font-Size="30pt" ForeColor="#996633" Text="Oh!Oh! No Data!!" 
                Visible="False"></asp:Label>
        </div>
      </article>
    </section>
    

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Question %>" 
          DeleteCommand="DELETE FROM [Subname] WHERE [Subname_ID] = @Subname_ID" 
          InsertCommand="INSERT INTO [Subname] ([User_ID], [Subname_Name], [Publish], [Retest], [InsertDate]) VALUES (@User_ID, @Subname_Name, @Publish, @Retest, @InsertDate)" 
          SelectCommand="SELECT * FROM [Subname] WHERE ([User_ID] = @User_ID) ORDER BY [InsertDate] DESC" 
          UpdateCommand="UPDATE [Subname] SET [User_ID] = @User_ID, [Subname_Name] = @Subname_Name, [Publish] = @Publish, [Retest] = @Retest, [InsertDate] = @InsertDate WHERE [Subname_ID] = @Subname_ID">
          <DeleteParameters>
              <asp:Parameter Name="Subname_ID" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="User_ID" Type="Int32" />
              <asp:Parameter Name="Subname_Name" Type="String" />
              <asp:Parameter Name="Publish" Type="Boolean" />
              <asp:Parameter Name="Retest" Type="Boolean" />
              <asp:Parameter Name="InsertDate" Type="DateTime" />
          </InsertParameters>
          <SelectParameters>
               <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="User_ID" Type="Int32" />
              <asp:Parameter Name="Subname_Name" Type="String" />
              <asp:Parameter Name="Publish" Type="Boolean" />
              <asp:Parameter Name="Retest" Type="Boolean" />
              <asp:Parameter Name="InsertDate" Type="DateTime" />
              <asp:Parameter Name="Subname_ID" Type="Int32" />
          </UpdateParameters>
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
