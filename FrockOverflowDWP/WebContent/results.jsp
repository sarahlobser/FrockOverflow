<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Frock Overflow</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">


<!-- Custom CSS -->
<link href="css/textinput.css" rel="stylesheet">


<link href="css/style.css" rel="stylesheet">



<style>
body {
	padding-top: 70px;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<body>
	<!-- ********************************Top Nav Bar**************************** -->
	<!-- Navigation -->
	 	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation"
		style="margin-bottom: 100px;">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a href="index.do"> <img src="smallicon.png"
					alt="Frock Overflow" style="width: 100px; height: 100px;">
				</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse search-bar"
				id="bs-example-navbar-collapse-1 search-text">
				<ul class="search-bar">
					<li><span style="color: white">Search by tag:</span></li>
					<form action="searchByTag.do">
						<input type="text" name="searchTags" list="tags"
							placeholder="ex... java">
						<datalist id="tags">
							<c:forEach var="tag" items="${sessionScope.tags}">
								<option value="${tag}"></option>
							</c:forEach>
						</datalist>
						<input type="submit" name="submit">
					</form>
				</ul>
			</div>
			<form action="search.do">
				<div class="collapse navbar-collapse navbar-button"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">

						<li><input type="submit" name="submit"
							value="View All Questions"></li>
						<li><input type="submit" name="submit"
							value="View All Posted Questions"></li>
						<li><input type="submit" name="submit"
							value="View All Answered Questions"></li>
						<li><input type="submit" name="submit"
							value="View All Resolved Questions"></li>
						<li><input type="submit" name="submit"
							value="View All My Questions"></li>
						<li><input type="hidden" name="user" value="${user.id}"></input></li>
					</ul>
				</div>
			</form>
		</div>

		<!--**********************************************USER INFORMATION************************************-->
		<div id="floatleft">
			<ul class="logged">
				<li class="logged">You are currently logged in as: <strong>${sessionScope.user.displayName}</strong></li>
				<c:if test="${!empty invalid}">${invalid}</c:if>
				<c:if test="${sessionScope.user.type != 0}">
					<a href="gotoeditprofile.do"><em>Edit Profile</em></a> ||
				</c:if>
				<a href="logOut.do"> <em> Log Out</em></a>
			</ul>
		</div>
	</nav>

 

	<!-- ******************************POST A QUESTION FORM DIV********************************************-->
	 <!-- <div class= "background-container">
	 <div class="body-container" id="postQuestionBlock"> -->

	
	<div class="postQuestionBlock">
	<button class="button-answer" onclick="document.getElementById('postQ').style.display='block'">
Post a Question</button>

<div id="postQ" style="display:none">
  <span onclick="this.parentElement.style.display='none'" class="closeButton">X</span>
  <form action="createQuestion.do" method="GET">
  	<textarea class="pqinputblock" name="body" cols="100" rows="5" required></textarea>
  	<input class="pqinputblock" type="text" name="keywords" placeholder="Add Keywords"> 
  	<input class="button-answer" type="submit" name="post" value="Post">
  </form>
  </div>
  </div>
  
<!-- </div>		
</div> -->


	 <%-- <div class="body-container" id="postQuestionBlock">
			<c:if test="${sessionScope.user.type != 0}">
					<form action="createQuestion.do" method="GET">
						<div class="body-container-question-post">
							<span class="input input--ichiro"> 
								<input class="input__field input__field--ichiro" type="text" id="input-25" name="body" /> 
								<label class="input__label input__label--ichiro" for="input-25">
									<span class="input__label-content input__label-content--ichiro">Post A Question</span>
								</label>
							</span>
						</div>
						<div class=body-container-answer-post>
							<span class="input input--ichiro"> 
								<input class="input__field input__field--ichiro" type="text" id="input-26" name="keywords" /> 
								<label class="input__label input__label--ichiro" for="input-26">
									<span class="input__label-content input__label-content--ichiro">Keywords</span>
								</label>
							</span>
						</div>
						<div class=body-container-submit-post>
							<span class="submit-question"> 
								<input type="submit" name="post">
							</span>
						</div>
					</form>
	</c:if>
	</div> --%> <!-- END OF POST A QUESTION BLOCK ******** -->
 
 
	<!-- *******************************************QUESTION LIST*******************************************-->


	 		<c:forEach var="question" items="${updatedQuestionList}">
			<article class="questionBox" id="${question.id}">
				<div class="text-body"><h4>Q: ${question.body}</h4> 
					<div class="tagWad">
					<c:forEach var="tag" items="${question.tags}">
						<form class="tagLink" action="searchByTag.do" method="GET">
							<input class="singleTag" type="submit" name="searchTags"
								value="${tag.body}">
						</form>
					</c:forEach>
					</div>

					<em>Posted By: <strong>${question.user.displayName}</strong> ${question.timestamp}<br>
					Status: ${question.status}<br></em> 




						<div class="content_w">
						<div class="content">
							<ul>
								<c:forEach var="comment" items="${question.comments}">
									<li>${comment.body}Posted by ${comment.user.displayName}
										On ${comment.timestamp}</li>
								</c:forEach>
							</ul>
							
<!-- *************************************** ANSWERS******************************************************** -->							
							
							<c:forEach var="answer" items="${question.answers}">
							<div class="answerBlock">
							<strong>Answer</strong> posted by <strong>${answer.user.displayName}</strong>  on ${answer.timestamp}
							<br>Rating: <strong>${answer.rating}</strong>
							<br>${answer.body}
		<!-- ******************************* ANSWER COMMENTS ****************************** -->
								<ul>
									<c:forEach var="comment" items="${answer.comments}">
										<li><em>${comment.body}   [Posted by <strong>${comment.user.displayName}</strong>
											 On ${comment.timestamp}]</em></li>
									</c:forEach>
								</ul>
								
						<!-- ******** VOTE UP OR DOWN *********** -->		
								
								<c:if test="${sessionScope.user.type != 0}">
											<form class="answer-function" action="voteUp.do" method="POST">
													<input type="hidden" name="answerId" value="${answer.id}">
													<input class="button-answer" type="submit" value="Vote Up"></input>
												</form>
											<form class="answer-function" action="voteDown.do" method="POST">
													<input type="hidden" name="answerId" value="${answer.id}">
													<input class="button-answer" type="submit" value="Vote Down"></input>
												</form>
								</c:if>

						<!-- ************* ACCEPT ANSWER *********** -->

								<c:if test="${answer.status != 'Accepted' && answer.question.user.id == sessionScope.user.id}">
									<form class="answer-function" action="acceptAnswer.do" method="GET">
										<input type="hidden" name="answer_id" value="${answer.id}">
										<input class="button-answer" type="submit" name="Accept Answer" value="Accept Answer">
									</form>
								</c:if>
								
					<!-- *****************REMOVE ANSWER*********   -->		
								
							<c:if test="${sessionScope.user.type > 1}"> 
								<form class="answer-function" action="removeAnswer.do" method="GET">
									<input type="hidden" name="remove_answer_id" value="${answer.id}" id="removethis">
									<input class="button-answer" type="submit" name="removeAnswer" value="Remove Answer">
								</form>
							</c:if>
											 
						<!-- **************COMMENT ON ANSWER******** -->
						
<button class="button-answer" onclick="document.getElementById('ac${answer.id}').style.display='block'">
Comment on this Answer</button>

<div id="ac${answer.id}" class="postAnswerBlock" style="display:none">
  <span onclick="this.parentElement.style.display='none'" class="closeButton">X</span>
  <form action="commentOnAnswer.do" method="GET">
  	<input type="hidden" name="answer_id" value="${answer.id}" required> 
  	<textarea class="commentInput" name="body" cols="100" rows="2"></textarea>
  	<input class="button-answer" type="submit" name="post" value="Post">
  </form>
</div>					
										
								<%-- <form class="answer-function" action="commentOnAnswer.do" method="GET">
									<span class="input input--ichiro"> 
										<input type="hidden" name="answer_id" value="${answer.id}">
										<input class="input__field input__field--ichiro" type="text" id="comment-${answer.question.id}${answer.id} name="body" required /> 
										<label class="input__label input__label--ichiro" for="comment-${answer.question.id}${answer.id}"> 
											<span class="input__label-content input__label-content--ichiro">Comment on Answer</span>
										</label>
									</span>
												<!-- </form> -->
											
									<span class="submit-question"> 
										<input type="submit" name="post">
									</span>	
								</form> --%>
							</div> <!--  END OF ANSWER BLOCK ******** -->				
				</c:forEach> <!--  END OF ANSWER FOR EACH ******* -->
				
				
	</div> <!-- END OF CONTENT DIV ********** -->
	</div> <!-- END OF CONTENT-W ************ -->
	</div> <!-- END OF TEXT BODY ************ -->
	</article>
	
	
	
 <div class="question-comment-block">
				<c:if test="${sessionScope.user.type != 0}">
				
<!-- ********************************************* POST AN ANSWER ***************************************** -->				
<button class="button-answer" onclick="document.getElementById('q${question.id}').style.display='block'">
Answer this Question</button>

<div id="q${question.id}"class="postAnswerBlock" style="display:none">
  <span onclick="this.parentElement.style.display='none'" class="closeButton">X</span>
  <form action="postAnswer.do" method="GET">
  	<input type="hidden" name="question_id" value="${question.id}" required> 
  	<textarea class="answerInput" name="body" cols="100" rows="5"></textarea>
  	<input class="button-answer" type="submit" name="post" value="Post">
  </form>
</div>
	
				
				<%-- 	<form action="postAnswer.do" method="GET">
						<span class="input input--ichiro"> 
							<input type="hidden" name="question_id" value="${question.id}" required> 
							<input class="input__field input__field--ichiro" type="text" id="input-${question.id}-2" name="body" required/> 
							<label class="input__label input__label--ichiro" for="input-${question.id}-2"> 
								<span class="input__label-content input__label-content--ichiro">Answer Question</span>
							</label>
						</span>
						<span class="submit-question"> 
							<input type="submit" name="post">
						</span>
					</form> --%>
	
					
<!-- ****************************************** POST A COMMENT ******************************************** -->					
<button class="button-answer" onclick="document.getElementById('qc${question.id}').style.display='block'">
Comment on this Question</button>

<div id="qc${question.id}"class="postAnswerBlock" style="display:none">
  <span onclick="this.parentElement.style.display='none'" class="closeButton">X</span>
  <form action="commentOnQuestion.do" method="GET">
  	<input type="hidden" name="question_id" value="${question.id}" required> 
  	<textarea class="commentInput" name="body" cols="100" rows="2"></textarea>
  	<input class="button-answer" type="submit" name="post" value="Post">
  </form>
</div>					
					<%-- <form action="commentOnQuestion.do" method="GET">
						<span class="input input--ichiro"> 
							<!-- <span class="submit-question"> -->
							<input type="hidden" name="question_id" value="${question.id}" required> 
							<input class="input__field input__field--ichiro" type="text" id="comment-${question.id}-1" name="body" required/> 
							<label class="input__label input__label--ichiro" for="comment-${question.id}-1"> 
								<span class="input__label-content input__label-content--ichiro">Comment on Question</span>
							</label>
						</span>
						<span class="submit-question"> 
							<input type="submit" name="post">
						</span>
					</form> --%>
		</c:if>
<!--  ******************************** REMOVE QUESTION *************************************************** -->					
			<c:if test="${sessionScope.user.type > 1}">		
					<form class="answer-function" action="removeQuestion.do" method="GET">
						<input type="hidden" name="question_id" value="${question.id}">
						<span class="submit-question">
							<input type="submit" name="removeQuestion" value="Remove Question">
						</span>
					</form>
						
			
			</c:if> <!-- END OF IF USER TYPE != 0 ********* -->
			</div> <!-- END OF QUESTION COMMENT BLOCK ****** -->
			</div> <!-- END OF QUESTION BLOCK ************** -->
			</c:forEach>


<!-- *********************************************SCRIPTS************************************************* -->

	<!-- jQuery Version 1.11.1 -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<!-- This is J-Query text expand code -->
	 <script type="text/javascript">
		$('article').on('click', function() {
			slide($('.content', this));
		});

		function slide(content) {
			var wrapper = content.parent();
			var contentHeight = content.outerHeight(true);
			var wrapperHeight = wrapper.height();

			wrapper.toggleClass('open');
			if (wrapper.hasClass('open')) {
				setTimeout(
						function() {
							wrapper.addClass('transition').css('height',
									contentHeight);
						}, 10);
			} else {
				setTimeout(function() {
					wrapper.css('height', wrapperHeight);
					setTimeout(function() {
						wrapper.addClass('transition').css('height', 0);
					}, 10);
				}, 10);
			}

			wrapper
					.one(
							'transitionEnd webkitTransitionEnd transitionend oTransitionEnd msTransitionEnd',
							function() {
								if (wrapper.hasClass('open')) {
									wrapper.removeClass('transition').css(
											'height', 'auto');
								}
							});
		}
	</script>
</body>

</html>