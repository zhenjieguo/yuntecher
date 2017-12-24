<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Question_Information_Style.aspx.vb" Inherits="Teacher_Question_Information_Style" %>

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
  
  	<a href="" class="logo fleft"> <img src="WebImage/System/logo.png" alt=""> </a> <!--Logo Title><!-->
  
    
  </header>
  
  <div class="about-page main grid-wrap">
    <header class="grid col-full">
      <hr>
      <p class="fleft"><asp:Label 
                ID="lb_User_ID" runat="server" Visible="False"></asp:Label><asp:SiteMapPath ID="SiteMapPath1" runat="server">
          <CurrentNodeStyle Font-Names="微軟正黑體" ForeColor="#333333" />
          <NodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          <RootNodeStyle Font-Names="微軟正黑體" ForeColor="Gray" />
          </asp:SiteMapPath></p>
    </header>

     
  <section class="grid col-three-quarters mq2-col-full" > 
       <article id="navteam">
       
        <h2>選項編輯 Option Manage</h2>
        <p>此為編輯選項類型之頁面：</p>
        <p>▲上半部可對既有的選項類行進行刪除。<p/>
        <p>▲下半部可對新的選項進行新增<br/>&nbsp; &nbsp; &nbsp; &nbsp;選項名稱─簡短代號代表此選項<br/>&nbsp; &nbsp; &nbsp; &nbsp;選項類型─以「,」來分割不同的選項</P>

        <br />

        <div align="center" >
            <p>
                <table class="col-full">
                    <tr>
                        <td colspan="2" 
                            style="font-family: 微軟正黑體; font-size: 16pt; color: #FFFFFF; background-color: #61707D; border-color: #61707D; vertical-align: middle; text-align: center; text-decoration: blink;">
                            編輯選項</td>
                    </tr>
                    <tr>
                        <td style="border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: center; border-left-style: solid; border-right-style: dashed; border-bottom-style: dotted;">
                            既有選項</td>
                        <td style="border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: left; border-right-style: solid; border-bottom-style: dotted;">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1" DataTextField="Style_Name" 
                    DataValueField="Style_ID">
                </asp:DropDownList>
                <asp:Label ID="SelectValue" runat="server" Font-Names="微軟正黑體" Font-Size="10pt" 
                    Font-Underline="False" ForeColor="#333333"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" 
                            style="border-style: none solid solid solid; border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: center">
                <asp:Button ID="Button2" runat="server" 
                    onclientclick="return confirm('確定要刪除嗎？')" Text="刪除" />
                        </td>
                    </tr>
                </table>
            </p>

            <p>
                
                <table class="col-full">
                    <tr>
                        <td colspan="2" 
                            style="font-family: 微軟正黑體; font-size: 16pt; color: #FFFFFF; background-color: #61707D; border-color: #61707D; vertical-align: middle; text-align: center; text-decoration: blink;">
                            新增選項</td>
                    </tr>
                    <tr>
                        <td style="border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: center; border-left-style: solid; border-right-style: dashed; border-bottom-style: dashed;">
                
                <asp:Label ID="Label1" runat="server" Font-Names="微軟正黑體" Font-Size="10pt" 
                    Font-Underline="False" ForeColor="#333333" Text="類型名稱(選擇(Eng4))："></asp:Label>
                        </td>
                        <td style="border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: left; border-right-style: solid; border-bottom-style: dashed;">
                <asp:TextBox ID="SytleNameTB" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: center; border-left-style: solid; border-right-style: dashed; border-bottom-style: dotted;">
                <asp:Label ID="Label2" runat="server" Font-Names="微軟正黑體" Font-Size="10pt" 
                    Font-Underline="False" ForeColor="#333333" Text="類型選項(A,B,C,D)："></asp:Label>
                        </td>
                        <td style="border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: left; border-right-style: solid; border-bottom-style: dashed;">
                <asp:TextBox ID="StyleOptionsTB" runat="server" CssClass="style9"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" 
                            style="border-style: none solid solid solid; border-width: 3px; font-family: 微軟正黑體; font-size: 12pt; color: #333333; background-color: #CAC2B5; border-color: #61707D; vertical-align: middle; text-align: center">
                <asp:Button ID="Button1" runat="server" CssClass="style7" Text="新增" />
                
                        </td>
                    </tr>
                </table>
                
            </p>
            
        </div>
      </article>
    </section>
    
      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Question %>" 
          DeleteCommand="DELETE FROM [Style] WHERE [Style_ID] = @Style_ID" 
          InsertCommand="INSERT INTO [Style] ([Style_Name], [Style_Options]) VALUES (@Style_Name, @Style_Options)" 
          SelectCommand="SELECT * FROM [Style]" 
          UpdateCommand="UPDATE [Style] SET [Style_Name] = @Style_Name, [Style_Options] = @Style_Options WHERE [Style_ID] = @Style_ID">
          <DeleteParameters>
              <asp:Parameter Name="Style_ID" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="Style_Name" Type="String" />
              <asp:Parameter Name="Style_Options" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="Style_Name" Type="String" />
              <asp:Parameter Name="Style_Options" Type="String" />
              <asp:Parameter Name="Style_ID" Type="Int32" />
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

