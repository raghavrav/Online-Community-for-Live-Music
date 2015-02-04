package controller;
import dao.DBConnection;

import java.sql.*;
import java.util.*;
import java.io.*;

import dao.Musicdao;
import model.User;
import model.Artist;

import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.*;

/*
 * Servlet implementation class MusicController
 */
@WebServlet("/MusicControl")
@MultipartConfig(maxFileSize=16177215)
public class MusicControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MusicControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
		try{
			
			String redirect = request.getParameter("redirect");
			String redirect1 = request.getParameter("redirect1");
			String aredirect = request.getParameter("aredirect");
			String concertid = request.getParameter("concertid");
			String reviewconcertid = request.getParameter("reviewconcertid");
			String concertfind = request.getParameter("concertfind");
			System.out.println("Redirect"+redirect);
			
			
		String action = request.getParameter("action");
		System.out.println(action);
		System.out.println("this is printed"+action);
		if(aredirect!=null)
		{
			System.out.println("Inside this control");
			HttpSession session = request.getSession();
			session.setAttribute("aredirection", aredirect);
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/fartistprofile.jsp");
			
		}
		if(concertid!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("concertrev", concertid);
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/concertreview.jsp");
		}
		if(redirect!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("redirection", redirect);
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/userprofile.jsp");
			
		}
		if(redirect1!=null)
		{
			System.out.println(redirect1+"Inside the cinrol");
			HttpSession session = request.getSession();
			session.setAttribute("redirection1", redirect1);
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/fuserprofile.jsp");
		}
		if(reviewconcertid!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("reviewconcertid", reviewconcertid);
			response.sendRedirect(request.getContextPath()
					+"/bootstrap-star-rating-master/examples/reviewconcert.jsp");
			
		}
		if(concertfind!=null)
		{
			HttpSession session = request.getSession();
			session.setAttribute("fconcert", concertfind);
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/attendconcert.jsp");
			
		}
		if(action.equalsIgnoreCase("musiclike"))
	      {String uid = request.getParameter("userlikesid");
	    	  String category[]=new String[20];
	    	  category= request.getParameterValues("music");
	    	  Musicdao dao = new Musicdao();
	    	  for(int i=0;i<category.length;i++)
	    	  {
	    		  System.out.println(category[i]);
	    	  }
	    	  int k= category.length;
	      	for(int i=0;i<k;i++)
	      	{
	          	int l=0;
	      	  String[] catsplit = new String[2]; 
	      	 String a= category[i];
	   	 for (String catval: a.split("-", 2)){
	  		  catsplit[l]=catval;
	  		  System.out.println(catsplit[l]);
	  		  l++;
			

	   	 }
	   dao.user_likemusic(catsplit[0], catsplit[1],uid);
	      	}
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userlikesmusic.jsp"); 
	     }
	      if(action.equalsIgnoreCase("musicunlike"))
	      {String uid = request.getParameter("userlikesid");
	    	  String category[]=new String[20];
	    	  category= request.getParameterValues("music");
	    	  Musicdao dao = new Musicdao();
	    	  for(int i=0;i<category.length;i++)
	    	  {
	    		  System.out.println(category[i]);
	    	  }
	    	  int k= category.length;
	      	for(int i=0;i<k;i++)
	      	{
	          	int l=0;
	      	  String[] catsplit = new String[2]; 
	      	 String a= category[i];
	   	 for (String catval: a.split("-", 2)){
	  		  catsplit[l]=catval;
	  		  System.out.println(catsplit[l]);
	  		  l++;
			

	   	 }
	     dao.user_unlikemusic(catsplit[0], catsplit[1],uid);

	      	}
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userlikesmusic.jsp"); 
	     }
		
		
		
		
		if(action.equalsIgnoreCase("logout"))
		{
			String logoutid = request.getParameter("logoutid");
			Connection connect = DBConnection.createConnection();
			PreparedStatement ps = connect.prepareStatement("update user set last_access_time=now() where user_id = ? ");
			ps.setString(1,logoutid );
			ps.executeUpdate();	
		HttpSession session = request.getSession();
		session.removeAttribute("userdetails");
		session.invalidate();
			request.getSession().invalidate();
			response.setHeader("Pragma","no-cache");  
			response.setHeader("Cache-Control","no-store");  
			response.setHeader("Expires","0");  
			response.setDateHeader("Expires",-1);
			response.sendRedirect(request.getContextPath()
					+"/Main.jsp");
			
		}
		if(action.equalsIgnoreCase("alogout"))
		{HttpSession session = request.getSession();
		session.removeAttribute("artistnewdetails");
		session.invalidate();
		request.getSession().invalidate();
		response.setHeader("Pragma","no-cache");  
		response.setHeader("Cache-Control","no-store");  
		response.setHeader("Expires","0");  
		response.setDateHeader("Expires",-1);
		response.sendRedirect(request.getContextPath()
				+"/Main.jsp");
		
		}
		if(action.equalsIgnoreCase("uploadpic"))
		{
			
			String uploadid = request.getParameter("uploadpicid");
			try
			{
			String ImageFile="";
			String itemName = "";
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart)
			{
			}
			else
			{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;
			try
			{
			items = upload.parseRequest(request);
			}
			catch (FileUploadException e)
			{
			e.getMessage();
			}
			 
			Iterator itr = items.iterator();
			while (itr.hasNext())
			{
			FileItem item = (FileItem) itr.next();
			if (item.isFormField())
			{
			String name = item.getFieldName();
			String value = item.getString();
			if(name.equals("ImageFile"))
			{
			ImageFile=value;
			}
			 
			}
			else
			{
			try
			{
			itemName = item.getName();
			File savedFile = new File("E:/Projectdb/Concert_Test/WebContent/Music/profilepic/"+uploadid+itemName);
			item.write(savedFile);
			}
			catch (Exception e)
			{
			System.out.println("Error"+e.getMessage());
			}
			}
			}
			try
			{
				System.out.println("Inside this this");
				System.out.println(uploadid);
				System.out.println(itemName);
				Connection connect1 =DBConnection.createConnection();
				PreparedStatement preparedStatement = connect1.prepareStatement("update user set image = ? where user_id = ? ");
				String urlimage = (uploadid+itemName);
				preparedStatement.setString(1,urlimage );
				preparedStatement.setString(2,uploadid);
				preparedStatement.executeUpdate(); 
			//st.executeUpdate("insert into test(image) values ('"+itemName+"')");
			 
			}
			catch(Exception el)
			{
			System.out.println("Inserting error"+el.getMessage());
			}
			}
			}
			catch (Exception e){
			System.out.println(e.getMessage());
			}
			
			response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp");
			
		}
		if(action.equalsIgnoreCase("artistaddnewconcert"))
		{
		
				 System.out.println("Inside adding concert");
		    	  String cid = request.getParameter("concerttid");
		    	  String aid = request.getParameter("newconcertaddaid");
		    	  System.out.println("Artist id +aid");
		    	  //String uid = request.getParameter("newconcertadduid");
		    	  System.out.println("New concert id "+cid);
		    	  String price = request.getParameter("tprice");
		      	Integer cprice = Integer.parseInt(price);

		    	  System.out.println("price "+cprice);
		    	  String tavail = request.getParameter("tavail");
		        	Integer cavail = Integer.parseInt(tavail);
		    	  System.out.println("availabilty "+tavail);
		    	  String booklink = request.getParameter("booklink");
		    	  System.out.println("booklink "+booklink);
		    	  String time = request.getParameter("s1Time2");
		    	  System.out.println("time "+time);
		    	  String date = request.getParameter("datec");
		    	  System.out.println("date "+date);
		         String newtime=null;
		         String newdate;
		         String datetime;
		    	  Musicdao dao = new Musicdao();
		    	  //dao.artist_editpass(newpass,aid);
		      	String[] timesplit = new String[8];    
		      	int i=0;
		    	  for (String retval: time.split(" ", 2)){
		    		  timesplit[i]=retval;
		    		  i++;
		    		  
		    	  }
		    	 while(i>=0)
		    	 {
		       	  System.out.println("time "+timesplit[i]);
		       	  i--;

		    	 }
		    

		     	 if(timesplit[1].equals("AM"))
		    	 {
		          	
		           newtime=timesplit[0]+":00";       	
		System.out.println("am "+newtime);
		    	 }
		    	 if(timesplit[1].equals("PM"))
		    	 {
		          	  System.out.println("Its PM");
		          	String[] timesplitpm = new String[7];
		          	int j=0;
		          	 for (String retval: timesplit[0].split(":", 2)){
		       		  timesplitpm[j]=retval;
		       		  j++;
		       		

		    	 }
		          	 while(j>=0)
		        	 {
		           	  System.out.println("time split for pm "+timesplitpm[j]);
		           	  j--;

		        	 } 
		          	 
		             int chour=Integer.valueOf(timesplitpm[0]);
		             if(chour==12)
		             {
		            	 
		             }
		             else
		             {
		             chour=chour+12;
		             }
		        	  
		        	  newtime=chour+":"+ timesplitpm[1] +":"+"00";
		        	  System.out.println("pm "+newtime);

		    	 }
		       	String[] datesplit = new String[8];   
		       	int k=0;
		    	 for (String datval: date.split("/", 3)){
		   		  datesplit[k]=datval;
		   		  k++;
		    	 }
		    	 while(k>=0)
		    	 {
		    		 System.out.println("date split "+datesplit[k]);
		    		 k--;
		    	 }
		    	 newdate=datesplit[2]+"-"+datesplit[0]+"-"+datesplit[1];
		         System.out.println("date after formatting is "+newdate);
		    	 datetime=newdate+" "+newtime;
		         System.out.println("new datetime "+datetime);
		    	 String venuenameandcity = request.getParameter("VenueName");
		         System.out.println("Venue is "+venuenameandcity);
		         String[] venuesplit = new String[8];   
		        	int l=0;
		     	 for (String venval: venuenameandcity.split(",", 2)){
		    		  venuesplit[l]=venval;
		    		  l++;
		     	 }
		     	 
		     	 while(l>=0)
		     	 {
		     		 System.out.println("venue split "+venuesplit[l]);
		     		 l--;
		     	 }
		     	 String venuename=venuesplit[0];
		     	 String venuecity=venuesplit[1];
		     	dao.artist_addconcert(cid,aid, datetime, venuename,venuecity, cprice, cavail, booklink);
			
			System.out.println("All updates done");
			response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artisthome.jsp");
			
				
		}
		if(action.equalsIgnoreCase("addnewconcert"))
		{
			  System.out.println("Inside adding concert");
	    	  String cid = request.getParameter("concerttid");
	    	  String aid = request.getParameter("artistid");
	    	//  String uid = request.getParameter("newconcertadduid");
	    	  System.out.println("New concert id "+cid);
	    	  String price = request.getParameter("tprice");
	      	Integer cprice = Integer.parseInt(price);

	    	  System.out.println("price "+cprice);
	    	  String tavail = request.getParameter("tavail");
	        	Integer cavail = Integer.parseInt(tavail);
	    	  System.out.println("availabilty "+tavail);
	    	  String booklink = request.getParameter("booklink");
	    	  System.out.println("booklink "+booklink);
	    	  String time = request.getParameter("s1Time2");
	    	  System.out.println("time "+time);
	    	  String date = request.getParameter("datec");
	    	  System.out.println("date "+date);
	         String newtime=null;
	         String newdate;
	         String datetime;
	    	  Musicdao dao = new Musicdao();
	    	  //dao.artist_editpass(newpass,aid);
	      	String[] timesplit = new String[8];    
	      	int i=0;
	    	  for (String retval: time.split(" ", 2)){
	    		  timesplit[i]=retval;
	    		  i++;
	    		  
	    	  }
	    	 while(i>=0)
	    	 {
	       	  System.out.println("time "+timesplit[i]);
	       	  i--;

	    	 }
	    

	     	 if(timesplit[1].equals("AM"))
	    	 {
	          	
	           newtime=timesplit[0]+":00";       	
	System.out.println("am "+newtime);
	    	 }
	    	 if(timesplit[1].equals("PM"))
	    	 {
	          	  System.out.println("Its PM");
	          	String[] timesplitpm = new String[7];
	          	int j=0;
	          	 for (String retval: timesplit[0].split(":", 2)){
	       		  timesplitpm[j]=retval;
	       		  j++;
	       		

	    	 }
	          	 while(j>=0)
	        	 {
	           	  System.out.println("time split for pm "+timesplitpm[j]);
	           	  j--;

	        	 } 
	          	 
	             int chour=Integer.valueOf(timesplitpm[0]);
	             if(chour==12)
	             {
	            	 
	             }
	             else
	             {
	             chour=chour+12;
	             }
	        	  
	        	  newtime=chour+":"+ timesplitpm[1] +":"+"00";
	        	  System.out.println("pm "+newtime);

	    	 }
	       	String[] datesplit = new String[8];   
	       	int k=0;
	    	 for (String datval: date.split("/", 3)){
	   		  datesplit[k]=datval;
	   		  k++;
	    	 }
	    	 while(k>=0)
	    	 {
	    		 System.out.println("date split "+datesplit[k]);
	    		 k--;
	    	 }
	    	 newdate=datesplit[2]+"-"+datesplit[0]+"-"+datesplit[1];
	         System.out.println("date after formatting is "+newdate);
	    	 datetime=newdate+" "+newtime;
	         System.out.println("new datetime "+datetime);
	    	 String venuenameandcity = request.getParameter("VenueName");
	         System.out.println("Venue is "+venuenameandcity);
	         String[] venuesplit = new String[8];   
	        	int l=0;
	     	 for (String venval: venuenameandcity.split(",", 2)){
	    		  venuesplit[l]=venval;
	    		  l++;
	     	 }
	     	 
	     	 while(l>=0)
	     	 {
	     		 System.out.println("venue split "+venuesplit[l]);
	     		 l--;
	     	 }
	     	 String venuename=venuesplit[0];
	     	 String venuecity=venuesplit[1];
	         dao.artist_addconcert(cid,aid, datetime, venuename,venuecity, cprice, cavail, booklink);

	    	  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/concertreview.jsp");
	    	  
	    	  
	      }
			
		
		if(action.equalsIgnoreCase("addreviewconcert"))
		{
			try{
				System.out.println("inside bitch");
				 String commentid = request.getParameter("concertreviewid");
				 String uid = request.getParameter("uid");
				 String review = request.getParameter("comment");
				 String rating = request.getParameter("ratedvalue");
				 System.out.println(commentid+uid+review+rating);
			    	Integer i = Integer.parseInt(rating);
			    	
				 Musicdao dao = new Musicdao();
				 dao.insertreview(commentid,uid,review,i);
				 response.sendRedirect(request.getContextPath()
							+"/bootstrap-star-rating-master/examples/reviewconcert.jsp");  
				 
			}
				
		
		catch(Exception e)
		{
			
		}
		}
		if(action.equalsIgnoreCase("usignup"))
		{try{
			System.out.println("inside Signup Page");
			User user=new User();
			String uid = request.getParameter("uid");
			String uname = request.getParameter("username");;
			String year= request.getParameter("BirthYear");
			String month = request.getParameter("BirthMonth"); ; 
			String day = request.getParameter("BirthDay");
			String email = request.getParameter("BirthYear");
			String upass = request.getParameter("password");
			String udetails = request.getParameter("details");
			String city = request.getParameter("city");
			String dob = year+"-" +month+"-"+day;
			System.out.println(uid+" "+uname+" "+email+" "+upass+" "+udetails+" "+city+" "+dob);
			user.setUid(uid);
			user.setUname(uname);
			user.setEmail(email);
			user.setUpass(upass);
			user.setUdetails(udetails);
			user.setCity(city);
			user.setDob(dob);
			
			try
			{
			String ImageFile="";
			String itemName = "";
			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			System.out.println(isMultipart);
			if (!isMultipart)
			{
				System.out.println("NOTHING NOTHIN NOTHING");
			}
			else
			{
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List items = null;	
			items = upload.parseRequest(request);			 
			Iterator itr = items.iterator();
			while (itr.hasNext())
			{
			FileItem item = (FileItem) itr.next();
			if (item.isFormField())
			{
			String name = item.getFieldName();
			String value = item.getString();
			if(name.equals("ImageFile"))
			{
			ImageFile=value;
			}
			}
			else
			{
			try
			{
			itemName = item.getName();
			File savedFile = new File("E:/"+itemName);

			System.out.println("/Users/Raghav/Documents/workspace/"+itemName);
			item.write(savedFile);
			}
			catch (Exception e)
			{
			System.out.println("Error"+e.getMessage());
			}
			}
			}
			try
			{
			//st.executeUpdate("insert into test(image) values ('"+itemName+"')");
			 
			}
			catch(Exception el)
			{
			System.out.println("Inserting error"+el.getMessage());
			}
			}
			}
			catch (Exception e){
			System.out.println(e.getMessage());
			}
			
			
			Musicdao dao=new Musicdao();
			//dao.usersignup(user);
			response.sendRedirect(request.getContextPath()
				+ "/Music/Pages/User/Login.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
		}
		if(action.equalsIgnoreCase("addaconcert"))
		{
			try{
				System.out.println("Inside the addconcert condition");
				String uid = request.getParameter("uid");
				System.out.println(uid);
				Connection connect  = DBConnection.createConnection();
				PreparedStatement preparedStatement = connect.prepareStatement("select * from user where user_id = ?");
				preparedStatement.setString(1, uid);
				ResultSet rs=preparedStatement.executeQuery();
				rs.next();
				if(rs.getInt("trustscore")<5)
				{
					System.out.println("You cannot post a new Concert");
					response.sendRedirect(request.getContextPath()
							+"/Music/Pages/User/successfollow.jsp");
				}
				else
				{
					System.out.println("You can post");
					response.sendRedirect(request.getContextPath()
							+"/Music/Pages/User/userpostconcert.jsp");
				}
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
		}
		if(action.equalsIgnoreCase("editusername"))	
	      {
	    	  String newname = request.getParameter("edituname");
	    	  System.out.println("New name"+newname);
			  Musicdao dao = new Musicdao();
		      String uid = request.getParameter("usid");
		      System.out.println("id "+uid);
		      dao.user_editname(newname,uid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp");  
	      }
	      if(action.equalsIgnoreCase("edituprofile"))
	      {
	    	  String newprof = request.getParameter("uprofiledet");
	    	  System.out.println("New prof"+newprof);
			  Musicdao dao = new Musicdao();
		      String uid = request.getParameter("uid");
		      System.out.println("id "+uid);
		      dao.user_editprofile(newprof,uid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp"); 
	      }
	      if(action.equalsIgnoreCase("edituemail"))
	      {
	    	  String uemail = request.getParameter("newuemail");
	    	  System.out.println("New prof"+uemail);
			  Musicdao dao = new Musicdao();
		      String uid = request.getParameter("usid");
		      System.out.println("id "+uid);
		      dao.user_editemail(uemail,uid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp"); 
	      }
	      if(action.equalsIgnoreCase("changeupassaction"))
		  {
	  String newpass = request.getParameter("pass1");
	  System.out.println("New pass "+newpass);
	  Musicdao dao = new Musicdao();
	  String usid = request.getParameter("usid");
	  System.out.println("id "+usid);
	  dao.user_editpass(newpass,usid);
	  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp"); 
		  }
	      if(action.equalsIgnoreCase("editcity"))
	      {
	    	  String newcity = request.getParameter("newcity");
	    	  System.out.println("New city"+newcity);
			  Musicdao dao = new Musicdao();
		      String uid = request.getParameter("usid");
		      System.out.println("id "+uid);
		      dao.user_editcity(newcity,uid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp"); 
	      }
		if(action.equalsIgnoreCase("ufollowu"))
		{try{
			String uid = request.getParameter("getuid");
			String fuid = request.getParameter("getfuid");
			System.out.println(uid +"follows "+fuid);
			System.out.println("Inside follow condition");
			Connection connect  = DBConnection.createConnection();
			PreparedStatement preparedStatement = connect.prepareStatement("insert into user_follows values (?,?,now());");
			preparedStatement.setString(1, fuid);
			preparedStatement.setString(2, uid);
			int x = preparedStatement.executeUpdate();
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/userfollow.jsp");
		}
		catch(Exception e)
		{response.sendRedirect(request.getContextPath()
				+"/Music/Pages/User/userfollow.jsp");
			System.out.println(e);
			
		}
		}
		if(action.equalsIgnoreCase("attendc"))
		{
			try{
				String cid = request.getParameter("getcuid");
						String uid = request.getParameter("getuid");
						 Musicdao dao = new Musicdao();
						 dao.concertattend(cid, uid);
						 response.sendRedirect(request.getContextPath()
									+"/Music/Pages/User/yourplan.jsp");
						
				
			}
			catch(Exception e)
			{
				
			}
			
		}
		if(action.equalsIgnoreCase("searchconcert")){
			try{
				String str = request.getParameter("concertsearch");
				HttpSession session1 = request.getSession();
				session1.setAttribute("concertsearch", str);
				
				response.sendRedirect(request.getContextPath()
						+"/Music/Pages/User/concertresult.jsp");
				
				
			}
			catch(Exception e)
			{
				
			}
			
		}
		
		if(action.equalsIgnoreCase("artistsignup"))
		{
			System.out.println("inside condition");
		response.sendRedirect(request.getContextPath()
				+ "/Main1.jsp");

		}
		if(action.equalsIgnoreCase("addcomment"))
		{
			String commentid = request.getParameter("concertid");
			 String uid = request.getParameter("uid");
			 String comment = request.getParameter("comment");
			 Musicdao dao = new Musicdao();
			 dao.insertcomment(concertid,uid,comment);
			 response.sendRedirect(request.getContextPath()
						+ "/Music/Pages/User/concertreview.jsp");
			 
		}
		if(action.equalsIgnoreCase("addReview"))
		{
			String uid =  request.getParameter("uid");
			String concertreviewid = request.getParameter("concertreviewid");
			Connection con = DBConnection.createConnection();
			PreparedStatement ps = con.prepareStatement("select * from user_attendsorplans where user_id = ? and concert_id = ?;");
			ps.setString(1, uid);
			ps.setString(2, concertreviewid);
			ResultSet rs = ps.executeQuery();
			if(rs.next())
			{
				HttpSession session = request.getSession();
				session.setAttribute("concertaddreview", concertreviewid);
				response.sendRedirect(request.getContextPath()
						+"/bootstrap-star-rating-master/examples/concertreviewadd.jsp");
				
			}
			else
			{
				response.sendRedirect(request.getContextPath()
						+ "/Music/Pages/User/noreview.jsp");	
			}
		}
		if(action.equalsIgnoreCase("searchuser"))
		{
		try{
			String str=request.getParameter("usersearch");
			System.out.println("inside music search controller");
			
			Musicdao dao=new Musicdao();
			ArrayList<User> userlist = dao.search(str);
			
			HttpSession session = request.getSession();
			session.setAttribute("ulist", userlist);
			response.sendRedirect(request.getContextPath()
					+"/Music/Pages/User/userresult.jsp");
		}
		catch(Exception e)
		{
		System.out.println(e);	
		}
		}
		if(action.equalsIgnoreCase("artistfollows"))
		{
			try{
				String artistid = request.getParameter("artistfan");
				String uid = request.getParameter("uid");
				Musicdao dao = new Musicdao();
				dao.artistfan(artistid,uid);
				response.sendRedirect(request.getContextPath()
				+"/Music/Pages/User/findartist.jsp");		
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
		}
		if(action.equalsIgnoreCase("searchartist"))
		{
			try{
				String str=request.getParameter("artistsearch");
				System.out.println("Inside control"+str);
				Musicdao dao=new Musicdao();
				ArrayList<Artist> artistlist = dao.searchartist(str);
				HttpSession session = request.getSession();
				session.setAttribute("alist", artistlist);
				response.sendRedirect(request.getContextPath()
						+"/Music/Pages/User/artistresult.jsp");
			
				
				
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
			
		}
	
		if(action.equalsIgnoreCase("userfollows"))
		{
			try{
				System.out.println("inside controller");
				String selection = request.getParameter("selectfollow");
				String userid = request.getParameter("uid");
				Musicdao dao = new Musicdao();
				dao.Userfollow(selection,userid);
				response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userfollow.jsp");
				}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
		if(action.equalsIgnoreCase("signup"))
		{
			System.out.println("inside Signup Page");
			User user=new User();
			String uid = request.getParameter("uid");
			String uname = request.getParameter("username");;
			String year= request.getParameter("BirthYear");
			String month = request.getParameter("BirthMonth"); ; 
			String day = request.getParameter("BirthDay");
			String email = request.getParameter("BirthYear");
			String upass = request.getParameter("password");
			String udetails = request.getParameter("details");
			String city = request.getParameter("city");
			String dob = year+"-" +month+"-"+day;
			System.out.println(uid+" "+uname+" "+email+" "+upass+" "+udetails+" "+city+" "+dob);
			user.setUid(uid);
			user.setUname(uname);
			user.setEmail(email);
			user.setUpass(upass);
			user.setUdetails(udetails);
			user.setCity(city);
			user.setDob(dob);
			Musicdao dao=new Musicdao();
			dao.usersignup(user);
			response.sendRedirect(request.getContextPath()
				+ "/Music/jsp/approval.jsp");
}	
		if(action.equalsIgnoreCase("folunfol"))
				{
String uid = request.getParameter("getuid");
String fuid = request.getParameter("getfuid");
String todo = request.getParameter("followunfollow");

if(todo.equalsIgnoreCase("FOLLOW"))
{System.out.println(uid +"follows "+fuid);
	System.out.println("Inside follow condition");
	Connection connect  = DBConnection.createConnection();
	PreparedStatement preparedStatement = connect.prepareStatement("insert into user_follows values (?,?,now());");
	preparedStatement.setString(1, fuid);
	preparedStatement.setString(2, uid);
	int x = preparedStatement.executeUpdate();
	
	
}
if(todo.equalsIgnoreCase("UNFOLLOW"))
{
	Connection connect  = DBConnection.createConnection();
	System.out.println(fuid +","+uid);
	PreparedStatement preparedStatement = connect.prepareStatement("delete from user_follows where user_id = ? and follow_id=?;");
	preparedStatement.setString(1, fuid);
	preparedStatement.setString(2, uid);
	int x = preparedStatement.executeUpdate();
	System.out.println(x+"Inside unfollow condition");
}
response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userfollow.jsp");
			
				}
		if(action.equalsIgnoreCase("unfollowartist"))
				{
			Connection connect  = DBConnection.createConnection();
				
				String uid = request.getParameter("getuid");
				String auid = request.getParameter("getauid");
				PreparedStatement preparedStatement = connect.prepareStatement("delete from fan_of where user_id = ? and artist_id=?;");
				preparedStatement.setString(2, auid);
				preparedStatement.setString(1, uid);
				int x = preparedStatement.executeUpdate();
				System.out.println("Inside unfollow condition");
				response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/findartist.jsp");
			
			
				}
		if(action.equalsIgnoreCase("artistlogin"))
		{
			try{
			String aid=request.getParameter("login");
			String pass=request.getParameter("password");
			
			Connection conn = DBConnection.createConnection();
			PreparedStatement ps = conn.prepareStatement("select * from artist where artist_id = ?");
			ps.setString(1, aid);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String rsid = rs.getString("artist_id");
			String rpwd = rs.getString("apassword");
			if(aid.equalsIgnoreCase(rsid) && pass.equalsIgnoreCase(rpwd))
			{
				Musicdao dao = new Musicdao();
				Artist artist=new Artist();
				artist = dao.getartist(aid);
				HttpSession session = request.getSession();
				session.setAttribute("artistnewdetails",artist);
				response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artisthome.jsp");
			
			}
			else
			{
				response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artistlogin.jsp");
				
			}
			}
			catch(Exception e)
			{
				response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artistlogin.jsp");
			}
			
			
		}
		if(action.equalsIgnoreCase("editartistname"))	
	      {
	    	  String newname = request.getParameter("editname");
	    	  System.out.println("New name"+newname);
			  Musicdao dao = new Musicdao();
		      String aid = request.getParameter("artid");
		      System.out.println("id "+aid);
		      dao.artist_editname(newname,aid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artisthome.jsp");  
	      }
	      if(action.equalsIgnoreCase("editprofile"))
	      {
	    	  String newprof = request.getParameter("profiledet");
	    	  System.out.println("New prof"+newprof);
			  Musicdao dao = new Musicdao();
		      String aid = request.getParameter("artid");
		      System.out.println("id "+aid);
		      dao.artist_editprofile(newprof,aid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artisthome.jsp"); 
	      }
	      if(action.equalsIgnoreCase("editdetaillink"))
	    		  {
	    	  String newlink = request.getParameter("editdetlink");
	    	  System.out.println("New link "+newlink);
			  Musicdao dao = new Musicdao();
		      String aid = request.getParameter("artid");
		      System.out.println("id "+aid);
		      dao.artist_editlink(newlink,aid);
			  response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artisthome.jsp"); 
	    		  }
	      if(action.equalsIgnoreCase("changepassaction"))
		  {
	  String newpass = request.getParameter("pass1");
	  System.out.println("New pass "+newpass);
	  Musicdao dao = new Musicdao();
	  String aid = request.getParameter("artid");
	  System.out.println("id "+aid);
	  dao.artist_editpass(newpass,aid);
	  response.sendRedirect(request.getContextPath()+ "/Music/Pages/Artist/artisthome.jsp"); 
		  } 
	      if(action.equalsIgnoreCase("reccaddnew"))
	      {
	    	String listname = request.getParameter("listname");
	    	String uid = request.getParameter("recommenduid");
	    	System.out.println("List name is "+listname);
	    	String cid = request.getParameter("ConcertList");
	    	System.out.println("cid  is "+cid);

			  Musicdao dao = new Musicdao();
			  dao.user_addrecommendationlist(listname,cid,uid);
	    	  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/Recommendationlist.jsp");
	 
	      }
	      if(action.equalsIgnoreCase("recaddexist"))
	      {
	    	String listname = request.getParameter("recclists");
	    	String uid = request.getParameter("recommenduid");
	    	System.out.println("List name is "+listname);
	    	String cid = request.getParameter("concertsoldlist");
	    	System.out.println("cid  is "+cid);
	    	Connection connect= null;
	        PreparedStatement preparedStatement=null;
	       
	        ResultSet rs=null;
			  
			    	try
			    	{
			    		connect=DBConnection.createConnection();
			    	preparedStatement = connect.prepareStatement("insert into user_recommends values(?,?,?,now())");
					preparedStatement.setString(1,uid);
					preparedStatement.setString(2,listname);
					preparedStatement.setString(3,cid);
			       preparedStatement.executeUpdate();
					connect.close();
			    	  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/Recommendationlist.jsp");

			    }
			    	catch(Exception e)
			    	{
			    		System.out.println(e);
				    	  response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/Recommendationlist.jsp");

			    	     
			    	}
				
			   
	      
	}
	      
		
		if(action.equalsIgnoreCase("login"))
		{
			String uid=request.getParameter("login");
			String pass=request.getParameter("password");
			System.out.println(uid+"password"+pass);
			Connection conn = DBConnection.createConnection();
			PreparedStatement ps = conn.prepareStatement("select * from user where user_id = ?");
			ps.setString(1, uid);
			ResultSet rs = ps.executeQuery();
			rs.next();
			String rsid = rs.getString("user_id");
			String rpwd = rs.getString("upassword");
			ps.close();
			rs.close();
			System.out.println(rsid+"password from result set"+rpwd);
			if(uid.equalsIgnoreCase(rsid) && pass.equalsIgnoreCase(rpwd))
			{
			Musicdao dao = new Musicdao();
			User user=new User();
			user=dao.getuser(uid);
			Connection connect  = DBConnection.createConnection();
			System.out.println(uid+" "+user.getCity()+" "+user.getEmail());
			HttpSession session = request.getSession();
			session.setAttribute("userdetails",user);
			response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/userhome.jsp");
			}
			else{
				response.sendRedirect(request.getContextPath()+ "/Music/Pages/User/Login.jsp");
			}
			}

		}
		catch(Exception e)
		{
			System.out.println(e);
			}
	}
		}


