<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     
</asp:Content>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
   
    <%--<button style="background-color:#7499b9; color:White;width:35px;" onclick="openWin(); return false;">Add/Edit</button>--%>

    <div id="templatemo_slider"> 
       <div id="toprow">
          <div class="center" >
            <div id="cubershadow" >
              <div id="cu3er-container"> <a href="http://www.adobe.com/go/getflashplayer">
                   <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="" /> </a> </div>
            </div>
          </div>
        </div>
        
</div>
    
    
    
        <div id="templatemo_content" >
    	
            <div class="col_w300">
		
            <marquee direction=up height=440 onMouseOut=this.start(); 
                        onMouseOver=this.stop(); scrollamount=2 scrolldelay=70 
                        width=190 left="30" top="0" Background="white"> <br />

            <p><u><strong>NEW TASBEEHS</strong></u></p>
            <p><a href="../newarrival.aspx"><img src="images/books/1.png" class="ImageSize"  /></a></p>
            <p><strong>1-Setigi Wood Black(12mm & 14mm)</strong></p>
            <br/>	
            <p><a href="../newarrival.aspx"><img src="images/books/2.png" width="100%" height="100%"/></a></p>
            <p><strong>2-Galih Asem Wood(12mm & 14mm)</strong></p>
            <br/>
            <p><a href="../newarrival.aspx"><img src="images/books/3.png" width="100%" height="100%"/></a></p>
            <p><strong>3-Setigi Wood Brown(12mm & 14mm)</strong></p>
            <br />
            <p><a href="../newarrival.aspx"><img src="images/books/aa.png" width="100%" height="100%"/></a></p>
            <p><strong>4-Setigi Wood Maroon(12mm & 14mm)</strong></p>
            <br />                     
             <p> To Purchase all products  <strong>from Gujar Khan</strong></p><p>Contact: <br/>
             <strong>  Abdullah Muhammad <br/>Cell# +92 300 514 3888</strong> </p><br/>

            <p>Click for <a href="../newarrival.aspx"><strong>NewArrival Details</strong></a></p>
            </marquee>

        		
        </div>
        
            <div class="col_w300m">
            <%-- <iframe frameborder="0" width="420" height="318" src="http://www.dailymotion.com/embed/video/xxm90m"></iframe><br />
            <a href="http://www.dailymotion.com/video/xxm90m_grand-annual-academic-session-gujarkhan-2013-qna_school" target="_blank">
                Grand Annual Academic Session Gujarkhan-2013 (QnA)</a> <i>by <a href="http://www.dailymotion.com/alamaat" target="_blank">alamaat</a></i>
                <iframe id="dm_jukebox_iframe" style="overflow:hidden; margin:0; padding:0; width: 420px; height: 462px;" width="462" align="center" frameborder="0" marginwidth="0" marginheight="0" 
                    src="http://www.dailymotion.com/widget/jukebox?list[]=%2Fplaylist%2Fx2k98z_alamaat_islam-aik-nazriya-aik-zaroorat%2F1&skin=default&autoplay=0&automute=0"></iframe>--%>
            <%--<iframe id="dm_jukebox_iframe" style="overflow:hidden; margin:0; padding:0; width: 420px; height: 340px;" marginwidth="0" marginheight="0" src="http://www.dailymotion.com/widget/jukebox?list[]=%2Fplaylist%2Fx2qi2z_alamaat_nazria-e-shafaat-aor-muqam-e-waseela%2F1&skin=default&autoplay=0&automute=0" align="middle" frameborder="0" width="100%"></iframe>--%>
                <iframe frameborder="0" width="450" height="360" src="http://www.dailymotion.com/embed/video/xvnqie?autoplay=0&logo=1&hideInfos=0&start=0&syndication=149418&foreground=&highlight=&background="></iframe>
           <br /><br /> <div style="text-align:center; width:450px">
				   <a href="Item.aspx"><img src="Images/books/foi2.jpg" class="author_image" alt="" width="450px"  />

				   </a>	
                   	 <a href="Item.aspx" style="text-align:center">Subscribe it now for January 2014 Edition</a>	   
            </div>
                 
        </div>
        
            <div class="col_w300 col_last" style="float:right; text-align:center">
            
            <marquee direction=down height=440 onMouseOut=this.start(); 
                        onMouseOver=this.stop(); scrollamount=2 scrolldelay=70 
                        width=190 left="30" top="0"> <br />

            <p><u><strong>LATEST BOOKS</strong></u></p>
             <p><a href="../item.aspx">Subscribe it Now</a></p>
            <p><a href="../item.aspx"><img src="images/books/36.jpg" width="150px" heigh="150px" /></a></p>
            <p><strong>1-Fehm-O-Idrak.</strong><br />under the Guidence of<br />
                        <strong>Prof.Ahmad Rafique Akhtar</strong><br />
                        November 2013 Edition 
           
                         </p>
            <br/>
            <p><a href="../newarrival.aspx"><img src="images/books/Mehzar-e-Takhleeq.jpg" /></a></p>
            <p><strong>2-Mehzar-e-Takhleeq.</strong></p>
            <br/>	
            <p><a href="../newarrival.aspx"><img src="images/books/Istafsaraat2a.jpg" /></a></p>
            <p><strong>3-Istafsaraat Vol-2</strong></p>
            <br/>
            <p><a href="../newarrival.aspx"><img src="images/books/Matla-e-Asaar2.jpg" /></a></p>
            <p><strong>4-Matla-e-Asaar</strong></p>
            <br />
            <p><a href="../newarrival.aspx"><img src="images/books/Sar-e-Rah-e-Gahay.jpg" /></a></p>
            <p><strong>5-Sar-e-Rah-e-Gahay</strong></p>
            <br />                     
            
           <%-- <p><u><strong>NEW TASBEEHS</strong></u></p>
            <p><a href="../newarrival.aspx"/><img src="images/books/Setigi Black - 1.jpg" width="100%" height="100%"/></a></p>
            <p><strong>1-Setigi Wood Black(12mm & 14mm)</strong></p>
            <br/>	
            <p><a href="../newarrival.aspx"/><img src="images/books/Galih Asem.jpg" width="100%" height="100%"/></a></p>
            <p><strong>2-Galih Asem Wood(12mm & 14mm)</strong></p>
            <br/>
            <p><a href="../newarrival.aspx"/><img src="images/books/Brown Setigi 1.jpg" width="100%" height="100%"/></a></p>
            <p><strong>3-Setigi Wood Brown(12mm & 14mm)</strong></p>
            <br />
            <p><a href="../newarrival.aspx"/><img src="images/books/aa.jpg" width="100%" height="100%"/></a></p>
            <p><strong>4-Setigi Wood Maroon(12mm & 14mm)</strong></p>
            <br />                   --%>  
             <p> To Purchase all products  <strong>from Gujar Khan</strong></p><p>Contact: <br/>
             <strong>  Abdullah Muhammad <br/>Cell# +92 300 514 3888</strong> </p><br/>

            <p>Click for <a href="../newarrival.aspx"><strong>NewArrival Details</strong></a></p>
            </marquee>
    </div>
        
    	<div class="cleaner"></div>
        
    </div>  
             
            <%--<telerik:RadWindowManager ID="RadWindowManager1" ShowContentDuringLoad="false" VisibleStatusbar="false"
      ReloadOnShow="true"   runat="server" EnableShadow="true">
      <Windows>
        <telerik:RadWindow ID="RadWindow1" KeepInScreenBounds="true" VisibleOnPageLoad="true"
             BorderColor="#FF6D00" Width="460px" Height="300px" runat="server" Behaviors="Close" BorderStyle="None" BorderWidth="0" 
            NavigateUrl="subscribe.aspx" />
          </Windows>
  </telerik:RadWindowManager>
    --%>
    <div>
        <asp:Image ImageUrl="~/Images/Events/1.gif" runat="server" Width="940px" />
        <asp:Panel ID="pnlLogin" runat="server">
            <div style="float:left;clear:both">
                <%--<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/ALAMRAA" data-width="45" data-height="45" data-colorscheme="light" data-layout="standard" data-action="like" data-show-faces="true" data-send="false"></div>--%>
               
                <%--<iframe src="//www.facebook.com/plugins/like.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2FALAMRAA&amp;width=45&amp;height=80&amp;colorscheme=light&amp;layout=standard&amp;action=like&amp;show_faces=true&amp;send=false&amp;appId=508197835942931" 
                     style="border:none; overflow:hidden; width:50px;height:25px; float:left" ></iframe>
               
                <asp:Label runat="server" ID="lbluser" Text="" />people like <a href="http://www.facebook.com/ALAMRAA" target="_blank">Alamaat</a>--%>
                <%--<asp:AsyncFileUpload ID="ThumbUpload" CompleteBackColor="White" BackColor="white" BorderWidth="0px" Width="350px" Height="5px"   runat="server" ClientIDMode="AutoID"  /> 
                <asp:Button ID="btnSubmit" runat="server" Text="Show My Friends" OnClick="lbllogout_Click" /><br />
                <a name="fb_share" type="button" href="http://www.facebook.com/sharer.php">Share</a>--%>

                <br />
                <iframe src="//www.facebook.com/plugins/likebox.php?href=https%3A%2F%2Fwww.facebook.com%2FALAMRAA&amp;width=940&amp;height=290&amp;colorscheme=light&amp;show_faces=true&amp;header=true&amp;stream=false&amp;show_border=true&amp;appId=508197835942931" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:940px; height:290px;" allowTransparency="true"></iframe>
                <br />
                <div class="fb-share-button" data-href="http://facebook.com/alamraa" data-type="button_count" ></div>
                <br />
            </div>
            <div style="float:left;clear:both">
                <telerik:RadListView runat="server" ID="RadListView1" AllowPaging="true" PageSize="15"  OverrideDataSourceControlSorting="true">          
                <ItemTemplate>
                    <div style="float: left; margin: 5px; padding: 2px; position: relative; background: #eeeeee;"
                    class="myClass" onmouseover="containerMouseover(this)" onmouseout="containerMouseout(this)">
                    <telerik:RadBinaryImage Style="cursor: pointer; display: block;" runat="server" ID="RadBinaryImage1"
                        ImageUrl='<%#Eval("image") %>' Height="45px" Width="45px"
                        ResizeMode="Fit" 
                        ToolTip='<%#Bind("name") %>'/>
                    <div style="margin-top: -30px; position: absolute; display: none; width:30px;">
                        <asp:TextBox runat="server" ID="TextBox1" Text='<%#Bind("name") %>' CssClass="txt"
                             AutoPostBack="true" ToolTip='<%#Bind("name") %>' />
                    </div>
                </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <div style="float: left; margin: 5px; padding: 2px; position: relative; background: #eeeeee;"
                    class="myClass" >
                    <telerik:RadBinaryImage Style="cursor: pointer; display: block;" runat="server" ID="RadBinaryImage1"
                         Height="45px" Width="45px" ImageUrl='<%#Eval("image") %>'
                        ResizeMode="Fit" 
                        ToolTip='<%#Bind("name") %>' />
                    <div style="margin-top: -30px; position: absolute; display: none; width:30px;">
                        <asp:TextBox runat="server" ID="TextBox1" Text='<%#Bind("name") %>' CssClass="txt"
                             AutoPostBack="true" ToolTip='<%#Bind("name") %>' />
                    </div>
                </div>
                </AlternatingItemTemplate>
        </telerik:RadListView>
            </div>

        </asp:Panel>    
    </div>
    <div id="fb-root"></div>
<script>(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=508197835942931";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

     


    <script type="text/javascript">

        //function openWin() {
        //    var oWnd = radopen("subscribe.aspx", "RadWindow1");
        //}
       


        //$(document).ready(function () {
        //    $("#featured > ul").tabs({ fx: { opacity: "toggle" } }).tabs("rotate", 5000, true);
        //});

        
var flashvars = {};
        flashvars.xml = "config.xml";
        flashvars.font = "font.swf";
        var attributes = {};
        attributes.wmode = "transparent";
        attributes.id = "slider";
        swfobject.embedSWF("cu3er.swf", "cu3er-container", "960", "270", "9", "expressInstall.swf", flashvars, attributes);

    </script>
</asp:Content>