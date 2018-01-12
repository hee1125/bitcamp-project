<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>게시판 상세보기</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/css/font-awesome.min.css" />
<!-- text fonts -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/css/fonts.googleapis.com.css" />

<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/resources/assets/css/board.css" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous"></script>
<script
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.css"
	rel="stylesheet" />
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.2/summernote.js"></script>
<!-- Favicon and touch icons -->
<link rel="icon"
	href="${pageContext.servletContext.contextPath}/resources/ico/home_iot.png">
</head>

<body class="subpage">

	<!-- Header -->
	<header id="header">
	<div class="logo">
		<a href="index.html">BIGDATA3 <span>by Donny</span></a>
	</div>
	<a href="#menu">Menu</a> </header>

	<!-- Nav -->
	<nav id="menu">
	<ul class="links">
		<li><a href="index.html">메인</a></li>
		<li><a href="loginmain.html">로그인</a></li>
		<li><a href="mypage.html">마이페이지</a></li>
		<li><a href="store_management.html">매장관리</a></li>
		<li><a href="elements.html">빅데이터</a></li>
		<li><a href="noticeboard.html">게시판</a></li>
		<li><a href="index_admin.html">Admin Only</a></li>
	</ul>
	</nav>

	<div id="sub_wrap">
		<div class="container" style="padding-top: 100px;">
			<h3 class="header" style="color: tomato">게시판 내용 상세보기</h3>
			<form action="insert" class="boardSubmit" method="post"
				enctype="multipart/form-data">
				<div class="input-groups" role="group" aria-label="">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>작성자</th>
								<td><input type="text" class="form-control" name=""
									value="${board.boardWriter}" /></td>
							</tr>
							<tr>
								<th>조회수</th>
								<td><input type="text" class="form-control" name=""
									value="${board.boardHit}" /></td>
							</tr>
							<tr>
								<th>날짜</th>
								<td><input type="text" class="form-control" name=""
									value="${board.createDate}" /></td>
							</tr>
							<%-- <tr>
								<th>댓글수</th>
								<td><input type="text" class="form-control" name=""
									value="${board.boardReplyCount}" /></td>
							</tr> --%>
							<tr>
								<th>글 제목</th>
								<td><input type="text" name="boardSubject"
									class="form-control" value="${board.boardSubject}" /></td>
							</tr>
						</thead>

						<tr>
							<th>글 내용</th>
							<td><textarea class="form-control" id="summernote"
									name="boardContent" placeholder="boardContent" maxlength="140"
									rows="7"></textarea></td>
						</tr>

					</table>
				</div>

				<button type="button" class="btn btn-primary" name="" id="reply"
					onclick="">댓글보기</button>
				<!-- 버튼 클릭시 아래 댓글 인풋 그룹 보여지기 하고싶음-->
				<button type="button" class="btn btn-success" name="" id="update"
					onclick="">수정</button>
				<button type="button" class="btn btn-danger" name="" id="delete"
					onclick="remove()">삭제</button>
				<button type="button" class="btn btn-warning" name="" id="boardMain"
					onclick="">목록으로</button>
				<!-- 클릭시 noticeboard.html의 <div clsss="container" id="main">으로 이동-->

				<hr />

				<!-- 댓글 인풋 그룹. 위의 댓글보기 버튼 누르기 전까지 화면 안보이게 숨기고 싶음... -->
				<div class="input-groups" role="group" id="commentReply">
					<input class="form-control" id="replySubject"
						palceholder="댓글 제목 입력하세요" />
					<textarea class="form-control" id="commentContent"
						placeholder="댓글을 입력하세요"></textarea>
					<button class="btn btn-primary" type="button" name="commentWrite"
						id="commentWrite">댓글등록</button>
					<input type="button" class="btn btn-success" name="commentRead"
						id="commentRead" value="댓글읽기(${board.commentCount})"
						onclick="getComment(1, event)">
					<!-- ()안은 댓글의 개수를 의미. 카운트 처리 필요 -->
				</div>

				<!-- Comment 태그 추가 -->
				<div class="input-group" role="group" aria-label="..."
					style="margin-top: 10px; width: 100%;">
					<div id="showComment" style="text-align: center;"></div>
				</div>
			</form>
		</div>
	</div>

	<!-- Footer -->
	<footer id="footer">
	<div class="copyright">
		<ul class="icons">
			<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
			<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
			<li><a href="#" class="icon fa-instagram"><span
					class="label">Instagram</span></a></li>
			<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
		</ul>
		<p>
			&copy; Untitled. All rights reserved. Design: <a
				href="https://templated.co">TEMPLATED</a>. Images: <a
				href="https://unsplash.com">Unsplash</a>.
		</p>
	</div>
	</footer>

	<script>
		/*    
		$('#boardMain').click(function() { 
		  var result = confirm("게시판 처음화면으로 이동 하시겠습니까?"); 
		    if(result) { 
		      location.href = ""; => noticeboard.html <div clsss="container" id="main">위치로 이동
		    } else { } 
		  });
		 */
	</script>
	<script>
		/* // Perform an asynchronous HTTP (Ajax) request.
		// 비동기 통신 Ajax를 Setting한다.
		$.ajaxSetup({
		    type:"POST",
		    async:true,
		    dataType:"json",
		    error:function(xhr) {
		        console.log("error html = " + xhr.statusText);
		    }
		});
		
		$(function() {
		    $("#commentWrite").on("click", function() {
		        $.ajax({
		            url:"../reply/insert", // => jsp의 url 맟춰줘야함!!
		            // data:{}에서는 EL을 ""로 감싸야 한다. 이외에는 그냥 사용한다.
		            data:{
		            	  subject:$("#replySubject"),
		                commentContent:$("#commentContent").val(),
		                boardNo:"${board.boardNo}"
		            },
		            beforeSend:function() {
		                console.log("시작 전...");
		            },
		            complete:function() {
		                console.log("완료 후...");
		            },
		            success:function(data) {            // 서버에 대한 정상응답이 오면 실행, callback
		                if(data.result == 1) {            // 쿼리 정상 완료, executeUpdate 결과
		                    console.log("comment가 정상적으로 입력되었습니다.");
		                    $("#commentContent").val("");
		                    showHtml(data.comments, 1);
		                }
		            }
		        })
		    });
		});
		
		function showHtml(data, commPageNum) {
		    let html = "<table class='table table-striped table-bordered' style='margin-top: 10px;'><tbody>";
		    $.each(data, function(index, item) {
		        html += "<tr align='center'>";
		        html += "<td>" + (index+1) + "</td>";
		        html += "<td>" + item.id + "</td>";
		        html += "<td align='left'>" + item.commentContent + "</td>";
		        let presentDay = item.commentDate.substring(0, 10);
		        html += "<td>" + presentDay + "</td>";
		        html += "</tr>";
		    });
		    html += "</tbody></table>";
		    commPageNum = parseInt(commPageNum);        // 정수로 변경
		    // commentCount는 동기화되어 값을 받아오기 때문에, 댓글 insert에 즉각적으로 처리되지 못한다.
		    if("${article.commentCount}" > commPageNum * 10) {
		        nextPageNum = commPageNum + 1;
		        html +="<input type='button' class='btn btn-success' onclick='getComment(nextPageNum, event)' value='다음 comment 보기'>";
		    }
		    
		    $("#showComment").html(html);
		    $("#commentContent").val("");
		    $("#commentContent").focus();
		}
		
		function getComment(commPageNum, event) {
		    $.ajax({
		        url:"/board/commentRead.bbs", // => jsp의 url 맟춰줘야함!!
		        data:{
		            commPageNum:commPageNum*10,
		            articleNumber:"${board.boardNumber}"
		        },
		        beforeSend:function() {
		            console.log("읽어오기 시작 전...");
		        },
		        complete:function() {
		            console.log("읽어오기 완료 후...");
		        },
		        success:function(data) {
		            console.log("comment를 정상적으로 조회하였습니다.");
		            showHtml(data, commPageNum);
		            
		            let position = $("#showComment table tr:last").position();
		            $('html, body').animate({scrollTop : position.top}, 400);        // 두 번째 param은 스크롤 이동하는 시간
		        }
		    })
		} */
	</script>
	<script type="text/javascript">
		$("#commentWrite").click(
				function() {
					var content = $("#commentContent").val();
					var boardNo = "${board.boardNo}"
					$.ajax({
						type : "post",
						url : "../reply/write",
						data : param,
						success : function() {
							alert("댓글이 등록되었습니다.");
							replyList("1");
						}
					});
				});

		function listReply(num) {
			$.ajax({
				type : "get",
				url : "../reply/list?boardNo=${board.boardNo}",
				success : function(result) {
					$("#replyList").html(result);
				}
			});
		}
	</script>
	<script>
		$(document)
				.ready(
						function() {
							var sendFile = function(file, el) {
								var form_data = new FormData();
								form_data.append('file', file);

								$
										.ajax({
											data : form_data,
											type : "POST",
											url : 'c:/webupload',
											cache : false,
											contentType : false,
											enctype : 'multipart/form-data',
											processData : false,
											success : function(url) {
												$('#summernote').summernote(
														'insertImage', url);
												$('#imageBoard > ul')
														.append(
																'<li><img src="'+ url +'" width="480" height="auto"/></li>');
											}
										});
							}
							$('#summernote')
									.summernote(
											{
												height : 300,
												minHeight : null,
												maxHeight : null,
												focus : true,
												callbacks : {
													onImageUpload : function(
															file, editor,
															welEditable) {
														for (var i = files.length - 1; i >= 0; i--) {
															sendFile(files[i],
																	this);
														}
													}
												}
											});
						});
	</script>
	<script>
		$(document).ready(function() {
			$('.fileAdd').click(function() {
				if ($('.fileForm').children().length >= 5) {
					alert("파일은 5개 까지만 추가 가능합니다.");
				} else {
					$('.fileForm').append('<input type="file" name="file"/>');
				}
			})
		});
	</script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.scrolly.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/jquery.scrollex.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/skel.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/util.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/resources/assets/js/main.js"></script>
</body>
</html>