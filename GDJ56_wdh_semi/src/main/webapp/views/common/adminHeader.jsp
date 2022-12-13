<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>:::운동행 - 관리자:::</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="<%=request.getContextPath() %>/css/admin_styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-black">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="admin-main.html">#관리자페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark bg-black" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">HOME</div>
                            <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminMain.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-home-alt"></i></div>
                                메인화면
                            </a>
                            <div class="sb-sidenav-menu-heading">MEMBER</div>
                            <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminMemberList.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                                회원 관리
                            </a>

                            <div class="sb-sidenav-menu-heading">CHALLENGE</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                챌린지 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminChallenge.jsp">챌린지 등록</a>
                                    <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminChallenge_Result.jsp">챌린지 결과</a>
                                </nav>
                            </div>

                            <div class="sb-sidenav-menu-heading">Notice</div>
                            <!-- <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="" aria-expanded="false" aria-controls="collapseLayouts"> -->
                                <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminNotice.jsp">
                                    <div class="sb-nav-link-icon"><i class=""></i></div>
                                공지 관리  
                            </a>

                            <div class="sb-sidenav-menu-heading">Service</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts2" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                고객센터
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminService_Questions.jsp">1대1문의 관리</a>
                                    <a class="nav-link" href="<%=request.getContextPath() %>/views/admin/adminService_Dcl.jsp">신고 관리</a>
                                </nav>
                            </div>
                            
                        </div>
                    </div>
                </nav>
            </div>
            
            
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/js/admin_scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath() %>/js/admin_datatables-simple-demo.js"></script>