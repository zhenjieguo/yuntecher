<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_Homework_Detail.aspx.vb" Inherits="Homework_Detail" %>

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
                ID="lb_User_Class" runat="server" Visible="False"></asp:Label>
            <asp:Label 
                ID="lb_User_ID" runat="server" Visible="False"></asp:Label></li>
        
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
  
        <h2>作業資訊 Detail of Homework</h2><h4> <asp:Label ID="lb_Homework_Name" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
            Font-Size="20pt" ForeColor="Black" Text=""></asp:Label></h4>
        <p>以下內容為此項作業的詳細資訊。</p>
        <p>點選「上傳成績」可更改上繳的成績</p
        <br />
        <p>※繳交狀態有顯示分數才算繳交完成。</p>
        <br />

        <div align="center" > 
           <p margin-bottom="10px"> <asp:Button ID="bt_StartTest_PC" runat="server" 
                   Text="進入電腦版" /></p>
           <p margin-bottom="10px"><asp:Button ID="bt_StartTest_Mobile" runat="server" 
                   Text="進入手機版" /></p>

        
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            CellPadding="3" DataKeyNames="HW_ID" DataSourceID="SqlDataSource1" 
            Font-Names="微軟正黑體" Font-Size="11pt" ForeColor="Black" GridLines="Vertical" 
            Width="100%">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <EditRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:TemplateField HeaderText="作業類型" SortExpression="TestTime">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TestTime") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TestTime") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="HWMode_lb" runat="server" Text='<%# Bind("TestTime") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="作業項目" SortExpression="Subname">
                    <ItemTemplate>
                        <asp:Label ID="Subname_lb" runat="server" 
                            Text='<%# Eval("Subname") & " 單元：" & Eval("Subname_Unit") %>'></asp:Label>
                        <asp:Label ID="HW_ID" runat="server" Text='<%# Eval("HW_ID") %>' 
                            Visible="False"></asp:Label>
                        <asp:Label ID="Subname_ID" runat="server" Text='<%# Eval("Subname") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="指導教師" SortExpression="Teacher_ID">
                    <ItemTemplate>
                        <asp:Label ID="Teacher_lb" runat="server" Text='<%# Bind("Teacher_ID") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="起始時間" SortExpression="Date_Start">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date_Start") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date_Start") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="StarttimeLabel" runat="server" Text='<%# Bind("Date_Start") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳交期限" SortExpression="Date_End">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date_End") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Date_End") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="EndtimeLabel" runat="server" Text='<%# Bind("Date_End") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="題數限制" SortExpression="TestCount">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TestCount") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("TestCount") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        單選：<asp:Label ID="Count_Single" runat="server"></asp:Label>
                        <br />
                        複選：<asp:Label ID="Count_Multiple" runat="server"></asp:Label>
                        <asp:Label ID="Testcount" runat="server" Text='<%# Bind("TestCount") %>' 
                            Visible="False"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="繳交分數" SortExpression="TestCount">
                    <ItemTemplate>
                        <asp:Label ID="Score_lb" runat="server"></asp:Label>
                        分&nbsp;
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="教師備註" SortExpression="HW_Note">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("HW_Note") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("HW_Note") %>'></asp:TextBox>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("HW_Note") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Fields>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        </asp:DetailsView>
        <br />
         <div align="center" style="width: 100%">
            <asp:Label ID="Mode_lb" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="Homework_ID" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="Question_ID" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="StartTime" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="EndTime" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="UnitLabel" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="Count" runat="server" Visible="False"></asp:Label>
            <p margin-bottom="10px"><asp:Label ID="Score_ID" runat="server" Font-Names="微軟正黑體" ForeColor="#333333" 
                Text="成績選單："></asp:Label>
            <asp:DropDownList ID="ddl_ScoreList" runat="server" 
                DataSourceID="SqlDataSource2" DataTextField="Score" DataValueField="Score_ID" 
                    AutoPostBack="True">
            </asp:DropDownList></p>
            <p><asp:Button ID="bt_Score_Submit" runat="server" Text="提交" /></p>
        </div>
        </div>

      </article>
    </section>
    

    <asp:SqlDataSource ID="SqlDataSource1" 
                runat="server" ConnectionString="<%$ ConnectionStrings:Homework %>" 
                SelectCommand="SELECT * FROM [Homework] WHERE ([HW_ID] = @HW_ID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="HW_ID" QueryStringField="HW_ID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:Account %>" 
                  
                  
                  
                  
                  SelectCommand="SELECT Score_ID, Subname_ID, Unit, User_ID, TestCount, Rightrace, Score, TestDate, Upload FROM Score WHERE (User_ID = @User_ID) AND (Subname_ID = @Subname_ID)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
                      <asp:ControlParameter ControlID="Question_ID" Name="Subname_ID" 
                          PropertyName="Text" Type="Int32" />
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