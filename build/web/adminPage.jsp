<%-- 
    Document   : adminPage
    Created on : Oct 13, 2019, 3:11:23 PM
    Author     : thmma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Admin</title>
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
	<!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
		<div class="header-area ">
             <div id="sticky-header" class="main-header-area white-bg">
                 <div class="container-fluid p-3">
                     <div class="row align-items-center justify-content-between no-gutters">
                         <div class="col-xl-2 col-lg-2">
                             <div class="logo-img">
                             </div>
                         </div>
                         <div class="col-xl-7 col-lg-7">
                             <div class="main-menu  d-none d-lg-block">
                                 <nav>
                                     <ul id="navigation">
                                         <li><h5><s:property value="#session.UserAuth.username"/></h5></li>
                                         <li><a class="active" href="LogOut">Log out</a></li>

                                     </ul>
                                 </nav>
                             </div>
                         </div>
                         <div class="col-12">
                             <div class="mobile_menu d-block d-lg-none"></div>
                         </div>
                     </div>
                 </div>
             </div>
         </div>
	</header>
	<!-- header-end -->

	<!-- breadcam_area_end -->

	<!-- Start Sample Area -->
	<section class="sample-text-area">
		<div class="container box_1170">
			<h3 class="text-heading">Admin page</h3>
			
		</div>
            <div class="container">
    
                    <s:iterator var="menuItem" value="menuModel">
                    <div class="card">
                        <h3 class="card-header"><s:property value="#menuItem.name"/></h3>
                        <div class="card-body">
                             <ul class="list-group list-group-flush">
                                 <li class="list-group-item">
                                     <h4 class="card-title">Menu content</h4>
                                     <s:iterator value="#menuItem.menuFoodList">
                                         <p class="card-text"><s:property value="name"/>
                                        <s:url action="ShowSelectedAction" var="editSelected" includeParams="get" escapeAmp="false">
                                            <s:param name="actionRequested" value="%{'Edit'}" />
                                             <s:param name="selectedMenuID" value="%{#menuItem.id}" />
                                             <s:param name="selectedFoodID" value="%{id}" />
                                        </s:url>
                                        <a href="<s:property value="#editSelected"/>" class="genric-btn primary">Edit</a>
                                         <s:url action="ShowSelectedAction" var="removeSelected" includeParams="get" escapeAmp="false">
                                            <s:param name="actionRequested" value="%{'Remove'}" />
                                             <s:param name="selectedMenuID" value="%{#menuItem.id}"/>
                                             <s:param name="selectedFoodID" value="%{id}"/>
                                        </s:url>
                                        <a href="<s:property value="#removeSelected" />" class="genric-btn primary">Remove</a>
                                         
                                     </s:iterator>

                                        <br/>
                                        <br/>

                                        <s:url action="ShowSelectedAction" var="addFood" includeParams="get" escapeAmp="false">
                                            <s:param name="actionRequested" value="%{'Add_new'}" />
                                             <s:param name="selectedMenuID" value="%{#menuItem.id}" />
                                        </s:url>
                                        <a href="<s:property value="#addFood" />" class="genric-btn info">Add new</a>
                                        
                                 </li>
                                 
                                 <li class="list-group-item">
                                     
                                     <h4 class="card-title">Combo</h4>
                                     <s:iterator value="#menuItem.comboFoodList">
                                         <h4><s:property value="key"/></h4>
                                         <s:set var="comboID" value="key"/>
                                         <s:if test="key != null">
                                               <s:url action="ShowSelectedAction" var="removeCombo" includeParams="get" escapeAmp="false">
                                                 <s:param name="actionRequested" value="%{'Remove_Combo'}" />
                                                 <s:param name="selectedMenuID" value="%{#menuItem.id}" />
                                                 <s:param name="selectedComboID" value="%{#comboID}" />

                                             </s:url>
                                            <a href="<s:property value="#removeCombo" />" class="genric-btn default">Remove combo</a>
                                         </s:if>
                                         
                                        
                                         <s:iterator value="value" var="valueInArray">
                                             <p class="card-text"><s:property value="name"/></p>
                                             

                                         </s:iterator>

                                     </s:iterator>
                                             
                                             <s:url action="ShowSelectedAction" var="addCombo" includeParams="get" escapeAmp="false">
                                                 <s:param name="actionRequested" value="%{'Add_new_combo'}" />
                                                 <s:param name="selectedMenuID" value="%{#menuItem.id}" />
                                             </s:url>
                                             <a href="<s:property value="#addCombo" />" class="genric-btn info">Add new combo</a>

                                 </li>
                             </ul>

                        </div>
                    </div>
                                        <br/>
                    </s:iterator>
            </div>
                
                <br/>
                
                <br/>
                
               
             
	</section>
        <div class="container">
  <div class="accordion" id="accordionExample">
      <s:iterator var="currentUser" value="userAndOrdersList">
          <div class="card">
                <div class="card-header" id="headingOne">
                    <h5 class="mb-0">
                        <s:if test="%{!key.role.equals('admin')}">
                            <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="<s:property value="key.userID"/>"></button>
                            <s:property value="key.userID"/> 
                            <s:property value="key.username"/> 

                            <s:url action="RemoveUserAction" var="removeSingleUser" includeParams="get" escapeAmp="false">
                                <s:param name="actionRequested" value="%{'Remove_User'}" />
                                <s:param name="selectedUserID" value="%{key.userID}" />
                            </s:url>
                            <a href="<s:property value="#removeSingleUser"/>" class="genric-btn default">Remove User</a>
                       
                    </h5>
                </div>

                <div id="<s:property value="key.userID"/>" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
                    <div class="card-body">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <h4>Food list:</h4>

                                <s:iterator var="currentUsersOrder" value="#currentUser.value">
                                     <br/>
                                    -----------------------
                                    <s:property value="orderID"/> : <s:property value="dateOrdered"/> 
                                    <br/>


                                    <s:iterator var="currentFoodList" value="#currentUsersOrder.foodLists">
                                         <s:property value="name"/>
                                    </s:iterator>
                                    <br/>
                                </s:iterator>
                            </li>

                                                                <li class="list-group-item">

                                    <h4>combo list:</h4>

                                    <s:iterator var="currentUsersOrder" value="#currentUser.value">

                                        <s:iterator var="currentComboList" value="#currentUsersOrder.comboLists">
                                            <s:property value="key"/>
                                            <br/>
                                            <s:iterator var="foodInCombo" value="#currentComboList.value">
                                                <s:property value="name"/>
                                            </s:iterator>
                                        <br/>

                                        </s:iterator>

                                    </s:iterator>
                            </li>


                              

                        </ul>
                    </div>
                </div>
                                            </s:if>

            </div>
      </s:iterator>
            
        </div>
</div>
        
        
        

	<!-- End Sample Area -->

	
	

	<!-- JS here -->
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

        <!-- Modal -->
<div class="modal fade" id="exampleModal3" tabindex="-1" role="dialog" aria-labelledby="exampleModal3Label" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModal3Label">New food</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      </div>
      
    </div>
  </div>
</div>
        
        <style>
            .modal-backdrop {
  z-index: 0;
}

.header-area
{
     z-index: 1;
}
        </style>
        
        <script>
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
            
</body>
