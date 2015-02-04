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
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css" rel="stylesheet">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <link href="../css/star-rating.css" media="all" rel="stylesheet" type="text/css"/>
    <script src="../js/star-rating.js" type="text/javascript"></script>
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
 String concertid = (String)request.getSession().getAttribute("reviewconcertid");
 Connection connect = DBConnection.createConnection();
 PreparedStatement ps = connect.prepareStatement("select * from concert where concert_id=?;");
 ps.setString(1, concertid);
 ResultSet rs = ps.executeQuery();
 rs.next();

    User user1 = (User)request.getSession().getAttribute("userdetails");
 
    Connection connect2 = DBConnection.createConnection();
    PreparedStatement ps2 = connect.prepareStatement("select avg(rating) as avgrate from user_attendsorPlans where concert_id=? ");
   ps2.setString(1, concertid);
    ResultSet rs2 = ps2.executeQuery();
    rs2.next();
String uid= user1.getUid();
System.out.print("Inside the jsp"+uid);
    
    %>

<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li class="active"><a href="<%=request.getContextPath()%>/Music/Pages/User/userhome.jsp">HOME</a></li>
        <li><a href="#">ACCOUNT DETAILS</a>
        <ul>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/edituserdetails.jsp">EDIT DETAILS</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/userlikesmusic.jsp">MUSIC PREFERENCES</a></li>
        
        </ul>
       	</li>
        <li><a href="#">PEOPLE</a>
        <ul>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/userfollow.jsp">PEOPLE YOU FOLLOW </a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/followuser.jsp">PEOPLE WHO FOLLOW YOU </a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/finduser.jsp">SEARCH FOR PEOPLE</a></li>
        <li><a href="<%=request.getContextPath()%>/Music/Pages/User/urecommendation.jsp">RECOMMENDATIONS</a></li>
        </ul>
        </li>
        <li><a href="#">ARTISTS</a>
          <ul>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/findartist.jsp">ARTISTS THAT YOU LIKE</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/searchartist.jsp">SEARCH ARTISTS</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/arecommendation.jsp">RECOMMENDED ARTISTS</a></li>
          </ul>
        </li>
        <li><a href="#">CONCERT</a>
          <ul>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/yourplan.jsp">YOUR PLAN</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/searchconcert.jsp">SEARCH CONCERTS</a></li>
            <li><a href="<%=request.getContextPath() %>/Music/Pages/User/Recommendationlist.jsp">CONCERT PLAYLIST</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/listconcerts.jsp">RATE CONCERTS</a></li>
            <li><a href="<%=request.getContextPath()%>/Music/Pages/User/reviewlistconcerts.jsp">REVIEW CONCERTS</a></li>
            <li><a href="<%=request.getContextPath()%>/MusicControl?action=addaconcert&uid=<%=user1.getUid()%>">ADD A NEW CONCERT</a></li>
          </ul>
        </li>
        <li class="last"><a href="<%=request.getContextPath()%>/MusicControl?action=logout&logoutid=<%=user1.getUid() %>">LOGOUT</a></li>
      </ul>
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
  <center><h2>CONCERT DETAILS</h2>
  
  <ul>
  <li>CONCERT ID : <%=rs.getString("concert_id")%> </li>
  <li>ARTIST ID : <%=rs.getString("artist_id") %></li>
  <li>CONCERT TIME : <%= rs.getString("concert_time") %></li>
  <li>VENUE : <%= rs.getString("venue_name")+","+rs.getString("venue_city") %></li>
  <li>TICKET PRICE : <%= rs.getString("TicketRange") %></li>
  <li>AVAILABILITY : <%= rs.getString("availablity") %></li>
  <li>LINK : <%= rs.getString("ticket_book_link") %></li>
  <li>AVERAGE RATING : <input id="input-21d" value="<%=rs2.getInt("avgrate") %>" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm" readonly></li>
  </ul>
  </center>
  <%
  rs.close();
  connect.close();
  ps.close();
  Connection connect1 = DBConnection.createConnection();
  PreparedStatement ps1 = connect1.prepareStatement("select * from user_attendsorplans where concert_id=?;");
  ps1.setString(1, concertid);
  ResultSet rs1 = ps1.executeQuery(); 

  %>
<div id="comments">
        <h2>Review</h2>
        <ul class="commentlist">
        <%while(rs1.next()){ %>
          <li class="comment_odd">
            <div class="author"><img class="avatar" src="../images/demo/avatar.gif" width="32" height="32" alt="" /><span class="name"><a href="#"><%=rs1.getString("user_id") %></a></span> <span class="wrote">wrote:</span></div>
            <div class="submitdate"><a href="#"><%=rs1.getString("rating_time") %></a></div>
      
            <input id="input-21d" value="<%=rs1.getInt("rating") %>" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm" readonly>
            <p><%=rs1.getString("rating_details") %></p>
            
          </li>
          <%}%>
        </ul>
      </div>
      <form name="searchuserform" method="post" action="<%=request.getContextPath() %>/MusicControl">
            <input name="submit" type="submit" id="submit" value="Post a new Review" />
            &nbsp;
            <input type="hidden" name='action' value='addReview'></input>
            <input type= "hidden" name= "concertreviewid" value = <%=concertid %>></input>
            <input type= "hidden" name= "uid" value = <%= user1.getUid() %>></input>
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