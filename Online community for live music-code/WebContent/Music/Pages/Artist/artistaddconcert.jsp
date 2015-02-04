<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="dao.Musicdao"%>
<%@page import="model.User"%>
<%@page import="model.Artist"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>RASA</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/Music/js/style1.css" media="all" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.21/themes/redmond/jquery-ui.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/Music/js/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/Music/js/jquery.ptTimeSelect.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.ptTimeSelect.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
  
  <link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
    <link rel="stylesheet" href="jquery-ui.theme.css">
    <script>
  $(function() {
    $( "#datepicker" ).datepicker();
  });
  </script>

<!-- Waterwheel Carousel -->
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.waterwheelCarousel.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.waterwheelCarousel.setup.js"></script>
<!-- / Waterwheel Carousel -->
</head>
<body id="top" >
<div class="wrapper col1">
  <div id="header">
    <div class="fl_left">
      <h1><a href="index.html">RASA</a></h1>
      <p>The Essence of Music</p>
    </div>
    <div class="fl_right"><a href="#"><img src="<%=request.getContextPath() %>/Music/images/logo.jpg" alt="" /></a></div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
 <%
 
 Artist artist = (Artist)request.getSession().getAttribute("artistnewdetails");
String aid= artist.getArtist_id();
    
    %>

<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
           <ul>
        <li class="active"><a href="<%=request.getContextPath()%>/Music/Pages/artisthome.jsp">HOME</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/Artist/editartistdetails.jsp">EDIT DETAILS</a>
        <!--  <ul>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/edituserdetails.jsp">EDIT DETAILS</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/userlikesmusic.jsp">MUSIC PREFERENCES</a></li>
        
        </ul>
       	-->
       	</li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/Artist/artistplan.jsp">CONCERTS</a>
        <!--  
        <ul>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/userfollow.jsp">PEOPLE YOU FOLLOW </a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/followuser.jsp">PEOPLE WHO FOLLOW YOU </a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/finduser.jsp">SEARCH FOR PEOPLE</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/urecommendation.jsp">RECOMMENDATIONS</a></li>
        </ul>
        -->
        </li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/Artist/artistaddconcert.jsp">POST NEWCONCERT</a>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/Artist/fans.jsp">FANS</a>
          <!--  <ul>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/findartist.jsp">ARTISTS THAT YOU LIKE</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/searchartist.jsp">SEARCH ARTISTS</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/arecommendation.jsp">RECOMMENDED ARTISTS</a></li>
          </ul>
          -->
        </li>
        <li class="last"><a href="<%=request.getContextPath()%>/MusicControl?action=alogout&alogoutid=<%=artist.getArtist_id() %>">LOGOUT</a></li>
      </ul>
    </div> 
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">

  <div id="waterwheelCarousel">
    <img src="<%=request.getContextPath() %>/Music/images/6.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/1.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/2.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/3.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/4.jpg" alt="" />
    <img src="<%=request.getContextPath() %>/Music/images/5.jpg" alt="" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col4">
  <div id="container">
  <div  class="form">
    		<form id="artistaddform" action="<%=request.getContextPath() %>/MusicControl"> 
    			<p class="contact"><label for="name">Concert ID</label></p> 
    			<input id="name" name="concerttid" placeholder="Concert ID"  tabindex="1" type="text"> 
    			
    	 
    			<p class="contact"><label for="name">Ticket Range</label></p> 
    			<input id="name" name="tprice" type="number" placeholder="Ticket range in numbers"  > 
                
                <p class="contact"><label for="name">Ticket Availability</label></p> 
    			<input id="name" name="tavail" placeholder="How many tickets shall be sold?"  tabindex="2" type="text"> 
    			 
                <p class="contact"><label for="name">Ticket booking link</label></p> 
    			<input type="name" id="name" name="booklink" > 
              
             

            <br>
            <label>Start Time:</label><br/><br>
            <input name="s1Time2" id="raghav" value="" /> <br/>
      
         
              <script type="text/javascript">
        $(document).ready(function(){
            // find the input fields and apply the time select to them.
            $('#raghav').ptTimeSelect();
           
        });
    </script>
            <p>Date: <input type="text" id="datepicker" name="datec"></p>
                             <label>Venue of Concert</label>
                  
                  <label class="month"> 
                    <select class="select-style" name="VenueName">

                  <option value="">Venue</option>
                  
    <%
  Connection connect = DBConnection.createConnection();
  PreparedStatement ps = connect.prepareStatement("select v_name,v_city from venue");
  ResultSet rs = ps.executeQuery();

 while(rs.next())
 {
 

%>
                

                  <option value="<%=rs.getString("v_name")+","+rs.getString("v_city") %>"> <%=rs.getString("v_name")+","+rs.getString("v_city") %> </option>
 <%
}
%>

                  </label>

                 </select>    

            
           
            <input class="buttom" name="submit" id="submit" tabindex="5" value="Add new Concert" type="submit"> 
            <input type="hidden" name="action" value="artistaddnewconcert"></input>
            <input type="hidden" name="newconcertaddaid" value=<%=aid %>></input>
            	 
   </form> 
</div>
  
  
  

 
</div>   
          
    </div>
    <br class="clear" />
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="footer">
    <!-- <div class="footbox twitter"> -->
    <div class="footbox flickr">
      <h2>Follow US</h2>
  <ul>
     <li>   <a href="https://www.reddit.com"><img src="<%=request.getContextPath() %>/Music/images/reddit.png" alt=""></img></a></li>
       <li> <a href="https://www.flickr.com"><img src="<%=request.getContextPath() %>/Music/images/Flickr.png" alt=""></img></a></li>
        <li><a href="https://www.twitter.com"><img src="<%=request.getContextPath() %>/Music/images/twitter.png" alt=""></img></a></li>
      	<li><a href="https://www.facebook.com"><img src="<%=request.getContextPath() %>/Music/images/fb.png" alt=""></img></a></li>
    	<li><a href="https://www.rss.com"><img src="<%=request.getContextPath() %>/Music/images/rss.png" alt=""></img></a></li>
      </ul> 
</div>

    <div class="footbox flickr">
      <h2>About Us</h2>
      <ul>
        <li><a href="#"> Who we are<img src="<%=request.getContextPath() %>/Music/images/weare.jpg" alt="" /></a></li>
        <li><a href="#">Team<img src="<%=request.getContextPath() %>/Music/images/team.jpg" alt="" /></a></li>
        <li><a href="#">Blog<img src="<%=request.getContextPath() %>/Music/images/blog.png" alt="" /></a></li>
        <li><a href="#">Jobs<img src="<%=request.getContextPath() %>/Music/images/jobs.jpg" alt="" /></a></li>
      </ul>
      <br class="clear" />
    </div>
    <div class="footbox posts">
      <h2>Join In</h2>
      <ul>
        <li><a href="#">Contact Us</a></li>
        <li><a href="#">Help</a></li>
        <li><a href="#">Forums</a></li>
        <li><a href="#">Promotions</a></li>
      </ul>
    </div>
    <div class="footbox banners last">
      <h2>Partners</h2>
      <ul>
        <li><a href="https://www.spotify.com"><img src="<%=request.getContextPath() %>/Music/images/spotify.png" alt="" /></a></li>
        <li><a href="https://www.soundcloud.com"><img src="<%=request.getContextPath() %>/Music/images/soundcloud.jpg" alt="" /></a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - <a href="#">RASA Music</a></p>
       <br class="clear" />
  </div>
</div>
</body>
</html>