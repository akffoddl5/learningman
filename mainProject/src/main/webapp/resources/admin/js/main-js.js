
jQuery(document).ready(function($) {
    'use strict';

    // ============================================================== 
    // Notification list
    // ============================================================== 
    if ($(".notification-list").length) {

        $('.notification-list').slimScroll({
            height: '250px'
        });

    }

    // ============================================================== 
    // Menu Slim Scroll List
    // ============================================================== 


    if ($(".menu-list").length) {
        $('.menu-list').slimScroll({

        });
    }

    // ============================================================== 
    // Sidebar scrollnavigation 
    // ============================================================== 

    if ($(".sidebar-nav-fixed a").length) {
        $('.sidebar-nav-fixed a')
            // Remove links that don't actually link to anything

            .click(function(event) {
                // On-page links
                if (
                    location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') &&
                    location.hostname == this.hostname
                ) {
                    // Figure out element to scroll to
                    var target = $(this.hash);
                    target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                    // Does a scroll target exist?
                    if (target.length) {
                        // Only prevent default if animation is actually gonna happen
                        event.preventDefault();
                        $('html, body').animate({
                            scrollTop: target.offset().top - 90
                        }, 1000, function() {
                            // Callback after animation
                            // Must change focus!
                            var $target = $(target);
                            $target.focus();
                            if ($target.is(":focus")) { // Checking if the target was focused
                                return false;
                            } else {
                                $target.attr('tabindex', '-1'); // Adding tabindex for elements not focusable
                                $target.focus(); // Set focus again
                            };
                        });
                    }
                };
                $('.sidebar-nav-fixed a').each(function() {
                    $(this).removeClass('active');
                })
                $(this).addClass('active');
            });

    }

    // ============================================================== 
    // tooltip
    // ============================================================== 
    if ($('[data-toggle="tooltip"]').length) {
            
            $('[data-toggle="tooltip"]').tooltip()

        }

     // ============================================================== 
    // popover
    // ============================================================== 
       if ($('[data-toggle="popover"]').length) {
            $('[data-toggle="popover"]').popover()

    }
     // ============================================================== 
    // Chat List Slim Scroll
    // ============================================================== 
        

        if ($('.chat-list').length) {
            $('.chat-list').slimScroll({
            color: 'false',
            width: '100%'


        });
    }
        
 

    // ============================================================== 
    // dropzone script
    // ============================================================== 

 //     if ($('.dz-clickable').length) {
 //            $(".dz-clickable").dropzone({ url: "/file/post" });
 // }

}); // AND OF JQUERY

// $(function() {
//     "use strict";


    

   // var monkeyList = new List('test-list', {
    //    valueNames: ['name']

     // });
  // var monkeyList = new List('test-list-2', {
    //    valueNames: ['name']

   // });



   
   

// });

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//check all
	function checkAll(){
  	if( $("#th_checkAll").is(':checked') ){
    		$("input[name=checkRow]").prop("checked", true);
  	}else{
    		$("input[name=checkRow]").prop("checked", false);
  	}
		}
	
//delete 	
	//terms
	function delete1(){
	 	
		var deleteTermsArray = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	        	deleteTermsArray.push($(this).val());
	        }
	   });
	    
	    var query = {deleteTermsList: deleteTermsArray};
	    $.ajax({
	            type: "POST",
	            url: "termsDelete.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	            	location.reload();
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}
	
	//usermember
	function delete2(){
	 	
		var deleteUserMemberArray = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	              deleteUserMemberArray.push($(this).val());
	        }
	   });
	    
	    var query = {deleteUserMemberList: deleteUserMemberArray};
	    $.ajax({
	            type: "POST",
	            url: "userMemberDelete.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	            	location.reload();
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}
	//class
	function updateClassBtn(){

		var updateClassArray = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	        	updateClassArray.push($(this).val());
	        }
	   });
	    
	    var query = {updateClassList: updateClassArray};
	    $.ajax({
	            type: "POST",
	            url: "updateClassBoard.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	                location.href="classBoard.do";
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}	
	
	//faq
	function deleteFaqBtn(){

		var deleteFaqArray = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	              deleteFaqArray.push($(this).val());
	        }
	   });
	    
	    var query = {deleteFaqList: deleteFaqArray};
	    $.ajax({
	            type: "POST",
	            url: "deleteFaqBoard.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	                location.href="adminFaqBoard.do";
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}	
	
	//notice
	function deleteNotice(){

		var deleteArray = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	              deleteArray.push($(this).val());
	        }
	   });
	    
	    var query = {deleteList: deleteArray};
	    $.ajax({
	            type: "POST",
	            url: "deleteNoticeBoard.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	                location.href="adminNoticeBoard.do";
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}
	
	//answer
	
	function deleteAnswer(){
		var content = document.getElementById("num").value;
		var query = {num : content};
		//alert(query);
		$.ajax({
			type : "POST",
			url : "deleteQnaAnswerBoard.do",
			data : query,
			success : function(data){
				alert("삭제되었습니다.");
				location.href="adminQnaBoard.do";
			}
		});
	}
	
	//Qna
	function deleteQnaBtn(){

		var deleteQnaArray = [];
		var deleteQnaArray2 = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	              deleteQnaArray.push($(this).val());
	        }
	   });
	    
	    var query = {deleteQnaList: deleteQnaArray};
	    $.ajax({
	            type: "POST",
	            url: "deleteQnaBoard.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	                location.href="adminQnaBoard.do";
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}	
	//answer register
	function submitAnswer(){
		var content1 = document.getElementById("answerContent").value;
		var content2 = document.getElementById("answerTitle").value;
		var content3 = document.getElementById("num").value;
		var query = {answer : content1, kkk : content2, ref : content3};
		//alert(query);
		$.ajax({
			type : "POST",
			url : "qnaAnswerContent.do",
			data : query,
			success : function(data){
				//alert("");
				location.href="adminQnaBoard.do";
			}
		});
	}
	
	//video(lesson)
	function updateVideoBtn(){

		var updateVideoArray = [];
	    $('input:checkbox[name="checkRow"]').each(function() {
	        if(this.checked){
	              updateVideoArray.push($(this).val());
	        }
	   });
	    
	    var query = {updateVideoList: updateVideoArray};
	    $.ajax({
	            type: "POST",
	            url: "updateVideoBoard.do",
	            data: query,
	            success: function(data){
	            	alert("삭제되었습니다.");
	                location.href="videoBoard.do";
	            },
	            error:function(request,status,error){
	               },
	             complete : function(data) {
	                         //  실패했어도 완료가 되었을 때 처리
	                }


	     });
	}	