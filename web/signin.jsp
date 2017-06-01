<%
    //session.setMaxInactiveInterval(90);
    
    Cookie ck[]=request.getCookies();
    String s1="",s2="";
    
    if(ck!=null){
    
    for(int i=0; i<ck.length; i++){
        Cookie c=ck[i];
        String name=c.getName();
        if(name.equals("uid")){
            s1=c.getValue();
        }else if(name.equals("pw")){
            s2=c.getValue();
        }
    }
       }
    
%>
<!DOCTYPE html>
<html>
<style>
form {
    border: 2px solid #f1f1f1;
}
 label {
      font-size: 15px;
      font-family: sans-serif;
      line-height: 1.375em;
      color: green;
      font-weight: 400;
      margin-bottom: 30px;
  }  

input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
     margin: 8px 0;
    display: ruby-text-group;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

button {
    background-color: black;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

button:hover {
    opacity: 0.8;
}


.imgcontainer {
    text-align: center;
    margin: 24px 0 12px 0;
}

img.avatar {
    width: 40%;
    border-radius: 50%;
}

.container {
    padding: 16px;
}

span.psw {
    float: right;
    padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
    span.psw {
       display: block;
       float: none;
    }
    
}
</style>
<body>

<h2 align = "center">Web Dispensary/Login</h2>

<form action="newjsp1.jsp">
  <div class="imgcontainer">
    <img src="w1.jpg" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label>Username</label>
    <input type="text" placeholder="Enter Username" name="t1" required value="<%=s1%>">

    <label>Password</label>
    <input type="password" placeholder="Enter Password" name="t2" required value="<%=s2%>">
    
    <label>Type of user</label> :
                <select name="t3">
                        <option>buyer</option>
                        <option>admin</option>
                        </select>
    
        
    <button type="submit">Login</button>
    <input type="checkbox" checked="checked" name="c1"> Remember me<br>

  </div>

 
</form>
    <form action ="registration.jsp">
        <button type ="submit">New User</button> 
    </form>
    

</body>

</html>
