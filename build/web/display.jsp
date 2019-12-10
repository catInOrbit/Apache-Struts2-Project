
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html class="no-js" lang="zxx">

    <style>
        .card-horizontal {
            display: flex;
            flex: 1 1 auto;

        }
    </style>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Display Page</title>
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

        <script src="jsProject/OrderScript.js"></script>

        <style>

        </style>
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
                                            <a href="UserPage" class="boxed-btn">View orders</a>

                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-block">
                                <div class="get_in_tauch">

                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <s:if test="%{#request.ERROR_ORDER != null}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Error!</strong> <s:property value="#request.ERROR_ORDER"/>
                </div>
            </s:if>

            <s:if test="%{#request.ORDER_SUCCESS != null}">
                <div class="alert alert-warning  alert-dismissible fade show" role="alert">
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    <strong>Success!</strong> <s:property value="#request.ORDER_SUCCESS"/>
                </div>
            </s:if>
        </header>
        <!-- header-end -->

        <!-- slider_area_start -->

        <h2><s:property value="message"/></h2>




        <div class="container ">
            <b> Weekly menu </b>
            <br/>

            <ul>
                <div class="progress-table-wrap">
                    <div class="progress-table">
                        <table class="table">
                            <thead class="thead-dark">
                                <tr>
                                    <th>Weekday</th>
                                    <th>Main Disk 1</th>
                                    <th>Main Disk 2</th>
                                    <th>Side Disk</th>
                                </tr>
                            </thead>
                            <tbody>

                                <s:iterator begin="2" end="6" var="weekDayLoop">
                                    <tr>
                                        <td><h4><s:property value="#weekDayLoop"/><h4></td>
                                        <s:iterator value="menuModel" status="groupStatus" var="currentElement">
                                            <%--<s:property value="dayInWeek"/>--%>

                                            <s:if test="#weekDayLoop==dayInWeek">
                                                <td>
                                                    <s:iterator value="#currentElement.menuFoodList" var="currentDTO">
                                                        <s:if test="%{isMain==true && isAvailable==true}">
                                                            <s:property value="name"/>
                                                        </s:if>
                                                        <br/>
                                                    </s:iterator>
                                                </td>

                                                <td>
                                                    <s:iterator value="#currentElement.menuFoodList" var="currentDTO">
                                                        <s:if test="%{isMain2==true && isAvailable==true}">
                                                            <s:property value="name"/>
                                                        </s:if>
                                                        <br/>
                                                    </s:iterator>
                                                </td>

                                                <td>
                                                    <s:iterator value="#currentElement.menuFoodList" var="currentDTO">
                                                        <s:if test="%{isSide==true && isAvailable==true}">
                                                            <s:property value="name"/>
                                                        </s:if>
                                                        <br/>
                                                    </s:iterator>
                                                </td>
                                            </s:if>

                                        </s:iterator>
                                    </tr>
                                </s:iterator>
                            </tbody>
                        </table>
                    </div>
                </div>



            </ul>



            <br/>
            <s:form action="Order" method="POST" id="Form0">
                <h3>Combo content: <s:property value="todayMenu.name"/></h3> 

                <br/>


                <s:iterator value="todayMenu.comboFoodList" status="groupStatus" var="currentMenu">
                    <s:if test="key!=null">
                        <div class="card">
                            <!--                         <img class="card-img-top" src="img/banner/details_banner.png" alt="Card image cap">-->


                            <div class="card-body"> 
                                <br/>
                                <input type="checkbox" name="comboDisk" value=" <s:property value="key"/>">
                                <s:set var="currentComboID" value="key"/>


                                <span>
                                    <s:property value="#currentComboID"/> 
                                </span>

                                <span>
                                    <s:iterator var="menu" value="menuModel">
                                        <s:iterator var="priceMap" value="#menu.comboPrice">
                                            <s:if test="key==#currentComboID">
                                                <b> <s:property value="value"/> VND</b> 
                                            </s:if>
                                        </s:iterator>
                                    </s:iterator>
                                </span> 

                                <br/>

                                <s:iterator value="%{#currentMenu.value}" status="groupStatus" var="currentFoodList">
                                    <s:property value="name"/> <br/>
                                </s:iterator>

                            </div>
                        </div>
                    </s:if>

                    <br/>
                </s:iterator>





                <h3>  Main Disk 1 </h3>

                <s:iterator value="todayMenu.menuFoodList" status="groupStatus" var="currentMenu">
                    <br/>
                    <s:if test="isMain==true">

                        <div class="container">
                            <div class="row">
                                <div class="col-8 mt-3">
                                    <div class="card">
                                        <div class="card-horizontal">
                                            <div class="img-square-wrapper">
                                                <img class="" src="<s:property value="imageLink"/>" alt="Card image cap">
                                            </div>
                                            <div class="card-body">

                                                <input type="checkbox"  name="mainDisk1" value="<s:property value="id"/>"> <s:property value="name"/> - <b><s:property value="price"/> VND</b>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </s:if>



                </s:iterator>

                <br/>
                <h3>  Main Disk 2 </h3>

                <s:iterator value="todayMenu.menuFoodList" status="groupStatus" var="currentMenu">
                    <br/>



                    <s:if test="isMain2==true">

                        <div class="container">
                            <div class="row">
                                <div class="col-8 mt-3">
                                    <div class="card">
                                        <div class="card-horizontal">
                                            <div class="img-square-wrapper">
                                                <img class="" src="<s:property value="imageLink"/>" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <input type="checkbox"  name="mainDisk2"  value="<s:property value="id"/>"> <s:property value="name"/> - <b><s:property value="price"/> VND</b>
                                            </div>
                                        </div>
                                        <div class="card-footer">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </s:if>
                </s:iterator>
                <br/>

                <h3>  Side Disk </h3>
                <s:iterator value="todayMenu.menuFoodList" status="groupStatus" var="currentMenu">
                    <br/>

                    <s:if test="isSide==true">

                        <div class="container">
                            <div class="row">
                                <div class="col-8 mt-3">
                                    <div class="card">
                                        <div class="card-horizontal">
                                            <div class="img-square-wrapper">
                                                <img class="" src="<s:property value="imageLink"/>" alt="Card image cap">
                                            </div>
                                            <div class="card-body">
                                                <input type="checkbox"  name="sideDisk"  value="<s:property value="id"/>"> <s:property value="name"/> - <b><s:property value="price"/> VND</b>

                                            </div>
                                        </div>
                                        <div class="card-footer">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </s:if>

                </s:iterator>

                <s:textfield type="hidden" id="SendParamFood"/>
                <s:textfield type="hidden" id="SendParamCombo"/>


                <s:url id="Order" action="OrderAction">
                    <s:param name="orderContent" value="%{#SendParamFood}"></s:param>
                    <s:param name="comboContent" value="%{#SendParamCombo}"></s:param>

                </s:url>

                <s:submit  value="Submit" action="%{Order}" onclick="GetAllSelectedCheckbox()"/>

            </s:form>
        </div>


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
