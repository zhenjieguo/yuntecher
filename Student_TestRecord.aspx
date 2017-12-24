<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Student_TestRecord.aspx.vb" Inherits="Student_TestRecord" %>
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
        <li><a href="Student_TestRecord.aspx" class="navactive">紀錄 <font size="1pt">Record</font></a></li>        
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
       
        <h2>測驗紀錄總覽 Record of Test</h2>
        <p>以下內容為所有按下「記錄」按鈕或教師作業的作答資訊紀錄。</p>
        <br />

        <div align="center" >
            <asp:Button ID="Button1" runat="server" Text="錯誤統計" />
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Score_ID" 
              DataSourceID="SqlDataSource2" Height="1000px" Width="95%">
              <ItemTemplate>
                  <table class="col-full">
                      <tr>
                          <td>
                            &nbsp;<asp:Label ID="Score_IDLabel" runat="server" Text='<%# Eval("Score_ID") %>' 
                      Visible="False" />
&nbsp;<asp:Label ID="User_IDLabel" runat="server" Text='<%# Eval("User_ID") %>' Visible="False" />
                  <br />
                  <table class="style3" width="100%">
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              測驗日期</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              &nbsp;<asp:Label ID="TestDateLabel" runat="server" Text='<%# Eval("TestDate") %>' />
                          </td>
                      </tr>
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              測驗題組</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              <asp:Label ID="Subname_IDLabel" runat="server" Text='<%# Eval("Subname_ID") %>' 
                                  Visible="False" />
                              <asp:Label ID="Subname" runat="server" Text="Subname"></asp:Label>
                              </td>
                      </tr>
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              測驗單元</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              <asp:Label ID="UnitLabel" runat="server" Text='<%# Eval("Unit") %>' />
                          </td>
                      </tr>
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              分數</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              <asp:Label ID="ScoreLabel" runat="server" Text='<%# Eval("Score") %>' />
                          </td>
                      </tr>
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              作答數</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              單選：<asp:Label ID="Count_Single" runat="server" Text="Count_Single"></asp:Label>
                              複選：<asp:Label ID="Count_Multiple" runat="server" Text="Count_Multiple"></asp:Label>
                              <asp:Label ID="TestCountLabel" runat="server" Text='<%# Eval("TestCount") %>' 
                                  Visible="False" />
                          </td>
                      </tr>
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              正確率</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #FFFFFF;">
                              <asp:Label ID="RightraceLabel" runat="server" Text='<%# Eval("Rightrace") %>' />
                          </td>
                      </tr>
                      <tr>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #FFFFFF; text-align: center; background-color: #008080; text-decoration: blink;">
                              繳交狀態</td>
                          <td style="font-family: 微軟正黑體; font-size: 12pt; color: #666666; text-align: left; background-color: #EFFEEB;">
                              <asp:Image ID="Image_Upload" runat="server" 
                                  ImageUrl="~/WebImage/Icon_Check.png" />
                              <asp:Label ID="UploadLabel" runat="server" Text='<%# Eval("Upload") %>' 
                                  Visible="False" />
                              <asp:CheckBox ID="CheckBox_Upload" runat="server" Enabled="False" 
                                  Text='<%# Eval("Upload") %>' Visible="False" />
                          </td>
                      </tr>
                      <tr>
                          <td colspan="2" 
                              
                              
                              style="border-style: none dashed dashed dashed; border-width: 5px; border-color: #999999; padding: 8px; font-family: 微軟正黑體; font-size: 12pt; text-align: center; text-decoration: blink;">
                             <p margin-bottom="10px"> <asp:Button ID="bt_DataList_View" runat="server" 
                                     Text="檢視題目" onclick="bt_DataList_View_Click" /></p>
                              <asp:Button ID="bt_DataList_Delete" runat="server" Text="刪除記錄" 
                                  onclick="bt_DataList_Delete_Click" />
                          </td>
                      </tr>
                      <tr>
                          <td colspan="2">
                              &nbsp;</td>
                      </tr>
                  </table>    
                          </td>
                      </tr>
                  </table>
                  
              </ItemTemplate>
          </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Account %>" 
                SelectCommand="SELECT * FROM [Score] WHERE ([User_ID] = @User_ID)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:Account %>" 
                DeleteCommand="DELETE FROM [Score] WHERE [Score_ID] = @Score_ID" 
                InsertCommand="INSERT INTO [Score] ([Subname_ID], [Unit], [User_ID], [TestCount], [Rightrace], [Score], [TestDate], [Upload]) VALUES (@Subname_ID, @Unit, @User_ID, @TestCount, @Rightrace, @Score, @TestDate, @Upload)" 
                SelectCommand="SELECT * FROM [Score] WHERE ([User_ID] = @User_ID) ORDER BY [TestDate] DESC" 
                UpdateCommand="UPDATE [Score] SET [Subname_ID] = @Subname_ID, [Unit] = @Unit, [User_ID] = @User_ID, [TestCount] = @TestCount, [Rightrace] = @Rightrace, [Score] = @Score, [TestDate] = @TestDate, [Upload] = @Upload WHERE [Score_ID] = @Score_ID">
                <DeleteParameters>
                    <asp:Parameter Name="Score_ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Subname_ID" Type="Int32" />
                    <asp:Parameter Name="Unit" Type="String" />
                    <asp:Parameter Name="User_ID" Type="Int32" />
                    <asp:Parameter Name="TestCount" Type="String" />
                    <asp:Parameter Name="Rightrace" Type="String" />
                    <asp:Parameter Name="Score" Type="Decimal" />
                    <asp:Parameter Name="TestDate" Type="String" />
                    <asp:Parameter Name="Upload" Type="String" />
                </InsertParameters>
                <SelectParameters>
                   <asp:ControlParameter ControlID="lb_User_ID" Name="User_ID" PropertyName="Text" 
                          Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Subname_ID" Type="Int32" />
                    <asp:Parameter Name="Unit" Type="String" />
                    <asp:Parameter Name="User_ID" Type="Int32" />
                    <asp:Parameter Name="TestCount" Type="String" />
                    <asp:Parameter Name="Rightrace" Type="String" />
                    <asp:Parameter Name="Score" Type="Decimal" />
                    <asp:Parameter Name="TestDate" Type="String" />
                    <asp:Parameter Name="Upload" Type="String" />
                    <asp:Parameter Name="Score_ID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
      </article>
    </section>
    

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