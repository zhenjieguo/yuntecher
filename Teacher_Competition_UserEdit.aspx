<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Competition_UserEdit.aspx.vb" Inherits="Teacher_Questions" %>

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
       
        <h2>新增組別 New Group</h2>
        <p>您可以在此針對參賽的學生進行分組的動作。</p>
        <br />

        <div align="center" >
            <p style="margin-bottom: 10px">
            
   <div align=center>
                       <table class="style7" width="100%">
                      <tr>
                          <td class="style9" 
                              style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-width: 3px; border-color: #666666; border-style: solid dashed dotted solid">
                              輸入組別<br /> (產生預覽用)</td>
                          <td class="style10" 
                              style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; text-align: left; vertical-align: middle; border-width: 3px; border-color: #666666; border-top-style: solid; border-right-style: solid; border-bottom-style: dotted">
                              <asp:TextBox ID="Group_tb" runat="server" Height="168px" TextMode="MultiLine" 
                                  Width="100%"></asp:TextBox>
                              <br />
                              <br />
                              範例：<span class="style8">(共三組，每組兩人)</span><br /> &nbsp; 
                              214301,204302/214303,214304/214305,214306<br /> ※「/」為組別分割號；「,」為成員分割號。<br /> 
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 請勿再輸入其他特殊字元。<br />
                              <br /> 
                              <asp:Button ID="Button9" runat="server" Text="預覽" />
                          </td>
                      </tr>
                      <tr>
                          <td class="style9" 
                              style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; vertical-align: middle; text-align: center; border-width: 3px; border-color: #666666; border-style: none dashed solid solid">
                              分組結果<br /> (儲存用)</td>
                          <td class="style10" 
                              style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; text-align: left; vertical-align: middle; border-width: 3px; border-color: #666666; border-top-style: none; border-right-style: solid; border-bottom-style: solid">
                              <asp:Label ID="Member_lb" runat="server"></asp:Label>
                              <br />
                              <br />
                              ※若查無此學號者及重複出現者將自動忽略。</td>
                      </tr>
                      <tr>
                          <td class="style7" colspan="2">
                              <p style="margin-bottom: 10px; text-align: center; margin-top: 10px;"><asp:Button ID="Button7" runat="server" Text="確定" /></p>
                              <p style="margin-bottom: 10px; text-align: center;"><asp:Button ID="Button8" runat="server" Text="取消" /></p>
                          </td>
                      </tr>
                  </table></div>
                  
            
            </p>

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
