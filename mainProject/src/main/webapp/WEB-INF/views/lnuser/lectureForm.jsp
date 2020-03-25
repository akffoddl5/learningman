<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/css/tagsinput.css">
<!DOCTYPE html>
<html lang="en">

<head>
<title>다배워 ! LearningMan &mdash;</title>

<%@ include file="metaHeader.jsp" %>
</head>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- 에디터 -->
<script src="http://cdn.ckeditor.com/4.13.1/standard-all/ckeditor.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/ckeditor/ckeditor.js"></script>
	<script>
	$(document).ready(function(){
		 $("#priceBtn2").hide();

		
	});
	</script>
<script>
function submitForm(){
	var introLecture = CKEDITOR.instances.contents.getData();
	var introTeacher = CKEDITOR.instances.contents1.getData();
	var introCurri = CKEDITOR.instances.contents2.getData();
	
	//$("#kys").text(introLecture);
	document.getElementById("hidden1").value = introLecture;
	document.getElementById("hidden2").value = introTeacher;
	document.getElementById("hidden3").value = introCurri;
	
	
	
	var form = document.makeLecture;
	form.submit();
	//$("#makeLecture").submit();
}
</script>


<!-- 이미지 미리보기 -->
<script type="text/javascript">
function previewImage(targetObj, View_area) {
	var preview = document.getElementById(View_area); //div id
	var ua = window.navigator.userAgent;	

  //ie일때(IE8 이하에서만 작동)
	if (ua.indexOf("MSIE") > -1) {
		targetObj.select();
		try {
			var src = document.selection.createRange().text; // get file full path(IE9, IE10에서 사용 불가)
			var ie_preview_error = document.getElementById("ie_preview_error_" + View_area);


			if (ie_preview_error) {
				preview.removeChild(ie_preview_error); //error가 있으면 delete
			}

			var img = document.getElementById(View_area); //이미지가 뿌려질 곳

			//이미지 로딩, sizingMethod는 div에 맞춰서 사이즈를 자동조절 하는 역할
			img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src='"+src+"', sizingMethod='scale')";
		} catch (e) {
			if (!document.getElementById("ie_preview_error_" + View_area)) {
				var info = document.createElement("<p>");
				info.id = "ie_preview_error_" + View_area;
				info.innerHTML = e.name;
				preview.insertBefore(info, null);
			}
		}
  //ie가 아닐때(크롬, 사파리, FF)
	} else {
		var files = targetObj.files;
		for ( var i = 0; i < files.length; i++) {
			var file = files[i];
			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
			if (!file.type.match(imageType))
				continue;
			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
			if (prevImg) {
				preview.removeChild(prevImg);
			}
			var img = document.createElement("img"); 
			img.id = "prev_" + View_area;
			img.classList.add("obj");
			img.file = file;
			img.style.width = '800px'; 
			img.style.height = '500px';
			preview.appendChild(img);
			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
				var reader = new FileReader();
				reader.onloadend = (function(aImg) {
					return function(e) {
						aImg.src = e.target.result;
					};
				})(img);
				reader.readAsDataURL(file);
			} else { // safari is not supported FileReader
				//alert('not supported FileReader');
				if (!document.getElementById("sfr_preview_error_"
						+ View_area)) {
					var info = document.createElement("p");
					info.id = "sfr_preview_error_" + View_area;
					info.innerHTML = "not supported FileReader";
					preview.insertBefore(info, null);
				}
			}
		}
	}
}
</script>
<script type="text/javascript">
function freeBtn(){
	 $("#priceBtn1").toggle();
	 $("#priceBtn2").toggle();
	 
	 var pp1 = document.getElementById("isFree").value;
	 if(pp1 == "Y"){
		 document.getElementById("isFree").value = "N";
	 }else if(pp1 == "N"){
		 document.getElementById("isFree").value = "Y";
	 }
	//$("#priceBtn").disabled;
}
</script>

<body>

<style>
<!--
h6{
font-weight: bold;
color: rgb(62, 64, 66);
}
.card{
padding: 24px;
width: 100%;
}

-->
</style>
<%@ include file="header2.jsp"%>
<div class="site-wrap">
			<form id="makeLecture" name="makeLecture" method="post" enctype="multipart/form-data" action="makeLecture.do">
			

					<!-- 강의 사진 올리기 -->
				
					<div class="container">
						<div class="card">
							<div class="my-2">
						<h5 class="icon-collections_bookmark text-center" data-aos="fade-up" style="color: rgb(62, 64, 66); font-size:24px; font-weight: bold;">&nbsp;강의 올리기</h5>
								</div>
							<div class="card-body">
								<div class="row">
									<div class="text-left my-2">
										<h6>커버 이미지를 선택 해주세요.</h6>
									</div>
									<br>
								</div>

								<div id='View_area' align="center"></div>
									<div class="row">
										<div class="text-left my-2">
											<input type="file" style="padding: 0;" name="profile_pt" id="profile_pt" onchange="previewImage(this,'View_area')">
										</div>
									</div>
										<div class="row my-2">
											<small><p class="text-danger text-right">900x500 사이즈로 올라갑니다.</p></small>
										</div>

					<!-- 간단한 강의 소개 -->
<div class="row" style="place-content: center;">
<div class="col-4">
								<div class="row">
									<div class="text-left my-2">
										<h6>강의 제목을 입력 해주세요.</h6>
									</div>
								</div>
									<div class="row my-2">
										<input name ="right_info" type="text" style="width: 80%;" class="form-control" placeholder="제목은 최대 15자 입니다" maxlength="15">
									</div>
</div>
<div class="col-4">								
							<div class="row" style="padding-left: 50;">
								<div class="group my-2">
									<label for="c_country" class="text-block"><h6>카테고리 선택</h6></label>
									 <select id="c_country" class="form-control" name="c_country">
									 	<c:forEach items="${categoryList}" var="categoryVO">
										<option value="${categoryVO.name }">${categoryVO.name }</option>
									 	</c:forEach>
									</select>
								</div>
							</div>
</div>
							<div class="col-4">
							<div class="row">
								<div class="text-left my-2">
									<h6>가격을 입력해주세요.</h6>
								</div>
								
							</div>
						<div id="priceBtn1">
							<div class="row">
							<input type="text" style="width: 60%;" name="price1" class="form-control" id="priceText" maxlength="15"><span style="font-weight: bold; font-size: 16px;">&nbsp;원</span>
							</div>
							<div class="row my-2">
							<input type="button"  class="btn btn-sm btn-primary" onclick="freeBtn()" value="무료로 강의하기">
							</div>
							</div>
							<div id="priceBtn2">
							<div class="row">
							<input type="text" style="width: 60%;" disabled="disabled" name="price2" class="form-control" maxlength="15"><span style="font-weight: bold; font-size: 16px;">&nbsp;원</span>
							</div>
							<div class="row my-2">
							<input type="button" class="btn btn-sm btn-primary" id="freeBtn2" onclick="freeBtn()" value="유료로 강의하기">
							</div>
							<input type="hidden" id="isFree" name="isFree" value="N">
							</div>
			</div>
</div>							

						
					

					<!-- 강의 소개 -->
<br>
										<div class="row my-2">
											<small><p class="text-danger text-right">모든 사진의 너비는 최대 900px 이하로 설정해주세요.</p></small>
										</div>
								<div class="row">
									<div class="text-left my-2">
										<h6>강의에 대해 소개 해주세요.</h6>
									</div>
								</div>
								<br>
									<div class="row">
										<textarea  id="contents" class="ckeditor" name="contents"></textarea>
										<script type="text/javascript">
												CKEDITOR.replace('contents',{
													width :'100%',
													filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
												});
										</script>
									</div>
									<br>

								<input type="hidden" id="hidden1" name="hidden1" >

					<br>
					<!-- 커리큘럼 소개 -->

								<div class="row">
									<div class="text-left my-2">
										<h6>커리큘럼을 작성 해주세요.</h6>
									</div>
								</div>
								<br>
									<div class="row">
										<textarea id="contents1" class="ckeditor" name="contents1"></textarea>
										<script type="text/javascript">
												CKEDITOR.replace('contents1',{
													width :'100%',
													filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
												});
										</script>
									</div>
									<br>

								<input type="hidden" id="hidden2" name="hidden2">

					<br>
					<!-- 자기 소개 -->

								<div class="row">
									<div class="text-left my-2">
										<h6>본인 소개를 해주세요.</h6>
									</div>
								</div>
								<br>
									<div class="row">
										<textarea id="contents2" class="ckeditor" name="contents2"></textarea>
										<script type="text/javascript">
												CKEDITOR.replace('contents2',{
													width :'100%',
													filebrowserUploadUrl: '${pageContext.request.contextPath }/adm/fileupload.do'
												});
										</script>
									</div>
									<br>

								<input type="hidden" id="hidden3" name="hidden3">
									<div align="center">
										<input type="button" class="btn btn-sm btn-primary" value="작성완료" onclick="submitForm()"> 
										<input type="button" class="btn btn-sm btn-primary" value="취소" onclick="window.location='myPage.do'">
									</div>
					</div>
				</div>
				<br>
			</div> <!-- container end -->
		</form> <!--  원래 폼자리 -->
			<!-- lectureForm UI end -->
			<!-- ------------------------------------------------------------------- -->
  <script src="resources/js/package.json"></script>
  <script src="resources/js/aos.js"></script>
	</div> <!-- site wrap -->
		<%@ include file="footer.jsp"%>
	</body>
</html>