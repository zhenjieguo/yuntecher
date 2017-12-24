<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Homework.aspx.vb" Inherits="Teacher_Homework" %>

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
       
        <h2>作業管理 Homework Manage</h2>
        <p>	此為作業管理主頁面，可以瀏覽所有您新增的作業並進行編輯：</p>
        <p>▲點選題庫名稱可看到所有學生繳交的成績。</p>

        <br />

        <div align="center" >

            
            <br />
            <p tyle="margin-bottom: 10px"><asp:Button ID="bt_Homework_Insert" runat="server" 
                    Text="新增作業" /></p>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="HW_ID" 
                DataSourceID="SqlDataSource1" Width="100%" BackColor="White">
                <ItemTemplate>
                    <table class="col-full" 
                        style="font-family: 微軟正黑體; font-size: 12pt; vertical-align: middle; width: 100%; background-color: #F7F3E9;">
                        <tr>
                            <td colspan="2" style="background-color: #AA6748; color: #F7F3E9">
                                <asp:Panel ID="Panel1" runat="server">
                                    <asp:HyperLink ID="Subname" runat="server" Font-Bold="True" Font-Italic="False" 
                                        Font-Size="16pt" Font-Underline="True" ForeColor="#F7F3E9" 
                                        NavigateUrl='<%# "Teacher_Homework_Score.aspx?Homeworkid=" & Eval("HW_ID") %>'>[Subname]</asp:HyperLink>
                                    <asp:Label ID="Subname_ID" runat="server" Text='<%# Eval("Subname") %>' 
                                        Visible="False"></asp:Label>
                                    ─單元：<asp:Label ID="UnitLabel" runat="server" Text='<%# Bind("Subname_Unit") %>'></asp:Label>
                                    &nbsp;[<asp:Label ID="QuizMode_lb" runat="server" Text='<%# Bind("TestTime") %>'></asp:Label>
                                    ]<asp:Label ID="Hwid" runat="server" Text='<%# Eval("HW_ID") %>' 
                                        Visible="False"></asp:Label>
                                </asp:Panel>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-width: 3px; border-color: #dbc095; vertical-align: middle; text-align: center; color: #c87832; border-bottom-style: dashed;">
                                作業期間</td>
                            <td style="border-color: #dbc095; border-width: 3px; vertical-align: middle; text-align: left; color: #c87832; border-left-style: dashed; border-right-style: none; border-bottom-style: dashed;">
                                <asp:Label ID="starttime" runat="server" Text='<%# Bind("Date_Start") %>'></asp:Label>
                                ～&nbsp;<asp:Label ID="Endtime" runat="server" Text='<%# Bind("Date_End") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-width: 3px; border-color: #dbc095; vertical-align: middle; text-align: center; color: #c87832; border-bottom-style: dashed;">
                                題數限制</td>
                            <td style="border-color: #dbc095; border-width: 3px; vertical-align: middle; text-align: left; color: #c87832; border-left-style: dashed; border-right-style: none; border-bottom-style: dashed;">
                                單選：<asp:Label ID="Count_Single" runat="server"></asp:Label>
                                <br />
                                複選：<asp:Label ID="Count_Multiple" runat="server"></asp:Label>
                                <asp:Label ID="Testcount" runat="server" Text='<%# Bind("TestCount") %>' 
                                    Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-width: 3px; border-color: #dbc095; vertical-align: middle; text-align: center; color: #c87832; border-bottom-style: dashed;">
                                參與班級</td>
                            <td style="border-color: #dbc095; border-width: 3px; vertical-align: middle; text-align: left; color: #c87832; border-left-style: dashed; border-right-style: none; border-bottom-style: dashed;">
                                <asp:Label ID="classlabel" runat="server" Text='<%# Bind("Student_Group") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="border-width: 3px; border-color: #dbc095; vertical-align: middle; text-align: center; color: #c87832; border-bottom-style: dotted;">
                                教師備註</td>
                            <td style="border-color: #dbc095; border-width: 3px; vertical-align: middle; text-align: left; color: #c87832; border-left-style: dashed; border-right-style: none; border-bottom-style: dotted;">
                                <asp:Label ID="NoteLabel" runat="server" Text='<%# Bind("HW_Note") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" 
                                
                                style="margin: 10px; border-width: 3px; border-color: #dbc095; vertical-align: middle; text-align: center; color: #c87832; border-bottom-style: none;">
                                <p style="margin-bottom: 10px; margin-top: 10px;"><asp:Button ID="Button1" 
                                        runat="server" Text="編輯" onclick="Button1_Click" /></p>
                                <p style="margin-bottom: 10px;"><asp:Button ID="Button2" runat="server" Text="刪除" 
                                        CommandName="delete" onclick="Button2_Click" 
                                        onclientclick="return confirm('確定要刪除嗎？')" /></p>
                            </td>
                        </tr>
                    </table>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="nodataLB" runat="server" Font-Names="Berlin Sans FB" 
                Font-Size="30pt" ForeColor="Red" Text="Oh!Oh! No Data!!" Visible="False"></asp:Label>

            
        </div>
      </article>
    </section>
    
   
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Homework %>" 
          DeleteCommand="DELETE FROM [Homework] WHERE [HW_ID] = @HW_ID" 
          InsertCommand="INSERT INTO [Homework] ([Teacher_ID], [Date_Start], [Date_End], [Subname], [Student_Group], [HW_Note]) VALUES (@Teacher_ID, @Date_Start, @Date_End, @Subname, @Student_Group, @HW_Note)" 
          SelectCommand="SELECT * FROM [Homework] WHERE ([Teacher_ID] = @Teacher_ID) ORDER BY [TestTime]DESC,[Date_Start], [Date_End]" 
          UpdateCommand="UPDATE [Homework] SET [Teacher_ID] = @Teacher_ID, [Date_Start] = @Date_Start, [Date_End] = @Date_End, [Subname] = @Subname, [Student_Group] = @Student_Group, [HW_Note] = @HW_Note WHERE [HW_ID] = @HW_ID">
          <DeleteParameters>
              <asp:Parameter Name="HW_ID" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="Teacher_ID" Type="Int32" />
              <asp:Parameter Name="Date_Start" Type="DateTime" />
              <asp:Parameter Name="Date_End" Type="String" />
              <asp:Parameter Name="Subname" Type="Int32" />
              <asp:Parameter Name="Student_Group" Type="String" />
              <asp:Parameter Name="HW_Note" Type="String" />
          </InsertParameters>
          <SelectParameters>
              <asp:ControlParameter ControlID="lb_User_ID" Name="Teacher_ID" PropertyName="Text" 
                          Type="Int32" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="Teacher_ID" Type="Int32" />
              <asp:Parameter Name="Date_Start" Type="DateTime" />
              <asp:Parameter Name="Date_End" Type="String" />
              <asp:Parameter Name="Subname" Type="Int32" />
              <asp:Parameter Name="Student_Group" Type="String" />
              <asp:Parameter Name="HW_Note" Type="String" />
              <asp:Parameter Name="HW_ID" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>

      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Account %>" 
          SelectCommand="SELECT * FROM [Group] WHERE ([Group_TeacherID] = @Group_TeacherID) ORDER BY [Group_Name]">
          <SelectParameters>
              <asp:ControlParameter ControlID="lb_User_ID" Name="Group_TeacherID" PropertyName="Text" 
                          Type="Int32" />
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
