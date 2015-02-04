<!doctype html>
<%@page import="java.util.*"%>
<%@page import="dao.Musicdao"%>
<%@page import="model.User"%>
<%@page import="java.sql.*"%>
<%@page import="dao.DBConnection"%>
<html lang="en">

<head>
<meta charset="utf-8">

<title>News</title>

<base target="_blank">

<style type="text/css">
<!--

body	{
	background-color: #FFFFFF;
	margin: 0;
	padding: 0;
	border: 0;
	}

 /* FONT COLORS */

div		{ color: #000000; font: 11px arial, sans-serif; font-weight: normal; }

.title		{ color: #0033FF; font: 12px arial, sans-serif; font-weight: bold; }

#NewsDiv	{ position: absolute; left: 0; top: 0; width: auto; }

 /* PAGE LINK COLORS */

a:link		{ color: #0033FF; text-decoration: underline; }

a:visited	{ color: #6633FF; text-decoration: underline; }

a:active	{ color: #0033FF; text-decoration: underline; }

a:hover		{ color: #6699FF; text-decoration: none; }

-->
</style>


<script type="text/javascript">
<!-- HIDE CODE JAVASCRIPT NEWS SCROLLER ver 2.0 2013
var scrollspeed = 1;		// SET SCROLLER SPEED 1 = SLOWEST
var speedjump   = 30;		// ADJUST SCROLL JUMPING = RANGE 20 TO 40
var startdelay  = 2; 		// START SCROLLING DELAY IN SECONDS
var nextdelay   = 0; 		// SECOND SCROLL DELAY IN SECONDS 0 = QUICKEST
var topspace    = 0;		// TOP SPACING FIRST TIME SCROLLING
var frameheight = 204;		// IF YOU RESIZE THE WINDOW EDIT THIS HEIGHT TO MATCH
current = (scrollspeed);
function HeightData() {
    AreaHeight = dataobj.offsetHeight;
    if (AreaHeight === 0) {
        setTimeout("HeightData()", (startdelay * 1000));
    } else {
        ScrollNewsDiv();
    }
}
function NewsScrollStart() {
    dataobj = document.all ? document.all.NewsDiv : document.getElementById("NewsDiv");
    dataobj.style.top = topspace + 'px';
    setTimeout("HeightData()", (startdelay * 1000));
}
function ScrollNewsDiv() {
    dataobj.style.top = parseInt(dataobj.style.top) - scrollspeed + 'px';
    if (parseInt(dataobj.style.top) < AreaHeight * (-1)) {
        dataobj.style.top = frameheight + 'px';
        setTimeout("ScrollNewsDiv()", (nextdelay * 1000));
    } else {
        setTimeout("ScrollNewsDiv()", speedjump);
    }
}
// END HIDE CODE -->
</script>
</head>
<body onMouseover="scrollspeed=0" onMouseout="scrollspeed=current" OnLoad="NewsScrollStart();">
<div id="NewsDiv" style="text-align: left; padding: 5px;">
<%
User user = (User)request.getSession().getAttribute("userdetails");
Connection connect3 = DBConnection.createConnection();
PreparedStatement ps3 = connect3.prepareStatement("select * from user_follows where follow_id=?");
ps3.setString(1, user.getUid());
ResultSet rs3=ps3.executeQuery();
%>
<!-- SCROLLER CONTENT STARTS HERE -->
<span class="title">
User Follows<br>
<%
while(rs3.next())
{
%>
</span>
<%=rs3.getString("user_id")+"is followed by"+rs3.getString("follow_id") %>

<br><br><br>
<%
}
%>
<span class="title">
User Fan Of<br>
<%
User user1 = (User)request.getSession().getAttribute("userdetails");
Connection connect1 = DBConnection.createConnection();
PreparedStatement ps1 = connect1.prepareStatement("select * from fan_of where user_id=?");
ps1.setString(1, user.getUid());
ResultSet rs1=ps1.executeQuery();
while(rs1.next())
{
%>
</span>
<%=rs1.getString("user_id")+"is fan of"+rs1.getString("artist_id") %>

<br><br><br>
<%} %>

</span>
To have the scroller reload at the top for the second time through, change the "frameheight" to "2" and change the "nextdelay" to "1" or "2".
<br><br><br>
<!-- SCROLLER CONTENT ENDS HERE -->







</div>

</body>
</html>
