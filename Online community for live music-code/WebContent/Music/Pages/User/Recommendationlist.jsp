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
<meta http-equiv="content-type" content="text/html; charset=iso-8859-1">
<meta name="generator" content="HAPedit 3.1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/Music/js/_styles.css" media="screen">
<link rel="stylesheet" href="<%=request.getContextPath() %>/Music/js/layout.css" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.min.js"></script>
<!-- Waterwheel Carousel -->
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.waterwheelCarousel.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/Music/js/jquery.waterwheelCarousel.setup.js"></script>
<!-- / Waterwheel Carousel -->
</head>
<%
User user1 = (User)request.getSession().getAttribute("userdetails");

String uid= user1.getUid();
%>
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
<div id="wrapper">
<div id="content">
<br><br>

<h3><b>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
Add new List Here:</b></h3>
<form id="reccomendationaddform" method="post" name="reccomform"  action="<%=request.getContextPath() %>/MusicControl">
<br><br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
Enter Recommendation Name:<input type ="text" id="Recommendationlistname" name="listname" placeholder="Enter new name">
<br><br>
<input type="hidden"  value="reccaddnew" name="action">
<input type="hidden" value=<%=uid %> name="recommenduid"></input>
     <label class="Concert List"> 
     
          &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Add Concert: <select name="ConcertList">

                  <option value="">Concerts</option>
                  
    <%
  Connection connect = DBConnection.createConnection();
  PreparedStatement ps = connect.prepareStatement("select * from concert");
  ResultSet rs = ps.executeQuery();

 while(rs.next())
 {
 

%>
<option value="<%=rs.getString("concert_id") %>"> <%=rs.getString("concert_id")+","+rs.getString("artist_id")+" "+rs.getString("concert_time") %> </option>
 <%
}
%>

                  </label>

                 </select>    
<br><br>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp
<input type="submit" value="Submit">
</form>
</div>
</div>
<br></br>
<br></br>



<div id="wrapper">
<div id="content">
<br><br>
<h3><b>
&nbsp&nbsp Add to Existing Recommendation Here:
</b></h3>
&nbsp&nbsp Have a list already,add more concert to it.
<br><br>
<form id="reccomendationexistform" method="post" name="reccomexistform"  action="<%=request.getContextPath() %>/MusicControl">
<input type="hidden"  value="recaddexist" name="action">
<input type="hidden" value=<%=uid %> name="recommenduid"></input>
 
 <label class=" ReccoList"> 
 &nbsp&nbsp Your Recommendations: <select name="recclists">
 <option value="">Select your list to add</option>
     <%
  PreparedStatement ps1 = connect.prepareStatement("select distinct (list_name) from user_recommends where user_id=?");
  ps1.setString(1, uid);
     ResultSet rs1 = ps1.executeQuery();
 while(rs1.next())
 {
%>
<option value="<%=rs1.getString("list_name") %> "><%=rs1.getString("list_name") %> </option>
 <%
}
%>
<% if(rs1 == null)
{
	%>
	<option value="None"> -None- </option>	
<%
}

%>

   </label>
               </select>    
<br><br>
 <label class=" ConcertListexistingrecco"> 

 Add concerts: <select name="concertsoldlist">
<option value="">Select a concert you recommend</option>
     <%
  PreparedStatement ps2 = connect.prepareStatement("select * from concert");
  ResultSet rs2 = ps2.executeQuery();
 while(rs2.next())
 {
%>
<option value="<%=rs2.getString("concert_id") %>"> <%=rs2.getString("concert_id")+","+rs2.getString("artist_id")+" "+rs2.getString("concert_time") %> </option>
<%
 } 
%>
<label class=" ReccoList"></label>
</label>
<input type="submit"  value="Submit List"></input>
</form>
<br>
</br>
<br></br>
</div>
</div>


<div id="content">
<h3>Your <b>Recommendations</b>
</h3>		

<br>

	<ol class="tree">
     
			 <%
    
  PreparedStatement ps3 = connect.prepareStatement("select distinct list_name,concert_id from user_recommends where user_id=? order by list_name");
 ps3.setString(1, uid);
ResultSet rs3 = ps3.executeQuery();
  String a=null;
  int i=1;

 while(rs3.next())
 {
	  
     if(i==1)
     {
    a=rs3.getString("list_name");
    System.out.println("First list "+a);
%>

		<li>
			<label for="<%=rs3.getString("list_name") %>"><%=rs3.getString("list_name") %></label> <input type="checkbox" id="folder2" /> 
			<ol>
			<%} %>
			<%
			 if(!(a.equals(rs3.getString("list_name"))))
			{
			    a=rs3.getString("list_name");
			    System.out.println("Subsequent list "+a);
			%>
			</ol>
			</li>
			<li>
			<label for="<%=rs3.getString("list_name") %>"><%=rs3.getString("list_name") %></label> <input type="checkbox" id="folder2" /> 
			<ol>
			<%  } %>
				<li class="file"><%=rs3.getString("concert_id") %></li>
				<li class="file"></li>
       <%   System.out.println("Elements "+rs3.getString("concert_id")); %>
                 
			
		<%i++;
		} %>

    
		

	</ol>
	
</div>
	</ol>
	</br>

	
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