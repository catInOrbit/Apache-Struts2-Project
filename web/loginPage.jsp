<%-- 
    Document   : loginPage
    Created on : Oct 6, 2019, 3:25:56 PM
    Author     : thmma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Login Page</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- <link rel="manifest" href="site.webmanifest"> -->
	<link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
	<!-- Place favicon.ico in the root directory -->

	<!-- CSS here -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/flaticon.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/slicknav.css">
	<link rel="stylesheet" href="css/style.css">
	<!-- <link rel="stylesheet" href="css/responsive.css"> -->
        
       <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
    <body>
        
        


        <div class="container">
            <div class="row">
        <div class="col-sm-4">
            <div class="card">
                <div class="card-body">
                    <h4>Login here:</h4>
                    <s:form action="Login" method="POST">

                        <div class="row">
                            <div class="input-field col s6">
                                <s:textfield label="Username" key="username"/>
                            </div>
                            <div class="input-field col s6">
                                <s:password label="Password" key="userPassword"/>
                            </div>
                        </div>
                        <s:submit/>

                    </s:form>
                </div>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body">
                    <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseAddUser" aria-expanded="false" aria-controls="collapseExample">
             Create new user here:
        </button>
       
        
        <div class="collapse" id="collapseAddUser">
            <div class="container">
                <s:form action="NewUser" method="GET">
                    <form class="needs-validation" novalidate>
                        <div class="form-row">
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">Username</label>
                                <input type="text" name="username" class="form-control" id="validationCustom01" placeholder="Username" required>

                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustom02">Password</label>
                                <input type="text" name="password" class="form-control" id="validationCustom02" placeholder="Password"  required>

                            </div>

                            <div class="col-md-4 mb-3">
                                <label for="validationCustom01">Full name</label>
                                <input type="text" name="fullname" class="form-control" id="validationCustom01" placeholder="Full name" required>

                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationCustomUsername">Email</label>
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                                    </div>
                                    <input type="text" name="email" class="form-control" id="validationCustomUsername" placeholder="Email" aria-describedby="inputGroupPrepend" required>
                                    <div class="invalid-feedback">
                                        Please choose an email
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--                 <s:url var="register" action="NewUser" includeParams="get" escapeAmp="false">
                            <s:param name="username" value="%{#usernameNew}"></s:param>
                            <s:param name="password" value="%{#passwordNew}"></s:param>
                            <s:param name="fullname" value="%{#fullnameNew}"></s:param>
                            <s:param name="email" value="%{#emailNew}"></s:param>
                        </s:url>  -->
                        <button class="btn btn-primary" type="submit">Submit form</button>
                        <!--<a class="btn btn-primary" type="submit" href="<s:property value="#register"/>">Register</a>-->
                    </form>
                </s:form>



            </div>
        </div>
                </div>
            </div>
        </div>
    </div>
            
        <br/>

        <s:textfield type="hidden" name="ERROR" value=""/>
        <s:if test="#request.SUCCESS_REGISTER != null">
            <div class="alert alert-primary alert-dismissible fade show" role="alert">
                <strong>Success!</strong> <s:property value="#request.SUCCESS_REGISTER"/>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </s:if>
        
         <s:if test="%{!#ERROR.equals('')}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Error!</strong> <s:property value="#ERROR"/>
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
        </s:if>
            

        </div>
      
    
     
        
        
        
  
             
        
    </body>
    
    <script src="js/vendor/modernizr-3.5.0.min.js"></script>
	<script src="js/vendor/jquery-1.12.4.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/ajax-form.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/imagesloaded.pkgd.min.js"></script>
	<script src="js/scrollIt.js"></script>
	<script src="js/jquery.scrollUp.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/nice-select.min.js"></script>
	<script src="js/jquery.slicknav.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/plugins.js"></script>

	<!--contact js-->
	<script src="js/contact.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.form.js"></script>
	<script src="js/jquery.validate.min.js"></script>
	<script src="js/mail-script.js"></script>

	<script src="js/main.js"></script>
        

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>
</html>

