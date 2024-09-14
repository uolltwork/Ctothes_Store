<%-- 
    Document   : Silder
    Created on : Oct 17, 2022, 10:09:22 PM
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="./bootstrap/css/bootstrap.min.css"/>
        <link
            rel="stylesheet"
            href="./assert/font/fontawesome-free-6.1.1-web/css/all.min.css"
            />
        <link rel="stylesheet" href="./assert/css/style.css" />
        <title>JSP Page</title>
        <style>
            *{
                font-family: monospace;
            }
            
            .slider-large {
                margin: 42px 0px;
            }

            .carousel-caption {
                margin-bottom: 36%;
            }

            .slider-large-caption {
                margin-bottom: 22%;
            }
            .slider-large-caption a {
                font-family: monospace;
                font-size: 64px;
                text-decoration: none;
                font-weight: bold;
                color: white;
            }

            .slider-large-caption p {
                font-size: 20px;
                font-family: monospace;
            }

            .carousel-caption-titel {
                font-size: 22px;
                text-decoration: none;
                font-weight: bold;
                color: aliceblue;
                font-family: monospace;
            }

            .slider-medium .row {
                display: flex;
                justify-content: center;
            }

            .carousel-item img:hover {
                opacity: 0.7;
                cursor: pointer;
            }

            .carousel-caption-titel:hover {
                color: #999;
            }

            .slider-medium {
                margin-bottom: 56px;
            }
            .slider-medium-heading {
                text-align: center;
                font-size: 46px;
                font-family: monospace;
                margin-top: 12px;
            }
            
            .sep {
                
            }
        </style>
    </head>
    <body>

        <!-- 1. Navigation -->
        <jsp:include page="Navigation.jsp"></jsp:include>
        <jsp:include page="Logo.jsp"></jsp:include>

            <!-- 2. Slider-->
            <div class="container-fluid slider-large">
                <div class="row">
                    <div class="col col-xs-12">
                        <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="false">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active"
                                        aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                                        aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                                        aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item ">
                                    <img src="https://theme.hstatic.net/1000306633/1000891824/14/slideshow_1.jpg?v=160" class="d-block w-100"
                                         alt="...">
                                    <div class="slider-large-caption carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">BUY PRODUCTS</a>
                                        <p>This's the fashionable style for this season. NowSaiGon where you are the best style!</p>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img
                                        src="https://theme.hstatic.net/1000306633/1000891824/14/show_block_home_category_image_3_new.png?v=160"
                                        class="d-block w-100" alt="...">
                                    <div class="slider-large-caption carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">BUY PRODUCTS</a>
                                        <p>This's the fashionable style for this season. NowSaiGon where you are the best style!</p>
                                    </div>
                                </div>
                                <div class="carousel-item active">
                                    <img src="https://theme.hstatic.net/1000306633/1000891824/14/slideshow_2.jpg?v=160" class="d-block w-100"
                                         alt="...">
                                    <div class="slider-large-caption carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">BUY PRODUCTS</a>
                                        <p>This's the fashionable style for this season. NowSaiGon where you are the best style!</p>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
                                    data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
                                    data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="container slider-medium">
                <div class="row">
                    <div class="col-xs-12">
                        <h4 class="slider-medium-heading">NEW TRIVIAL ITEMS</h4>
                        <div class="sep"></div>
                    </div>
                </div>
                <div class="row">
                    <div class="col col-xs-12 col-md-6">
                        <div id="slider-medium-1" class="carousel slide" data-bs-ride="false">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#slider-medium-1" data-bs-slide-to="0" class="active"
                                        aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#slider-medium-1" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#slider-medium-1" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img
                                        src="https://scontent.fvca1-1.fna.fbcdn.net/v/t39.30808-6/307867377_3189489401305657_1030631953630098886_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=a26aad&_nc_ohc=ZBH_kp8oZdoAX991R-q&_nc_ht=scontent.fvca1-1.fna&oh=00_AT-CpVJrww6CPCTcIShEkyae15JiQ76754n-g5Q_5CJXwA&oe=6351657C"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">UP COMING PRODUCTS</a>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img
                                        src="https://scontent.fvca1-1.fna.fbcdn.net/v/t39.30808-6/307866580_3189489397972324_7529617156980916218_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a26aad&_nc_ohc=jDef-TtYTzcAX8nUsl2&_nc_ht=scontent.fvca1-1.fna&oh=00_AT80VjhLz5hLDGKQKsneLitbwtRxTU3hukpa1ezjml7_yQ&oe=635164D8"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">UP COMING PRODUCTS</a>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img
                                        src="https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/307849279_3189489394638991_8134893015229026969_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a26aad&_nc_ohc=wjk0ojSfjB4AX93nZtD&_nc_ht=scontent.fvca1-3.fna&oh=00_AT_Lp99DZLZ1XHS1u1hUNseDdvmdepaFiIP6jZob9PdKpg&oe=6351B4D1"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">UP COMING PRODUCTS</a>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#slider-medium-1" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#slider-medium-1" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                    <div class="col col-xs-12 col-md-6">
                        <div id="slider-medium-2" class="carousel slide" data-bs-ride="false">
                            <div class="carousel-indicators">
                                <button type="button" data-bs-target="#slider-medium-2" data-bs-slide-to="0" class="active"
                                        aria-current="true" aria-label="Slide 1"></button>
                                <button type="button" data-bs-target="#slider-medium-2" data-bs-slide-to="1" aria-label="Slide 2"></button>
                                <button type="button" data-bs-target="#slider-medium-2" data-bs-slide-to="2" aria-label="Slide 3"></button>
                            </div>
                            <div class="carousel-inner">
                                <div class="carousel-item ">
                                    <img
                                        src="https://scontent.fvca1-1.fna.fbcdn.net/v/t39.30808-6/292187074_3134217423499522_4289049464774224587_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=a26aad&_nc_ohc=UyXQxupRISsAX_led1l&_nc_ht=scontent.fvca1-1.fna&oh=00_AT8ICndhKaqmXguI28voOk8vz9ExMOnmxt0irWToaVgGjg&oe=6352E291"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">UP COMING PRODUCTS</a>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img
                                        src="https://scontent.fvca1-4.fna.fbcdn.net/v/t39.30808-6/292248659_3134217420166189_5968089115643514324_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=a26aad&_nc_ohc=ZxjET5V1zoYAX8n5OLz&_nc_ht=scontent.fvca1-4.fna&oh=00_AT_rD1lmt9mj-Lj7Ov31jBlIrx0U7imJz6JU7hm9BOU81A&oe=6352E95E"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="" class="carousel-caption-titel">UP COMING PRODUCTS</a>
                                    </div>
                                </div>
                                <div class="carousel-item active">
                                    <img
                                        src="https://scontent.fvca1-3.fna.fbcdn.net/v/t39.30808-6/292671723_3134217416832856_5835353647282757655_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=a26aad&_nc_ohc=yjJYwZBCXa4AX9LtoXl&_nc_ht=scontent.fvca1-3.fna&oh=00_AT-mLSnDNfidR1xp1wQHHAJ3egvkrl0c2eG-QpJtCX42qA&oe=635300D0"
                                        class="d-block w-100" alt="...">
                                    <div class="carousel-caption d-none d-md-block">
                                        <a href="home" class="carousel-caption-titel">UP COMING PRODUCTS</a>
                                    </div>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#slider-medium-2" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#slider-medium-2" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="./bootstrap/js/bootstrap.js"></script>
    </body>
</html>
