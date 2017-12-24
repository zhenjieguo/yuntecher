<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teacher_Question_View.aspx.vb" Inherits="Teacher_Question_View" %>

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
       
        <h2>題目管理 Questions Manage</h2>
        <p>以下為所有 「<asp:Label ID="lb_Question_Subname" runat="server" Text="Label"></asp:Label>」 題庫的題目，可以進行個別的編刪動作。</p>
        <p>※更改題目後須重新鏈結，更改結果方可呈現</p>
        <br />

        <div align="center" >
           
            <p> 
                <asp:Button ID="bt_QuestionFile_Upload" runat="server" Text="新增題目" />
            </p>
           
            <br />
            <div style="border: 3px dashed #666666; margin: 20px; font-family: 微軟正黑體; font-size: 14pt; color: #333333">單元：<asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" style="max-height:300px;">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource2" DataTextField="Question_Unit" 
                DataValueField="Question_Unit">
                </asp:CheckBoxList>
                </asp:Panel>
            </div>

            <p> <asp:Button ID="bt_DataBind" runat="server" Text="重新鏈結"></asp:Button></p>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="Question_ID" 
                DataSourceID="SqlDataSource1" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="題目" SortExpression="Question_Remark">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Question_Remark") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <table style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; width: 100%">
                                <tr>
                                    <td class="style1" 
                                        style="border-style: solid dashed solid solid; border-width: 3px 3px 1px 3px; border-color: #666666; vertical-align: middle; text-align: center; width: 100px">
                                        (<asp:Label ID="Question_IDLabel" runat="server" 
                                            Text='<%# Eval("Question_ID") %>'></asp:Label>
                                        )<br />單元<asp:Label ID="Label_Unit" runat="server" 
                                            Text='<%# Eval("Question_Unit") %>'></asp:Label>
                                        -<asp:Label ID="Label_Remark" runat="server" 
                                            Text='<%# Eval("Question_Remark") %>'></asp:Label>
                                    </td>
                                    <td class="style1" colspan="4" 
                                        
                                        style="border-style: solid solid solid none; border-width: 3px 3px 1px 3px; border-color: #333333">
                                        <asp:Label ID="Question_QuestionLabel" runat="server" 
                                            Text='<%# Eval("Question_Question") %>' />
                                        <br />
                                        <br />
                                        <asp:Image ID="Image1" runat="server" 
                                            ImageUrl='<%# "~/Question_Pic/" & Eval("Question_Picture") %>' Width="50%" />
                                        <br />
                                        <asp:HyperLink ID="HyperLink1" runat="server" 
                                            NavigateUrl='<%# "~/Question_Pic/" & Eval("Question_Picture") %>' 
                                            Text='<%# Eval("Question_Picture") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="style1" 
                                        style="border-style: none dashed solid solid; border-width: 1px 3px 3px 3px; border-color: #666666; vertical-align: middle; text-align: center; width: 50px">
                                        <asp:Label ID="Question_AnsCountLabel" runat="server" 
                                            Text='<%# Eval("Question_AnsCount") %>' />
                                    </td>
                                    <td style="background-color: #FFCC99; color: #FFFFFF; vertical-align: middle; text-align: center; border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333;">
                                        答案</td>
                                    <td style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333; border-right-style: dashed; border-right-width: 3px; border-right-color: #333333; text-align: center; vertical-align: middle;">
                                        <asp:Label ID="Question_AnsLabel" runat="server" 
                                            Text='<%# Eval("Question_Ans") %>' />
                                    </td>
                                    <td style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333; border-right-style: none; border-right-width: 3px; border-right-color: #333333; text-align: center; width: 15%;">
                                        <asp:Button ID="lb_Row_Edit" runat="server" Text="編輯" 
                                            onclick="lb_Row_Edit_Click" />
                                    </td>
                                    <td style="border-bottom-style: solid; border-bottom-width: 3px; border-bottom-color: #333333; border-right-style: solid; border-right-width: 3px; border-right-color: #333333; text-align: center; width: 15%;">
                                        <asp:Button ID="lb_Row_Del" runat="server" CommandName="Delete" 
                                            onclick="lb_Row_Del_Click" onclientclick="return confirm('確定要刪除嗎？')" 
                                            Text="刪除" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerSettings PageButtonCount="20" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>

            <asp:Label ID="nodataLB" runat="server" Font-Names="Berlin Sans FB" 
                  Font-Size="30pt" ForeColor="Maroon" Text="Oh!Oh! No Data!!" 
                Visible="False"></asp:Label>
        </div>
      </article>
    </section>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Question %>" 
          
          SelectCommand="SELECT * FROM [Question] WHERE (([Question_SubName] = @Question_SubName) AND (@Question_Unit LIKE '%' + [Question_Unit] + '%')) ORDER BY [Question_ID]" 
          DeleteCommand="DELETE FROM [Question] WHERE [Question_ID] = @Question_ID" 
          InsertCommand="INSERT INTO [Question] ([Question_SubName], [Question_Unit], [Question_Ans], [Question_AnsCount], [Question_Question], [Question_Picture], [Question_Remark]) VALUES (@Question_SubName, @Question_Unit, @Question_Ans, @Question_AnsCount, @Question_Question, @Question_Picture, @Question_Remark)" 
          
          UpdateCommand="UPDATE [Question] SET [Question_SubName] = @Question_SubName, [Question_Unit] = @Question_Unit, [Question_Ans] = @Question_Ans, [Question_AnsCount] = @Question_AnsCount, [Question_Question] = @Question_Question, [Question_Picture] = @Question_Picture, [Question_Remark] = @Question_Remark WHERE [Question_ID] = @Question_ID">
          <DeleteParameters>
              <asp:Parameter Name="Question_ID" Type="Int32" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="Question_SubName" Type="Int32" />
              <asp:Parameter Name="Question_Unit" Type="String" />
              <asp:Parameter Name="Question_Ans" Type="String" />
              <asp:Parameter Name="Question_AnsCount" Type="Int32" />
              <asp:Parameter Name="Question_Question" Type="String" />
              <asp:Parameter Name="Question_Picture" Type="String" />
              <asp:Parameter Name="Question_Remark" Type="String" />
          </InsertParameters>
          <SelectParameters>
              <asp:QueryStringParameter Name="Question_SubName" QueryStringField="Questionid" 
                  Type="Int32" />
              <asp:QueryStringParameter Name="Question_Unit" QueryStringField="unit" 
                  Type="String" />
          </SelectParameters>
          <UpdateParameters>
              <asp:Parameter Name="Question_SubName" Type="Int32" />
              <asp:Parameter Name="Question_Unit" Type="String" />
              <asp:Parameter Name="Question_Ans" Type="String" />
              <asp:Parameter Name="Question_AnsCount" Type="Int32" />
              <asp:Parameter Name="Question_Question" Type="String" />
              <asp:Parameter Name="Question_Picture" Type="String" />
              <asp:Parameter Name="Question_Remark" Type="String" />
              <asp:Parameter Name="Question_ID" Type="Int32" />
          </UpdateParameters>
      </asp:SqlDataSource>
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
          ConnectionString="<%$ ConnectionStrings:Question %>" 
          SelectCommand="SELECT DISTINCT [Question_Unit], [Question_SubName] FROM [Question] WHERE ([Question_SubName] = @Question_SubName) ORDER BY [Question_Unit]">
          <SelectParameters>
              <asp:QueryStringParameter Name="Question_SubName" QueryStringField="Questionid" 
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
          <li>Copyright©       <li>CSS：<a href="http://www.free-css.com/" target="blank"> Free Css </a>- <a href="http://www.free-css.com/free-css-templates/page163/designa-2.01" target="blank">Sylvain Lafitte</a></li>
      
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
