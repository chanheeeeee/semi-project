<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp" %>

    <!-- Modal -->
    <div class="modal fade bg-white" id="templatemo_search" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="w-100 pt-1 mb-5 text-right">
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="" method="get" class="modal-content modal-body border-0 p-0">
                <div class="input-group mb-2">
                    <input type="text" class="form-control" id="inputModalSearch" name="q" placeholder="Search ...">
                    <button type="submit" class="input-group-text bg-success text-light">
                        <i class="fa fa-fw fa-search text-white"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>



    <!-- Start Banner Hero -->
    <div id="template-mo-zay-hero-carousel" class="carousel slide" data-bs-ride="carousel">
        <ol class="carousel-indicators">
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="0" class="active"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="1"></li>
            <li data-bs-target="#template-mo-zay-hero-carousel" data-bs-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/images/ad2.png" alt="" width="100%">
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/images/ad1.png" alt="" width="100%">
                        </div>
                    </div>
                </div>
            </div>
            <div class="carousel-item">
                <div class="container">
                    <div class="row p-5">
                        <div class="mx-auto col-md-8 col-lg-6 order-lg-last">
                            <img class="img-fluid" src="<%=request.getContextPath()%>/images/ad3.png" alt="" width="100%">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a class="carousel-control-prev text-decoration-none w-auto ps-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="prev">
            <i class="fas fa-chevron-left"></i>
        </a>
        <a class="carousel-control-next text-decoration-none w-auto pe-3" href="#template-mo-zay-hero-carousel" role="button" data-bs-slide="next">
            <i class="fas fa-chevron-right"></i>
        </a>
    </div>
    <!-- End Banner Hero -->


    <!-- Start Categories of The Month -->
    <section class="container py-5">
        <div class="row text-center pt-3">
            <div class="col-lg-6 m-auto">
                <h1 class="h1">No pain, No gain</h1>
                <p>
                    "중요한 것은 꺾이지 않는 마음"<br>
                    "어떻게 운동을 해야 할지 고민이라면,
                    운동행에서 <b>동행</b>을 시작하세요!"
                </p>
            </div>
        </div>
        <div class="row">
           
        </div>
    </section>
    <!-- End Categories of The Month -->


    <!-- Start Featured Product -->
    <section class="bg-light">
        <div class="container py-5">
            <div class="row text-center py-3">
                <div class="col-lg-6 m-auto">
                    <h1 class="h1">Together, Do Gather</h1>
                    <p>
                        "혼자 하는 운동은 이제 STOP!"<br>
                        "운동 종류, 운동 날짜, 운동 장소까지
                        나에게 맞는 맞춤<br> 동행을 만나 보세요."
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="<%=request.getContextPath()%>/images/main1.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">ALWAYS WITH YOU</a>
                            <p class="card-text"><br>
                                함께해요 동행,<br>
                                운동해요 동행,<br>
                                즐겨봐요 동행.
                            </p>
                            
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="<%=request.getContextPath()%>/images/main3.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">HEY, JOIN</a>
                            <p class="card-text"><br>
                          
                            일어나요<br>씻어요<br>옷 입어요<br>나와요<br>함께해요 동행
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4 mb-4">
                    <div class="card h-100">
                        <a href="shop-single.html">
                            <img src="<%=request.getContextPath()%>/images/main4.jpg" class="card-img-top" alt="...">
                        </a>
                        <div class="card-body">
                            <a href="shop-single.html" class="h2 text-decoration-none text-dark">START CHALLENGE</a>
                            <p class="card-text"><br>
                                      커피가 다 인 것 같죠?<br> 
                                궁금하면 챌린지 성공해 ^^
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Product -->
    
    
<%@ include file="/views/common/footer.jsp" %>

    