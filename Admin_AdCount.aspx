<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Admin_AdCount.aspx.vb" Inherits="Admin_AdCount" %>

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
<!--=====================Main區塊=====================-->
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
        <li><asp:HyperLink ID="hy_Backend" runat="server" class="navactive">後台 <font size="1pt">Backend</font></asp:HyperLink></li>
      </ul>
    </nav>
  </header>

  <!--main-->
  <div class="blog-page main grid-wrap">
    <header class="grid col-full">
      <hr>
      <p class="fleft"><asp:SiteMapPath ID="SiteMapPath1" runat="server">
          <CurrentNodeStyle Font-Names="微軟正黑體" ForeColor="#333333" />
          <RootNodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          </asp:SiteMapPath></p>
    </header>
    
    <!--==========================使用者新增區塊=========================-->
    <section class="grid col-three-quarters mq2-col-two-thirds mq3-col-full">
         <p style="text-align: center; margin-bottom: 10px;"><asp:Button ID="Button5" runat="server" Text="使用者管理"></asp:Button></p>
          <p style="text-align: center; margin-bottom: 10px;"><asp:Button ID="Button1" runat="server" Text="使用者新增"></asp:Button></p>
          <p style="text-align: center; margin-bottom: 10px;"><asp:Button ID="Button2" runat="server" Text="群組關係管理"></asp:Button></p>

      <asp:Panel ID="Panel1" runat="server" Visible="False" Width="100%">

          <article class="post">
            <h2>教師資料建檔</h2>
            <div class="entry" align="center">
              <p>
                 帳號：<asp:TextBox ID="TCA" runat="server"></asp:TextBox><br />
                 密碼：<asp:TextBox ID="TCP" runat="server"></asp:TextBox><br />
                 姓名：<asp:TextBox ID="TCN" runat="server"></asp:TextBox><br /><br />
                 <asp:Button ID="TC_regist" runat="server" Text="建立"></asp:Button>
              </p>
            </div>
          </article>
          <article class="post">
            <h2>學生資料建檔</h2>
            <div class="entry" align="center">
              <p>
                 <asp:FileUpload ID="StudentUpload" runat="server"></asp:FileUpload>
                 <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/WebFile/Students.xlsx">標準格式檔</asp:HyperLink>
                 <asp:Button ID="ST_regist" runat="server" Text="匯入"></asp:Button>
              </p>
            </div>
          </article>
      </asp:Panel>
      <!--==========================群組關係管理區塊=========================-->
      <asp:Panel ID="Panel2" runat="server" Visible="False">
          <article class="post">
                <h2>導師隸屬班級</h2>
                <div class="entry" align="center">
                  <p>
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" 
                          DataTextField="User_Name" DataValueField="User_ID"></asp:DropDownList><br />
                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource5" 
                          DataTextField="User_Group" DataValueField="User_Group"></asp:DropDownList><br /><br />
                    <asp:Button ID="Button3" runat="server" Text="新增"></asp:Button>
                  </p>
                </div>
          </article>
          <article class="post">
                <h2>直屬名單狀況</h2>
                <div class="entry" align="center">
                  <p>
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" 
                          DataSourceID="SqlDataSource6" DataTextField="Group_TeacherName" 
                          DataValueField="Group_TeacherID"></asp:DropDownList><br />
                    <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" 
                          DataSourceID="SqlDataSource7" DataTextField="Group_Name" 
                          DataValueField="Group_Name"></asp:DropDownList><br /><br />
                    <asp:Button ID="Button4" runat="server" Text="刪除關係"></asp:Button>
                  </p>
                </div>
          </article>
      </asp:Panel>
      <!--==========================使用者管理區塊=========================-->
      <asp:Panel ID="Panel3" runat="server" Width="100%">
          <article class="post">
                <h2>使用者管理</h2>
                <div class="entry" align="center">
                  <p>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                          DataSourceID="SqlDataSource1" DataTextField="User_Style" 
                          DataValueField="User_Style"></asp:DropDownList>
                    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                          DataSourceID="SqlDataSource3" DataTextField="User_Group" 
                          DataValueField="User_Group"></asp:DropDownList><br /><br />
                    <asp:GridView ID="GridView1" runat="server" 
                                  AutoGenerateColumns="False" CellPadding="4" DataKeyNames="User_ID" 
                                  DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" 
                                  Width="100%" AllowSorting="True">
                                  <AlternatingRowStyle BackColor="White" />
                                  <Columns>
                                      <asp:TemplateField HeaderText="隸屬單位" SortExpression="User_Group">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("User_Group") %>' 
                                                  Width="90px"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label5" runat="server" Text='<%# Bind("User_Group") %>'></asp:Label>
                                          </ItemTemplate>
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="使用者帳號" SortExpression="User_Account">
                                          <EditItemTemplate>
                                              <asp:Label ID="Label33" runat="server" Text='<%# Bind("User_Account") %>'></asp:Label>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("User_Account") %>'></asp:Label>
                                              <asp:Label ID="UserID_lb" runat="server" Text='<%# Eval("User_ID") %>' 
                                                  Visible="False"></asp:Label>
                                              <asp:Label ID="UserChar_lb" runat="server" Text='<%# Eval("User_Style") %>' 
                                                  Visible="False"></asp:Label>
                                          </ItemTemplate>
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="密碼" SortExpression="User_Password">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("User_Password") %>' 
                                                  Width="110px"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("User_Password") %>'></asp:Label>
                                          </ItemTemplate>
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="姓名" SortExpression="User_Name">
                                          <EditItemTemplate>
                                              <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("User_Name") %>' 
                                                  Width="110px"></asp:TextBox>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("User_Name") %>'></asp:Label>
                                          </ItemTemplate>
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="使用者類型" SortExpression="User_Style">
                                          <EditItemTemplate>
                                              <asp:Label ID="Label10" runat="server" Text='<%# Bind("User_Style") %>'></asp:Label>
                                          </EditItemTemplate>
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("User_Style") %>'></asp:Label>
                                          </ItemTemplate>
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="處理" ShowHeader="False">
                                          <ItemTemplate>
                                              <asp:Button ID="Button1" runat="server" CausesValidation="False" 
                                                  CommandName="Edit" Text="編輯" />
                                              &nbsp;<br /> <asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                                  CommandName="Delete" Text="刪除" 
                                                  onclientclick="return confirm('確定要刪除這位使用者及相關資料嗎？')" />
                                          </ItemTemplate>
                                          <EditItemTemplate>
                                              <asp:Button ID="Button1" runat="server" CausesValidation="True" 
                                                  CommandName="Update" Text="更新" />
                                              &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" 
                                                  CommandName="Cancel" Text="取消" />
                                          </EditItemTemplate>
                                          <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                      </asp:TemplateField>
                                  </Columns>
                                  <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                  <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                                  <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                                  <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                                  <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                                  <SortedAscendingCellStyle BackColor="#FDF5AC" />
                                  <SortedAscendingHeaderStyle BackColor="#4D0000" />
                                  <SortedDescendingCellStyle BackColor="#FCF6C0" />
                                  <SortedDescendingHeaderStyle BackColor="#820000" />
                              </asp:GridView>
                  </p>
                </div>
          </article>
          
      </asp:Panel>
   </section>
  </div>
  <!--==========================SqlDataSource區塊=========================-->
  <div id="Web-Button">
    <asp:SqlDataSource ID="SqlDataSource6" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        
        
        SelectCommand="SELECT DISTINCT [Group_TeacherID], [Group_TeacherName] FROM [Group] ORDER BY [Group_TeacherName]">
    </asp:SqlDataSource>
                  
    <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        
        
        
        SelectCommand="SELECT * FROM [Group] WHERE ([Group_TeacherID] = @Group_TeacherID) ORDER BY [Group_Name]">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList5" Name="Group_TeacherID" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        SelectCommand="SELECT DISTINCT [User_Style] FROM [User]">
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        SelectCommand="SELECT * FROM [User] WHERE ([User_Style] = @User_Style And [User_Group] = @User_Group) Order By [User_Account]" 
        DeleteCommand="DELETE FROM [User] WHERE [User_ID] = @User_ID" 
        InsertCommand="INSERT INTO [User] ([User_Account], [User_Password], [User_Style], [User_Group], [User_Name]) VALUES (@User_Account, @User_Password, @User_Style, @User_Group, @User_Name)" 
        UpdateCommand="UPDATE [User] SET [User_Password] = @User_Password, [User_Style] = @User_Style, [User_Group] = @User_Group, [User_Name] = @User_Name WHERE [User_ID] = @User_ID">
        <DeleteParameters>
            <asp:Parameter Name="User_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="User_Account" Type="String" />
            <asp:Parameter Name="User_Password" Type="String" />
            <asp:Parameter Name="User_Style" Type="String" />
            <asp:Parameter Name="User_Group" Type="String" />
            <asp:Parameter Name="User_Name" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="User_Style" 
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="DropDownList2" Name="User_Group" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="User_Password" Type="String" />
            <asp:Parameter Name="User_Style" Type="String" />
            <asp:Parameter Name="User_Group" Type="String" />
            <asp:Parameter Name="User_Name" Type="String" />
            <asp:Parameter Name="User_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        SelectCommand="SELECT DISTINCT [User_Group], [User_Style] FROM [User] WHERE ([User_Style] = @User_Style)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="User_Style" 
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        
        SelectCommand="SELECT DISTINCT [User_Name],[User_ID] FROM [User] WHERE ([User_Style] = @User_Style)">
        <SelectParameters>
            <asp:Parameter DefaultValue="教職員工" Name="User_Style" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Account %>" 
        SelectCommand="SELECT DISTINCT [User_Group] FROM [User]">
    </asp:SqlDataSource>
</div>
  
  

  <!--Footer-->
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
