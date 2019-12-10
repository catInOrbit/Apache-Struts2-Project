<%-- 
    Document   : selectedItemPage
    Created on : Oct 13, 2019, 9:04:26 PM
    Author     : thmma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>Selected Items</title>
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
                                 <h3><a href="MenuDisplay">Back</a></h3>
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
            <div class="container">
                
                <div class="row">
                    <div class="col-sm-8">
                                                        <s:if test="%{!actionRequested.equals('Request_Add_Combo')}">

                        <div class="card">
                            <div class="card-body">
                                    <s:form action="UpdateSelected" method="POST">

                                        <s:hidden name="actionRequested" value="%{actionRequested}"/>
                                        <s:hidden name="selectedFoodID" value="%{#request.selectedDTO.id}"/>
                                        <s:hidden name="selectedMenuID" value="%{#request.selectedMenu}"/>

                                        <h4>Create/Update food</h4>



                                        <form class="needs-validation" novalidate>
                                            <div class="form-row">
                                                <div class="col-md-4 mb-3">
                                                    <label for="validationCustom01">Food name</label>
                                                    <input type="text" value="<s:property value="#request.selectedDTO.name"/>" class="form-control" id="validationCustom01" placeholder="Food name" name="foodNameNew" required>
                                                    <div class="valid-feedback">
                                                        Looks good!
                                                    </div>
                                                </div>
                                                <div class="col-md-4 mb-3">
                                                    <label for="validationCustom02">Food Price</label>
                                                    <input type="number" name="foodPriceNew" step="any" class="form-control" id="validationCustom02" placeholder="Price" value="<s:property value="#request.selectedDTO.price"/>" required>
                                                    <div class="valid-feedback">
                                                        Looks good!
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6 mb-3">
                                                    <label for="validationCustom03">Image Link</label>
                                                    <input type="text" value="<s:property value="#request.selectedDTO.imageLink"/>" class="form-control" name="imageLink" id="validationCustom03" placeholder="Link" required>
                                                    <div class="invalid-feedback">
                                                        Please provide a valid city.
                                                    </div>
                                                </div>
                                            </div>
                                            <br/>

                                            <s:checkbox name="isMainDisk" label="Is Main Disk" value="#request.selectedDTO.isMain"/> 
                                            <br/>

                                            <s:checkbox  name="isMainDisk2" label="Is Main Disk 2" value="#request.selectedDTO.isMain2"/> 
                                            <br/>

                                            <s:checkbox  type="checkbox" name="isSideDisk" label="Is Side Disk" value="#request.selectedDTO.isSide"/> 


                                            <s:submit class="genric-btn info" value="Submit"></s:submit>
                                            </form>



                                    </s:form>
                            </div>
                        </div>
                                                            
                                                                                            </s:if>

                    </div>
                <s:if test="allFoodList != null">

                    <div class="col-sm-4">
                        <div class="card">
                            <div class="card-body">
                                    <s:form action="AddFoodFromDB" method="POST">
                                        <div class="container">
                                            <h4>Or add from database</h4>
                                            <s:textfield type="hidden" name="actionRequested" value="Request_Add_From_DB"/>
                                            <s:hidden name="selectedMenuID" value="%{#request.selectedMenu}"/>

                                            <s:iterator var="foodFromAllList" value="allFoodList">
                                                <input type="checkbox" name="foodFromDB" value="<s:property value="#foodFromAllList.id"/>"/><s:property value="name"/>
                                                <br/>
                                            </s:iterator>
                                            <br/>
                                            <s:submit value="Add"/>

                                        </div>

                                    </s:form>
                            </div>
                        </div>
                    </div>
                    </s:if>

                </div>
                
            
            </div>
                
                <br/>
               
                
                    
                <br/>
             
	</section>
        
        <s:if test="%{actionRequested.equals('Request_Add_Combo')}">
            
            
            <div class="container">
                <div class="card">
                    <div class="card-body">
                        <s:form action="UpdateSelected" method="POST">
                                <h5>Enter combo name</h5>

                                <s:hidden name="actionRequested" value="Request_New_Combo"/>
                                <s:hidden name="selectedMenuID" value="%{#request.selectedMenu}"/>
                                <input type="text" class="form-control" name="newComboName" id="validationCustom03" placeholder="Name" required/>
                                <br/>
                                <h5>Select food to add to menu</h5>
                                <br/>
                                <s:iterator var="currentMenu" value="%{#request.selectedMenuDTO}">
                                    <s:iterator var="currentFoodList" value="#currentMenu.menuFoodList">
                                        <input type="checkbox" name="selectFoodToCombo" value="<s:property value="id"/>"/> <s:property value="name"/>
                                    </s:iterator>
                                </s:iterator>

                                <s:submit value="Submit"/>
                        </s:form>
                    </div>
                </div>
            </div>
           
        
        </s:if>
        
       
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
