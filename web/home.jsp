<%-- 
    Document   : home
    Created on : Jul 1, 2013, 9:07:18 AM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <jsp:include page="template/header.jsp" />
    <body>		
		<s:set var="active" >home</s:set>
		<jsp:include page="template/navbar.jsp" />		

		<div class="container">
			<div class="row-fluid">

				<!-- Side Bar -->
				<div class="span5 well well-small sidebar">
					<img src="profile_images/<s:property value="user.id" />.tmp" class="img-polaroid pull-left" />
					<a href="#"><h4><s:property value="user.name" /></h4></a>							
					<s:property value="user.email" /><br />
					<a href="<s:url action="account" />" class="">Edit Profile</a>					

					<div class="clearfix" ></div>
				</div><!--/span4-->

				<!-- Content -->
				<div class="span7">

					<textarea id="newPostContent" class="input-block-level" placeholder="What's on your mind?"></textarea>
					<button id="newPostSubmit" class="btn btn-primary pull-right">Submit</button>
					<div class="clearfix"></div>				

					<s:iterator value="posts">
						<div class="post-box">
							<div class="btn-group pull-right post-box-button <s:if test='user.id == person.id'>post-box-button-toggle</s:if>">
								<button class="close dropdown-toggle" data-toggle="dropdown">&times;</button>
								<ul class="dropdown-menu pull-left">
									<li class="postEdit" postId="<s:property value='id'/>" ><a href="#modalEditPost" data-toggle="modal">Edit Post</a></li>
									<li class="postDelete" postId="<s:property value='id'/>"><a href="#">Delete Post</a></li>
								</ul>
							</div>
							<div class="media">
								<a class="pull-left" href="#">
									<img src="profile_images/<s:property value="person.id" />.tmp" class="media-object" >
								</a>

								<div class="media-body">
									<h4 class="media-heading">
										<a href="#"><s:property value="person.name" /></a></h4>
									<div class="media" id="postContent_<s:property value='id'/>"><s:property value="content" escape="false"/></div>								
									<p class="muted">
										<script type="text/javascript">
											var date = '<s:date name="created" format="yyyy-MM-dd HH:mm:ss"/>';
											document.write("Posted " + moment(date, "YYYY-MM-DD HH:mm:ss").fromNow() + ".");
										</script>
									</p>
								</div>
							</div>
						</div>
					</s:iterator>

					<!-- Pagination -->
					<div class="pagination pagination-centered">
						<ul>
							<s:set name="currentPage" value="offset / limit"/>

							<li class="<s:if test="#currentPage == 0">disabled</s:if>">
								<a href="<s:url action="home">
									   <s:param name="offset" value="0" />
									   <s:param name="limit" value="limit" />
								   </s:url>" >&laquo;
								</a>
							</li>

							<s:iterator var="counter" begin="0" end="countPages">
								<li class="<s:if test="#currentPage == #counter">disabled</s:if>">
									<a href="<s:url action="home">
										   <s:param name="offset" value="#counter * limit" />
										   <s:param name="limit" value="limit" />
									   </s:url>"><s:property value="#counter + 1" />
									</a>
								</li>
							</s:iterator>

							<li class="<s:if test="#currentPage == countPages">disabled</s:if>">
								<a href="<s:url action="home">
									   <s:param name="offset" value="countPages * limit" />
									   <s:param name="limit" value="limit" />
								   </s:url>">&raquo;
								</a>
							</li>
						</ul>
					</div><!--/pagination-->
					
				</div><!--/span-->
			</div><!--/row-->

			<jsp:include page="template/footer.jsp" />

		</div><!--/.fluid-container-->

		<!-- Hidden Post Inputs -->
		<s:form id="postForm" action="home" cssClass="hide">
			<s:textfield name="post.id" />
			<s:textfield name="post.personId" value="%{user.id}" />
			<s:textfield name="post.content" />
			<s:textfield name="submitAction" />
		</s:form>

		<!-- Edit Post Modal Dialog -->
		<div id="modalEditPost" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Edit Post</h3>
			</div>
			<div class="modal-body">
				<textarea id="editPostContent" class="input-block-level" ></textarea>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
				<button id="editPostSubmit" class="btn btn-primary pull-right">Submit</button>
			</div>
		</div><!--/modalEditPost-->

		<script type="text/javascript">			
			$("#newPostSubmit").click(function() {
				// Validate
				var postContent = $("#newPostContent").val().trim();
				if (postContent == null || postContent == "") {
					alert("Post content must not be left blank!");
					return;
				}
				
				// Submit
				$("#postForm_post_content").val(postContent);
				$("#postForm_submitAction").val("INSERT");
				$("#postForm").submit();
			})
			
			$("#editPostSubmit").click(function() {
				// Validate
				var postContent = $("#editPostContent").val().trim();
				if (postContent == null || postContent == "") {
					alert("Post content must not be left blank!");
					return;
				}
				
				// Submit
				$("#postForm_post_content").val(postContent);
				$("#postForm_submitAction").val("UPDATE");
				$("#postForm").submit();
			})
			
			$(".postDelete").click(function() {
				var postId = $(this).attr("postId");
				
				// Confirm
				if (confirm("Are you sure you want to permanently delete this post?")) {
					// Submit
					$("#postForm_post_id").val(postId);
					$("#postForm_submitAction").val("DELETE");
					$("#postForm").submit();				
				}
			})
			
			$(".postEdit").click(function() {
				var postId = $(this).attr("postId");
				
				$("#postForm_post_id").val(postId);
				$("#editPostContent").val($("#postContent_" + postId).html());
			})
		</script>
	</body>
</html>