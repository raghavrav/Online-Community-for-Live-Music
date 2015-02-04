<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.*"%>
<%@page import="dao.Musicdao"%>
<%@page import="model.User"%>
<%@page import="model.Artist"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/Music/js/accordion.css" type="text/css" >
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
<script>
function checkPass()
{
    //Store the password field objects into variables ...
    var pass1 = document.getElementById('pass1');
    var pass2 = document.getElementById('pass2');
    //Store the Confimation Message Object ...
    var message = document.getElementById('confirmMessage');
    //Set the colors we will be using ...
    var goodColor = "#66cc66";
    var badColor = "#ff6666";
    //Compare the values in the password field
    //and the confirmation field
    if(pass1.value == pass2.value){
        //The passwords match.
        //Set the color to the good color and inform
        //the user that they have entered the correct password
        pass2.style.backgroundColor = goodColor;
        message.style.color = goodColor;
        message.innerHTML = "Passwords Match!"
    }else{
        //The passwords do not match.
        //Set the color to the bad color and
        //notify the user.
        pass2.style.backgroundColor = badColor;
        message.style.color = badColor;
        message.innerHTML = "Passwords Do Not Match!"
    }
}  
</script>

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
  <div id="accordion">
  <h2><center>EDIT ARTIST DETAILS</center></h2>
  <ul>
   
    <li>
      <a href="#two">Edit Name</a>
      <div id="two" class="accordion">
<form id="editname" name="editnameform" method="post" action="<%=request.getContextPath() %>/MusicControl" >
	Please enter your new name:<input type="text" name="editname" placeholder="New Name">
	<input type="submit" value="Confirm" name="submit">
	<input type="hidden" name="action" value="editartistname"></input>
		<input type="hidden" name="artid" value="<%=artist.getArtist_id()%>"></input>
	
</form>
      </div>
    </li>    
    <li>
      <a href="#three">Edit Profile</a>
      <div id="three" class="accordion">
<form id="editprofile" name="editprofileform" method="post" action="<%=request.getContextPath() %>/MusicControl" >
	Please enter your new Profile details:<textarea name="profiledet" placeholder="<%=artist.getProfile()%>"></textarea>
	<input type="submit" value="Confirm" name="submit">
	<input type="hidden" name="action" value="editprofile"></input>
		<input type="hidden" name="artid" value="<%=artist.getArtist_id()%>"></input>
		
	
</form>
      </div>
    </li>
    <li>
      <a href="#four">Edit your details link</a>
      <div id="four" class="accordion">
     	<form id="editdlink" name="editdetform" method="post" action="<%=request.getContextPath() %>/MusicControl" >
	Please enter your new details link:<input type="text" name="editdetlink" placeholder="New link">
	<input type="submit" value="Confirm" name="submit">
	<input type="hidden" name="action" value="editdetaillink"></input>
		<input type="hidden" name="artid" value="<%=artist.getArtist_id()%>"></input>
</form>
      </div>
    </li>
    <li>
      <a href="#five">Change Password</a>
      <div id="five" class="accordion">
	<div class="tutorialWrapper">
      	<form id="changepass" name="changepassform" method="post" action="<%=request.getContextPath() %>/MusicControl" >
        <div class="fieldWrapper">
            <label for="pass1">Enter Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <input name="pass1" id="pass1" type="password">
        </div>
        <div class="fieldWrapper">
            <label for="pass2">Confirm Password:</label>
            <input name="pass2" id="pass2" onkeyup="checkPass(); return false;" type="password">
            <span id="confirmMessage" class="confirmMessage"></span>
        </div>
        <input type="submit" value="Confirm" name="submit">
	<input type="hidden" name="action" value="changepassaction"></input>
		<input type="hidden" name="artid" value="<%=artist.getArtist_id()%>"></input>
    </form>
</div>
      </div>
    </li>
  </ul>
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