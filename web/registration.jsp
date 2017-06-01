<!DOCTYPE html>
<html>
<style>
/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

/* Set a style for all buttons */
button {
    background-color: black;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn,.signupbtn {
    float: left;
    width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }
}
</style>
<body>

<h2>Signup Form</h2>

<form action="SaveUser" style="border:1px solid #ccc">
  <div class="container">
    <label><b>Userid</b></label>
    <input type="text" placeholder="Enter UserId" name="t1" required>

    <label><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="t2" required>

<label><b>Name</b></label>
    <input type="text" placeholder="Enter Name" name="t3" required>

<label><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="t4" required>
   
<label><b>Mobile number</b></label>
    <input type="text" placeholder="Enter number" name="t5" required><br>
 

    
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>

    <div class="clearfix">
      <button type="button" class="cancelbtn">Cancel</button>
      <button type="submit" class="signupbtn">Sign Up</button>
    </div>
  </div>
</form>
<a href="index.jsp">sign in</a>


</body>
</html>
