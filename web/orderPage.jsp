<%-- 
    Document   : orderPage
    Created on : Oct 12, 2019, 1:16:06 PM
    Author     : thmma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!doctype html>
<html class="no-js" lang="zxx">

<head>
   <meta charset="utf-8">
   <meta http-equiv="x-ua-compatible" content="ie=edge">
   
   <title>Order Page</title>
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
                                         <a href="MenuDisplay" class="boxed-btn">Back to menu page</a> 
                                     </ul>
                                 </nav>
                             </div>
                         </div>
                         <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                             <div class="get_in_tauch">
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

    <!-- breadcam_area_start -->
<!--    <div class="breadcam_area bradcam_bg overlay2">
         <div class="bradcam_text">
             <h3>single blog</h3>
         </div>
     </div>-->
     <!-- breadcam_area_end -->

   <!--================Blog Area =================-->
   <section class="blog_area single-post-area section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-8 posts-list">
               <div class="single-post">
<!--                  <div class="feature-img">
                     <img class="img-fluid" src="img/blog/single_blog_1.png" alt="">
                  </div>-->
                  <div class="blog_details">
                          <div class="card">
                              <div class="card-header">
                                   Order: <s:property value="currentSelectedOrder.orderID"/>: <s:property value="currentSelectedOrder.dateOrdered"/>
                              </div>
                              <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">
                                    <h4 class="card-title">Combo</h4>
                                    <s:set var="totalFoodSummary" value="0"/>

                                        <s:iterator var="currentOrderElement" value="currentSelectedOrder.comboLists" >

                                            <p class="card-text"> <s:property value="key"/></p>
                                            <s:set var="currentComboID" value="key"/>
                                            <s:iterator var="comboList" value="#currentOrderElement.value" >
                                                <p> <s:property value="#comboList.name"/></p>
                                                
                                                <br/>
                                                <s:iterator var="priceMap" value="currentSelectedOrder.comboPrice">
                                                    <s:if test="key==#currentComboID">
                                                        <b> <s:property value="value"/> VND
                                                            <s:set var="comboPriceDisplay" value="value"/>
                                                            <s:set var="totalFoodSummary" value="%{#totalFoodSummary + value}"/>

                                                        </b> 
                                                    </s:if>
                                                </s:iterator>
                                            </s:iterator>
                                        </s:iterator>
                                    </li>
                                    
                                    <li class="list-group-item">
                                    <h4 class="card-title">Food:</h4>
                                        <s:iterator var="currentFoodElement" value="currentSelectedOrder.foodLists" >
                                            <p class="card-text"> <s:property value="name"/></p>
                                            <p class="card-text"> <b><s:property value="price"/> VND</b></p>
                                                <s:set var="totalFoodSummary" value="%{price + #totalFoodSummary}"/>
                                        </s:iterator>
                                    </li>
                                    
                                    <li class="list-group-item">
                                        Total price: <s:property value="#totalFoodSummary"/>
                                    </li>
                                    
                                </ul>

                              </div>
                          </div>
                  </div>
               </div>
               
               
            </div>
            <div class="col-lg-4">
               <div class="blog_right_sidebar">
                  <aside class="single_sidebar_widget search_widget">
                      <s:form action="SearchOrder" method="GET">

                          <form action="#">
                              <div class="form-group">
                                  <div class="input-group mb-3">
                                      <input type="text" name="searchPattern" class="form-control" placeholder='Search for orders'
                                             onfocus="this.placeholder = ''" onblur="this.placeholder = 'Search Keyword'">
                                      <div class="input-group-append">
                                          <button class="btn" type="submit"><i class="ti-search"></i></button>
                                      </div>

                                      <button class="button rounded-0 primary-bg text-white w-100 btn_1 boxed-btn"
                                              type="submit">Search</button>
                                  </div>
                              </div>

                          </form>

                                  </s:form>

                       
                         
                         <ul class="list cat-list">
                        
                         <s:iterator var="orderItem" value="ordersSearched" status="groupStatus">
                        <li>
                            <s:url action="UserPage" id="urlTag">
                                <s:param name="chosenOrderID"><s:property value="orderID"/></s:param>
                            </s:url>
                           <s:a href="%{urlTag}" class="d-flex">
                                Order: <s:property value="orderID"/>: <s:property value="dateOrdered"/>
                           </s:a>
                        </li>
                            </s:iterator>
                        
                     </ul>
                  </aside>
                  <aside class="single_sidebar_widget post_category_widget">
                     <h4 class="widget_title">Past orders</h4>
                     <ul class="list cat-list">
                        
                         <s:iterator var="orderItem" value="orders" status="groupStatus">
                        <li>
                            <s:url action="UserPage" id="urlTag">
                                <s:param name="chosenOrderID"><s:property value="orderID"/></s:param>
                            </s:url>
                           <s:a href="%{urlTag}" class="d-flex">
                                Order: <s:property value="orderID"/>: <s:property value="dateOrdered"/>
                           </s:a>
                        </li>
                            </s:iterator>
                        
                     </ul>
                  </aside>
                 
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--================ Blog Area end =================-->

    <!-- footer_start -->
    
     <!-- footer_end -->

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

</body>

</html>
