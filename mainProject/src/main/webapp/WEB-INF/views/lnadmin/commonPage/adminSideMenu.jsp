<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

 <!-- ============================================================== -->
    <!-- main wrapper -->
    <!-- ============================================================== -->
    <div class="dashboard-main-wrapper">
        <!-- ============================================================== -->
        <!-- navbar -->
        <!-- ============================================================== -->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="adminIndex.do">LearningMan 관리page</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item">
                    	</li>
 
                 
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><img src="resources/admin/assets/images/ava.jpeg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <div class="nav-user-info">
                                    <h5 class="mb-0 text-white nav-user-name">${vo.id } </h5>
                                   
                                </div>
                               	<c:if test="${vo.id != null}">
                                	<a class="dropdown-item" href="adminLogout.do"><i class="fas fa-power-off mr-2"></i>Logout</a>
                                </c:if>
                                <c:if test="${vo.id == null}">
                                	<a class="dropdown-item" href="adminLogin.go"><i class="fas fa-power-off mr-2"></i>Login</a>
                                </c:if>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>

        <!-- ============================================================== -->
        <!-- left sidebar -->
        <!-- ============================================================== -->
<div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">MENU</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">
                            
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-1" aria-controls="submenu-1"><i class="fa fa-fw fa-user-circle"></i>관리자관리</a>
                                <div id="submenu-1" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                     					<li class="nav-item">
                                        	<a class="nav-link" href="adminModify.do">&nbsp;&nbsp;&nbsp;관리자 목록</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="adminRegister.go">&nbsp;&nbsp;&nbsp;관리자 추가등록</a>
                                        </li>
                                     </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-2" aria-controls="submenu-2"><i class="fas fa-address-card"></i>회원 관리</a>
                                <div id="submenu-2" class="collapse submenu" style="">
                                    <ul class="nav flex-column">

                                        <li class="nav-item">
                                            <a class="nav-link" href="memberModify.do">&nbsp;&nbsp;&nbsp;회원정보수정</a>
                                        </li>
                                       
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-3" aria-controls="submenu-3"><i class="fas fa-book"></i>약관관리</a>
                                <div id="submenu-3" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
										<li class="nav-item">
                                    		<a class="nav-link" href="adminTermsWriteForm.go">&nbsp;&nbsp;&nbsp;약관등록</a>
                                            <a class="nav-link" href="adminTermsList.do">&nbsp;&nbsp;&nbsp;등록약관수정</a>
                                        </li>

                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6" aria-controls="submenu-6"><i class="fas fa-tablet-alt"></i>화면관리</a>
                                <div id="submenu-6" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
										<li class="nav-item">
                                        	<a class="nav-link" href="categoryList.do">&nbsp;&nbsp;&nbsp;카테고리 등록/수정</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-6-2" aria-controls="submenu-6-2">&nbsp;&nbsp;&nbsp;화면이미지 관리</a>
                                            <div id="submenu-6-2" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
													<li class="nav-item">
                                                        <a class="nav-link" href="mainImgUpload.go">&nbsp;&nbsp;&nbsp;메인화면 사진수정</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="newImgUpload.go">&nbsp;&nbsp;&nbsp;신규화면 사진수정</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="teacherImgUpload.go">&nbsp;&nbsp;&nbsp;강사화면 사진수정</a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-4" aria-controls="submenu-4"><i class="fas fa-th-list"></i>게시판관리</a>
                                <div id="submenu-4" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="adminNoticeBoard.do">&nbsp;&nbsp;&nbsp;공지게시판</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="adminQnaBoard.do">&nbsp;&nbsp;&nbsp;Q&A게시판</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="adminFaqBoard.do">&nbsp;&nbsp;&nbsp;FAQ게시판</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="classBoard.do">&nbsp;&nbsp;&nbsp;강의실게시판</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="videoBoard.do">&nbsp;&nbsp;&nbsp;동영상게시판</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-7" aria-controls="submenu-7"><i class="fas fa-dollar-sign"></i>결제/포인트 관리</a>
                                <div id="submenu-7" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="memberTradeList.go">&nbsp;&nbsp;&nbsp;회원 강의결제내역</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="memberPayList.go">&nbsp;&nbsp;&nbsp;회원 포인트 충전내역</a>
                                        </li>
									</ul>
                                </div>
                            </li>
                             <li class="nav-item">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5" aria-controls="submenu-5"><i class="fas fa-tablet-alt"></i>통계관리</a>
                                <div id="submenu-5" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
										<li class="nav-item">
                                        	<a class="nav-link" href="memberChart.do">&nbsp;&nbsp;&nbsp;회원 통계</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5-2" aria-controls="submenu-5-2">&nbsp;&nbsp;&nbsp;매출 통계</a>
                                            <div id="submenu-5-2" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
													<li class="nav-item">
                                                        <a class="nav-link" href="salesChart.go">&nbsp;&nbsp;&nbsp;총 매출 관련</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="categoryChart.go">&nbsp;&nbsp;&nbsp;카테고리관련</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="lessonChart.go">&nbsp;&nbsp;&nbsp;유료강의관련</a>
                                                    </li>
                                       
                                                </ul>
                                            </div>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-5-3" aria-controls="submenu-5-3">&nbsp;&nbsp;&nbsp;게시글 통계</a>
                                            <div id="submenu-5-3" class="collapse submenu" style="">
                                                <ul class="nav flex-column">
													<li class="nav-item">
                                                        <a class="nav-link" href="recoReplyChart.go">&nbsp;&nbsp;&nbsp;추천/댓글 관련</a>
                                                    </li>
                                                    <li class="nav-item">
                                                        <a class="nav-link" href="qnaChart.go">&nbsp;&nbsp;&nbsp;Q&A관련</a>
                                                    </li>
                                       
                                                </ul>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#" data-toggle="collapse" aria-expanded="false" data-target="#submenu-8" aria-controls="submenu-8"><i class="fas fa-comments"></i>실시간상담채팅</a>
                                <div id="submenu-8" class="collapse submenu" style="">
                                    <ul class="nav flex-column">
                                        <li class="nav-item">
                                            <a class="nav-link" href="chatSituation.go">&nbsp;&nbsp;&nbsp;채팅</a>
                                        </li>
									</ul>
                                </div>
                            </li>
                          </ul>
                    </div>
                </nav>
            </div>
        </div>
       
      
