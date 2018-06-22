<%-- 
    Document   : home
    Created on : 30 Jul, 2017, 12:01:32 AM
    Author     : Deepak
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="w3.css">
        <script href="bootstrap/js/bootstrap.min.js"></script>
        <script>
            var slideIndex = 1;
            function myAccFunc() {
            var x = document.getElementById("demoAcc");
            if (x.className.indexOf("w3-show") === -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-aqua";
            } else { 
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className = 
            x.previousElementSibling.className.replace(" w3-aqua", "");
                    }
            }
            function myAccFunc2() {
            var x = document.getElementById("demoAcc2");
            if (x.className.indexOf("w3-show") === -1) {
            x.className += " w3-show";
            x.previousElementSibling.className += " w3-aqua";
            } else { 
            x.className = x.className.replace(" w3-show", "");
            x.previousElementSibling.className = 
            x.previousElementSibling.className.replace(" w3-aqua", "");
                    }
            }
            function details() {
                var x = document.getElementById("about");
                var y = document.getElementById("hello");
                var z = document.getElementById("slideshow");
                if(x.style.display==="none"){
                    x.style.display = "block" ;
                    y.style.display = "none" ;
                    z.style.display = "none" ;
                    
                }
                else{
                    y.style.display = "block" ;
                    x.style.display = "none" ;
                    z.style.display = "none" ;
                }
            }
            function details2() {
                var x = document.getElementById("friendlist");
                var y = document.getElementById("friend");
                if(x.style.display==="none"){
                    x.style.display = "block" ;
                    y.style.display = "none" ;
                }
                else{
                    y.style.display = "block" ;
                    x.style.display = "none" ;
                }
            }
            function details3() {
                var x = document.getElementById("slideshow");
                var y = document.getElementById("about");
                var z = document.getElementById("hello");
                if(x.style.display==="none"){
                    x.style.display = "block" ;
                    y.style.display = "none" ;
                    z.style.display = "none" ;
                }
                else{
                    z.style.display = "block" ;
                    y.style.display = "none" ;
                    x.style.display = "none" ;
                }
            }
            showDivs(slideIndex);
            function plusDivs(n) {
              showDivs(slideIndex += n);
            }
            function showDivs(n) {
              var i;
              var x = document.getElementsByClassName("mySlides");
              if (n > x.length) {slideIndex = 1}    
              if (n < 1) {slideIndex = x.length}
              for (i = 0; i < x.length; i++) {
                 x[i].style.display = "none";  
              }
              x[slideIndex-1].style.display = "block";  
            }
            </script>
    </head>
<body style="background: #35424a">
    <div class="w3-sidebar w3-transparent w3-bar-block" style="height: 600px;width: 15%;">
        <h1 class="w3-bar-item" style=" color: white"><i class="fa fa-bars" style="font-size:32px;margin-right: 5px;"></i>Menu</h1>
        <button class="w3-bar-item w3-button w3-" style="font-size:20px;color: white" onclick="details()"><i class="fa fa-info-circle" style="font-size:25px;margin-right: 5px;"></i>About</button>
        <button class="w3-bar-item w3-button" style="font-size:20px;color: white" onclick="details3()"><i class="fa fa-picture-o" style="font-size:25px;margin-right: 5px;"></i>Photos</button>
        <button class="w3-bar-item w3-button" onclick="details2()" style="color: white"><i class="fa fa-users" style="font-size:25px;margin-right: 5px;"></i>Friends</button>
        <div class="w3-bar-item w3-button" onclick="myAccFunc2()" style=" color: white"><i class="fa fa-gear fa-spin" style="font-size:25px;margin-right: 5px;"></i>Settings  <i class="fa fa-caret-down" style=" margin-left: 5px;"></i></div>
        <div id="demoAcc2" class="w3-hide w3-card-4" style="color:#35424a">
            <button class="w3-bar-item w3-button" style=" color: white"onclick="document.getElementById('id4').style.display = 'block'"><i class="fa fa-edit" style="font-size:25px; margin-right: 5px;"></i>Edit Details</button>
            <button class="w3-bar-item w3-button" style=" color: white"onclick="document.getElementById('id3').style.display = 'block'"><i class="fa fa-edit" style="font-size:25px;margin-right: 5px;"></i>Change Password</button>
        </div>
    </div>
    <div class="w3-sidebar w3-transparent w3-bar-block" id="friend" style="height: 600px;width: 15%;right: 0;">
        <h1 class="w3-bar-item" style="color:white">Friends</h1>
    </div>
    <div class="w3-sidebar w3-transparent w3-bar-block" id="friendlist" style="height: 600px;width: 15%;right: 0;display: none">
        <h1 class="w3-bar-item" style="color:white">Friends</h1>
        <%@ page import="java.sql.*" %> 
        <%!Statement st2=null;%>
        <%  try
            {   java.sql.Connection con2 ;
                Class.forName("com.mysql.jdbc.Driver");
                con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork","root","");
                st2=con2.createStatement(); 
                ResultSet rs;
                rs = st2.executeQuery("select * from users");
                while(rs.next())
                {
                    String fname = rs.getString("Fname");
                    String lname = rs.getString("Lname");
                    String uname = rs.getString("username");
                    if(uname.equals(session.getAttribute("Username"))){}
                    else{
                    %>
                    <p class="w3-bar-item w3-white w3-text-black" style="margin:0;border-bottom: 1px solid black"><%=fname%> <%=lname%></p>
                    <%
                        }
                 }
            }
            catch(Exception e){
                out.print("error" + e.getMessage()) ;
            }
        %>
    </div>
    <div style="margin-left: 15%;margin-right: 15%;">
    <header class="w3-container" style="background:#990033;color: white" id="target">
    <h1 style="float: left;"><i class="fa fa-facebook-square" style=" margin-right: 10px;"></i> Welcome <span style=" color: wheat;font-family: serif;"><%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></span></h1>
    <a href="logout.jsp" class="w3-btn w3-round-large w3-hover-grey" style="float: right;margin-top: 20px;background: #006699">Logout</a>
    </header>
    <div class="w3-container" style="height: 500px;background:#ccffff;background-image: url('photo/<%=session.getAttribute("cov")%>');border: green 1px solid;background-repeat:no-repeat;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover;background-position:center;" onmouseout="document.getElementById('btn2').style.display = 'none'" onmouseenter="document.getElementById('btn2').style.display = 'block'">
        <button id="btn2" class="w3-btn w3-opacity-max w3-hover-opacity w3-red" style="display: none;float: left;" onclick="document.getElementById('id2').style.display = 'block'" onmouseenter="document.getElementById('btn2').style.display = 'block'">Update Cover Photo</button>
        <div id="profile" class="w3-container w3-light-green" onmouseout="document.getElementById('btn1').style.display = 'none'" onmouseenter="document.getElementById('btn1').style.display = 'block'" style="float: right;background-image: url('photo/<%=session.getAttribute("pro")%>');margin-right: 10px; margin-top: 275px;width: 200px; height: 200px;background-repeat:no-repeat;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover;background-position:center; border: 1px solid magenta;border-radius:5px">
        <button id="btn1" class="w3-btn w3-opacity-max w3-hover-opacity w3-red" style="margin-top: 96%;display: none;" onclick="document.getElementById('id1').style.display = 'block'" onmouseenter="document.getElementById('btn1').style.display = 'block'" >Update Profile Pic.</button>
        </div>
    </div>
    <div class="w3-container w3-blue-gray" id="hello" style="height: 500px;border: 1px solid green;background-image: url('pic/pic80.jpg');background-repeat:no-repeat;-webkit-background-size:cover;-moz-background-size:cover;-o-background-size:cover;background-size:cover;background-position:center;">
    </div>
    <div class="w3-container" id="about" style="height: 500px;display: none;background: #002266;border: 1px solid green">
    <div class=" w3-container" style=" margin-top: 20px;border: 2px solid fuchsia;border-radius: 5px;color: #ccffff">
    <h1 class="w3-center">Details :</h1>
    <p style=" margin-left: 20%;margin-top: 20px; font-size: 30px;color: wheat;"><b>First Name : </b><span style=" color: white; padding: 5px;padding-right: 10px;margin-left: 30px;"><%=session.getAttribute("fname")%></span></p>
    <p style=" margin-left: 20%; margin-top: 30px;font-size: 30px;color: wheat"><b> Last Name : </b><span style=" color: white;padding: 5px;padding-right: 10px;margin-left: 36px;"><%=session.getAttribute("lname")%></span></p>
    <p style=" margin-left: 20%;margin-top: 30px;font-size: 30px;color: wheat"><b> Email : </b><span style=" color: white;padding: 5px;padding-right: 10px;margin-left: 121px;"><%=session.getAttribute("email")%></span></p>
    <p style=" margin-left: 20%;margin-top: 30px;font-size: 30px;color: wheat"><b> mobile : </b><span style=" color: white;padding: 5px;padding-right: 10px;margin-left: 101px;"><%=session.getAttribute("mobile")%></span></p>
    <p style=" margin-left: 20%;margin-top: 30px;font-size: 30px;color: wheat"><b> Date Of Birth :</b><span style=" color: white;padding: 5px;padding-right: 10px;margin-left: 5px;"> <%=session.getAttribute("dob")%></span></p>
    </div>
    </div>
    <div class="w3-display-container" id="slideshow" style="height: 600px;display: none;background: #002266;border: 1px solid green">
        <img class="mySlides" src="photo/pic10.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic30.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic40.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic50.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic60.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic70.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic80.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pic90.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/icecastle_in_frozen-1920x1200.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/lone_tree_on_a_hill-wallpaper-1920x1080.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/lonely_woman-wallpaper-1920x1080.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/maiden_life_bird-wallpaper-2048x1152.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/manhattan_bridge.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/petrified_dignity-wallpaper-2048x1152.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/pice.jpg" style="width:100%;">
        <img class="mySlides" src="photo/picc.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/picd.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/walking_with_dinosaurs_3d-2560x1600.jpg" style="width:100%;display: none">
        <img class="mySlides" src="photo/wonder_woman.jpg" style="width:100%;display: none;">
        <button class="w3-button w3-black w3-display-left" onclick="plusDivs(-1)">&#10094;</button>
        <button class="w3-button w3-black w3-display-right" onclick="plusDivs(1)">&#10095;</button>
    </div>
    </div>
    <div id="id1" class="w3-modal">
        <div class="w3-modal-content">
            <div class="w3-container w3-pink">
            <span onclick="document.getElementById('id1').style.display='none'" class="w3-button w3-display-topright w3-deep-orange">&times;</span>
            <form action="profile.jsp" method="post" enctype="multipart/form-data">
            <h1> Profile Picture.</h1>
            <p> <i class="fa fa-file-picture-o" style="font-size:48px;color:blue;"></i>
            <input type="file" name="ImageFile" id="ImageFile" class="w3-input"></p>
            <p>
            <button type="submit" name="submit" class="w3-btn w3-gray w3-round-large w3-hover-amber" style=" font-size: 25px;" ><i class="fa fa-save" style="font-size:25px; margin-right: 5px;"></i>Save</button>
            </p>
            </form>
            </div>
        </div>
    </div>
    <div id="id2" class="w3-modal">
        <div class="w3-modal-content">
            <div class="w3-container w3-purple">
            <span onclick="document.getElementById('id2').style.display='none'" class="w3-button w3-display-topright w3-deep-orange">&times;</span>
            <form action="cover.jsp" method="post" enctype="multipart/form-data">
            <h1>Cover Photo.</h1>
            <p> <i class="fa fa-file-picture-o" style="font-size:48px;color:red"></i>
            <input type="file" name="ImageFile2" id="ImageFile" class="w3-input"></p>
            <p>
            <button type="submit" name="submit" class="w3-btn w3-gray w3-round-large w3-hover-light-blue" style=" font-size: 25px;" ><i class="fa fa-save" style="font-size:25px; margin-right: 5px;"></i>Save</button>
            </p>
            </form>
            </div>
        </div>
    </div>
    <div id="id3" class="w3-modal">
        <div class="w3-modal-content">
            <div class="w3-container w3-black">
            <span onclick="document.getElementById('id3').style.display='none'" class="w3-button w3-red w3-display-topright">&times;</span>
            <h1 class=" w3-display-topmiddle">Change Password :</h1>
            <form action="changepassword.jsp" method="post" style="height: 350px;width: 500px; margin-left: 200px; margin-top: 100px;">
            <label style="font-size: 18px;">Current Password :</label><input type="password" name="cpassword" placeholder="Current password" style=" margin-left: 45px; margin-bottom: 20px;border: 2px solid #ADFF2F;border-radius: 5px; width: 270px; height: 40px; font-size: 18px;" required><br>
            <label style="font-size: 18px;">New Password :</label><input type="password" name="npassword" placeholder="New password" style=" margin-left: 74px; margin-bottom: 20px;border: 2px solid #ADFF2F;border-radius: 5px; width: 270px; height: 40px; font-size: 18px;" required><br>
            <label style="font-size: 18px;">Confirm Password :</label><input type="password" name="cnpassword" placeholder="New Confirm password" style=" margin-left: 42px; margin-bottom:20px;border: 2px solid #ADFF2F;border-radius: 5px; width: 270px; height: 40px; font-size: 18px;" required><br>
            <input type="submit" class="w3-btn w3-amber w3-round-large w3-hover-gray" name="submit" value="Confirm" style=" width: 150px; margin-top: 40px; margin-left: 150px;">
            </form>
            </div>
        </div>
    </div>
    <div id="id4" class="w3-modal">
        <div class="w3-modal-content">
            <div class="w3-container w3-black ">
                <span onclick="document.getElementById('id4').style.display='none'" class="w3-button w3-red w3-display-topright">&times;</span>
                <h1 class=" w3-display-topmiddle"> Edit Details :</h1>
                <form action="editdetails.jsp" method="post" style="height: 400px;width: 500px; margin-left: 250px; margin-top: 100px;">
                <label>First Name:</label><input type="text" name="fname" value="<%=session.getAttribute("fname")%>" style=" margin-left: 50px; margin-bottom:  5px;border: 2px solid #ADFF2F;border-radius: 5px; width: 300px; height: 40px; font-size: 18px;"><br>
                <label>Last Name:</label><input type="text" name="lname" value="<%=session.getAttribute("lname")%>" style=" margin-left: 52px; margin-bottom:  5px;border: 2px solid #ADFF2F;border-radius: 5px;width: 300px;height: 40px;font-size: 18px;"><br>
                <label>Mobile:</label><input type="text" name="mno" value="<%=session.getAttribute("mobile")%>" style=" margin-left: 84px;margin-bottom:  5px;border: 2px solid #ADFF2F;border-radius: 5px;width: 300px;height: 40px;font-size: 18px;"><br>
                <label>Email:</label><input type="text" name="email" value="<%=session.getAttribute("email")%>" style=" margin-left: 91px;margin-bottom:  5px;border: 2px solid #ADFF2F;border-radius: 5px;width: 300px;height: 40px;font-size: 18px;"><br>
                <label>Username:</label><input type="text" name="uname" value="<%=session.getAttribute("Username")%>" style=" margin-left: 56px;margin-bottom:  5px;border: 2px solid #ADFF2F;border-radius: 5px;width: 300px;height: 40px;font-size: 18px;"><br>
                <label>Date Of Birth:</label><input type="text" name="dob" value="<%=session.getAttribute("dob")%>" style=" margin-left: 33px;margin-bottom:  5px;border: 2px solid #ADFF2F;border-radius: 5px;width: 300px;height: 40px;font-size: 18px;"><br>
                <input type="submit" name="submit" value="Save" class="w3-btn w3-purple w3-round-large" style=" width: 150px; margin-top: 40px; margin-left: 100px;">
                </form>
            </div>
        </div>
    </div>
    <footer class="w3-container" style="background:#990033;border-top:#660066 2px solid">
        <div style="margin-left: 50px;color: white"><h4>Devil Corporation copyright &copy; 2017</h4>
            <address>
                Designed And Maintained By Deepak Prajapat<br>
                Student At<br>
                AIACTR New Delhi.
            </address></div>
    </footer>
</body>
</html>
