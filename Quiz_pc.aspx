<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Quiz_pc.aspx.vb" Inherits="Quiz_pc" %>

<!DOCTYPE html>

<html class="no-js" lang="en">

<head runat="server">

<title>Yuntecher</title>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width">

<link rel="shortcut icon" type="WebImage/System/x-icon" href="WebImage/System/yuntech.ico">
<link rel="shortcut icon" type="WebImage/System/png" href="WebImage/System/favicon.png">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/style.css">


<style type="text/css">
    .Tb_title{
        border-style: solid;
        border-width: 3px;
        text-align: left;
        vertical-align: middle;
        width:100%;
    }

.Tb_Submit
    {
        width: 100%;
        text-align:center;
        margin-top:20px;
    }

.style7
    {
        width: 100%;
        background-color: #3366FF;
    }
</style>
</head>


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
    </nav>
    
  </header>
  
  
  <div class="about-page main grid-wrap">
    <header class="grid col-full"><hr></header>
    <section class="grid col-three-quarters mq2-col-full" >
    <asp:Label ID="lb_Subname" runat="server" Font-Bold="True" Font-Names="微軟正黑體" 
          Font-Size="28pt"></asp:Label> 
     <asp:Panel ID="Panel2" runat="server" Font-Names="微軟正黑體" 
                  ForeColor="White" Width="100%" Visible="False">
              <table class="Tb_title">
                  <tr>
                      <td style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; text-align: center; vertical-align: middle">
                          成績：<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                              Font-Size="18pt" ForeColor="Red" Text="100"></asp:Label>
                          &nbsp; 分&nbsp;
                          <br />
                          <asp:Label ID="Test_Start_lb" runat="server" Visible="False"></asp:Label>
                          <asp:Label ID="TotalTestTime_lb" runat="server"></asp:Label>
                      </td>
                      <td width="70%" 
                          style="font-family: 微軟正黑體; font-size: 12pt; color: #333333; text-align: center; vertical-align: middle">
                          <asp:imageButton ID="Button_Recording" runat="server" Height="50px" Text="回首頁" 
                              ImageUrl="~/WebImage/Icon_Recorder.png" CssClass="imageButton" 
                              Width="133px" />
                           <asp:Label ID="lb_Message" runat="server" Text="(分數、勾選題目)  ※需記錄比賽分數才會累計"></asp:Label>
                           <br />
                              &nbsp;<a href="Index.aspx"><asp:Image ID="Image_Home" runat="server" 
                              Height="40px" ImageUrl="~/WebImage/Icon_Home.png" />
                          </a>&nbsp;&nbsp;<a href="Quiz_Choose.aspx"><asp:Image ID="Image_GoList" 
                              runat="server" Height="40px" ImageUrl="~/WebImage/GoList.png" />
                          </a>&nbsp;
                         <a href="Student_Homework.aspx"><asp:Image ID="Image_GoHomework" runat="server" Height="40px" 
                              ImageUrl="~/WebImage/GoHomework.png" /></a>


                      </td>
                  </tr>
              </table>
           
          </asp:Panel>
           <br />
              <asp:GridView ID="GridView_Single" runat="server" AutoGenerateColumns="False" 
                  CellPadding="4" DataKeyNames="Question_ID" DataSourceID="SqlDataSource1" 
                  ForeColor="#333333" GridLines="None" Width="100%">
                  <AlternatingRowStyle BackColor="White" />
                  <Columns>
                      <asp:TemplateField HeaderText="序">
                          <ItemTemplate>
                              <asp:Label ID="NoLB" runat="server"></asp:Label>
                              <asp:Label ID="QSID" runat="server" Text='<%# Eval("Question_ID") %>' 
                                  Visible="False"></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" Width="20px" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="選項">
                          <ItemTemplate>
                              <asp:RadioButtonList ID="RadioOptions" runat="server" Font-Names="微軟正黑體" 
                                  Font-Size="12pt" RepeatDirection="Vertical">
                              </asp:RadioButtonList>
                              <asp:Label ID="Ans" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" />
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="題目" SortExpression="Question_Question">
                          <ItemTemplate>
                              <asp:Label ID="QuestionLB" runat="server" 
                                  Text='<%# Bind("Question_Question") %>'></asp:Label>
                              &nbsp; (<asp:Label ID="UnitLabel" runat="server" 
                                  Text='<%# Eval("Question_Unit") %>' Visible="False"></asp:Label>
                              -<asp:Label ID="QuestionNumLabel" runat="server" 
                                  Text='<%# Eval("Question_Remark") %>' Visible="False"></asp:Label>
                              )
                          </ItemTemplate>
                          <HeaderStyle HorizontalAlign="Center" Width="75%" />
                          <ItemStyle HorizontalAlign="Left" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="圖片" SortExpression="Question_Picture">
                          <ItemTemplate>
                              <a class="example-image-link" 
                                  href="Question_Pic/<%# Eval("Question_Picture") %>" 
                                  data-lightbox="example-1" target="_blank">
                              <asp:Image ID="Image1" runat="server"  class="example-image" 
                                  ImageUrl="~/WebImage/eye2.png" alt="image-1" width="40px" Visible="False"/></a>
                         
                              <asp:Label ID="Label2" runat="server" 
                                  Text='<%# "~/Question_Pic/" & Eval("Question_Picture") %>' Visible="False"></asp:Label>
                         
                          </ItemTemplate>
                          <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="不熟">
                          <ItemTemplate>
                              <asp:CheckBox ID="CheckBox1" runat="server" />
                          </ItemTemplate>
                          <ItemStyle Font-Strikeout="False" HorizontalAlign="Center" 
                              VerticalAlign="Middle" />
                      </asp:TemplateField>
                  </Columns>
                  <EditRowStyle BackColor="#7C6F57" />
                  <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#E3EAEB" />
                  <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                  <SortedAscendingCellStyle BackColor="#F8FAFA" />
                  <SortedAscendingHeaderStyle BackColor="#246B61" />
                  <SortedDescendingCellStyle BackColor="#D4DFE1" />
                  <SortedDescendingHeaderStyle BackColor="#15524A" />
              </asp:GridView>
                             <asp:Panel ID="Panel_Mul" runat="server" Visible="False" Width="100%">
                                 複選題<br /> 
                                 <asp:GridView ID="GridView_Mul" runat="server" AutoGenerateColumns="False" 
                                     CellPadding="4" DataKeyNames="Question_ID" DataSourceID="SqlDataSource2" 
                                     ForeColor="#333333" GridLines="None" Width="100%">
                                     <AlternatingRowStyle BackColor="White" />
                                     <Columns>
                                         <asp:TemplateField HeaderText="序">
                                             <ItemTemplate>
                                                 <asp:Label ID="NoLB" runat="server"></asp:Label>
                                                 <asp:Label ID="QSID" runat="server" Text='<%# Eval("Question_ID") %>' 
                                                     Visible="False"></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle HorizontalAlign="Center" Width="20px" />
                                             <ItemStyle HorizontalAlign="Center" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="選項">
                                             <ItemTemplate>
                                                 <asp:CheckBoxlist ID="RadioOptions" runat="server" 
                                                     RepeatDirection="Vertical" Font-Size="12" />
                                                 <asp:Label ID="Ans" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                             </ItemTemplate>
                                             <HeaderStyle HorizontalAlign="Center" />
                                             <ItemStyle HorizontalAlign="Center" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="題目" SortExpression="Question_Question">
                                             <ItemTemplate>
                                                 <asp:Label ID="QuestionLB" runat="server" 
                                                     Text='<%# Bind("Question_Question") %>'></asp:Label>
                                                 &nbsp; (<asp:Label ID="UnitLabel" runat="server" 
                                                     Text='<%# Eval("Question_Unit") %>' Visible="False"></asp:Label>
                                                 -<asp:Label ID="QuestionNumLabel" runat="server" 
                                                     Text='<%# Eval("Question_Remark") %>' Visible="False"></asp:Label>
                                                 )
                                             </ItemTemplate>
                                             <HeaderStyle HorizontalAlign="Center" Width="75%" />
                                             <ItemStyle HorizontalAlign="Left" />
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="圖片" SortExpression="Question_Picture">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label2" runat="server" 
                                                     Text='<%# "~/Question_Pic/" & Eval("Question_Picture") %>' Visible="False"></asp:Label>
                                                 <a class="example-image-link" data-lightbox="example-1" 
                                                     href='Question_Pic/<%# Eval("Question_Picture") %>'  target="_blank">
                                                 <asp:Image ID="Image1" runat="server" alt="image-1" class="example-image" 
                                                     ImageUrl="~/WebImage/eye2.png" Visible="False" width="40px" />
                                                 </a>
                                             </ItemTemplate>
                                         </asp:TemplateField>
                                         <asp:TemplateField HeaderText="不熟">
                                             <ItemTemplate>
                                                 <asp:CheckBox ID="CheckBox1" runat="server" />
                                             </ItemTemplate>
                                             <ItemStyle Font-Strikeout="False" HorizontalAlign="Center" 
                                                 VerticalAlign="Middle" />
                                         </asp:TemplateField>
                                     </Columns>
                                     <EditRowStyle BackColor="#7C6F57" />
                                     <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                     <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                     <RowStyle BackColor="#E3EAEB" />
                                     <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                     <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                     <SortedAscendingHeaderStyle BackColor="#246B61" />
                                     <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                     <SortedDescendingHeaderStyle BackColor="#15524A" />
                                 </asp:GridView>
                             </asp:Panel>
                            <table class="Tb_Submit">
                               <tr>
                                 <td>
                                     <asp:Button ID="Button_TestEnd" runat="server" Text="交卷" />
                                    <asp:TextBox ID="TextBox1" runat="server" Visible="False" TextMode="Password" placeholder="我不會告訴你只要輸入製作者的電話，系統就會幫你做答的"></asp:TextBox>
                                    <asp:Button ID="Button6" runat="server" Text="不顯示" Visible="False" />
                                    <asp:Label ID="TotalAndRight_lb" runat="server" Visible="False"></asp:Label>
                                </td>
                              </tr>
                          </table>
    </section>
  </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Question %>" 
        SelectCommand="SELECT Top 80* FROM [Question] WHERE ([Question_SubName] = @Question_SubName) ORDER BY NewID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="Question_SubName" QueryStringField="Quizid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:Question %>" 
        SelectCommand="SELECT Top 80* FROM [Question] WHERE ([Question_SubName] = @Question_SubName) ORDER BY NewID()">
        <SelectParameters>
            <asp:QueryStringParameter Name="Question_SubName" QueryStringField="Quizid" />
        </SelectParameters>
    </asp:SqlDataSource>

  <!--main-->
<div class="divide-top">
    <footer class="grid-wrap" >
      <nav class="grid col-full" >
        <ul>
          <li>Copyright©</li>
          <li>CSS：<a href="http://www.free-css.com/" target="blank"> Free Css </a>- <a href="http://www.free-css.com/free-css-templates/page163/designa-2.01" target="blank">Sylvain Lafitte</a></li>
          <li><asp:LinkButton ID="LinkButton1" runat="server">.</asp:LinkButton></li>
        </ul>
      </nav>
    </footer>
    
  </div>
</div>

<!-- Javascript - jQuery -->
<script src="js/jquery-1.7.2.min.js"></script>
<!--[if (gte IE 6)&(lte IE 8)]><script src="js/selectivizr.js"></script><![endif]-->
<script src="js/scripts.js"></script>
    </form>
</body>
</html>