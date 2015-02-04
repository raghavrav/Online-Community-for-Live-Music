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
<link rel="stylesheet" href="<%=request.getContextPath() %>/Music/js/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.min.js"></script>
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

 <h2>
 <center>YOUR FANS</center></h2>
      <table summary="Summary Here" cellpadding="0" cellspacing="0">
        <thead>
          <tr>
            <th>USER ID</th>
		<th>USER NAME</th>
		<th>CITY</th>
		<th>PROFILE</th>
          </tr>
        </thead>
        <tbody>
          <form name="searchuserform" method="post" action="<%=request.getContextPath() %>/MusicControl" >
	   <%
	   Connection connect = DBConnection.createConnection();
	   PreparedStatement ps = connect.prepareStatement("select * from user natural join fan_of where artist_id = ?");
	  ps.setString(1, aid);
	   ResultSet rs = ps.executeQuery();

	  while(rs.next())
	  {
%>
          <tr class="light">
		
		<td><%=rs.getString("user_id") %></td>
		<td><%=rs.getString("user_name") %></td>
		<td><%= rs.getString("city") %></td>
		<td><%= rs.getString("profile_details") %></td>
		
</tr>
      
	<%
	 }
	%>
</tbody>
      </table>
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