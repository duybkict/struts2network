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
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>

		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">

		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js" ></script>		
		<script type="text/javascript" src="js/holder.js" ></script>
		<script type="text/javascript" src="js/moment.min.js" ></script>
    </head>
    <body>

		<s:set var="userName"><s:property value="user.firstName" /> <s:property value="user.lastName" /></s:set>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="#">Struts2 Network</a>
					<div class="nav-collapse collapse">
						<ul class="nav pull-right">
							<li class="active"><a href="<s:url action='home' />">Home</a></li>
							<li><a href="<s:url action='profile' />">Profile</a></li>
							<li><a href=<s:url action='people' />#">Find Friends</a></li>
							<li class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" href="#">
									Settings 
									<b class="caret"></b>
								</a>
								<ul class="dropdown-menu">
									<li><a href="#">Account Settings</a></li>
									<li><a href="<s:url action='index' />">Logout</a></li>
									<li class="divider"></li>
									<li><a href="#modalHelp" data-toggle="modal">Help</a></li>
								</ul>
							</li>
						</ul>
					</div><!--/.nav-collapse -->
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row-fluid">
				<div class="span4 offset1">
					<div class="well sidebar-nav">						
						<img src="holder.js/128x128" class="img-polaroid pull-left" style="margin-right:10px;">
						<a href="#"><h4><s:property value="#userName"/></h4></a>
						<ul class="unstyled">							
							<li><s:property value="user.email" /></li>
							<li>
								<s:if test="%{user.gender==false}">
									Female
								</s:if>
								<s:else>
									Male
								</s:else>
							</li>
							<li><s:property value="user.birthday" /></li>
						</ul>
						<a href="#" class="">Edit Profile</a>
						<div style="clear:both" ></div>
					</div><!--/.well -->
				</div><!--/span-->
				<div class="span6">
					<div>
						<textarea id="newPostContent" class="input-block-level" ></textarea>
						<button id="newPostSubmit" class="btn btn-primary pull-right">Submit</button>
						<div class="clearfix"></div>
					</div>					

					<s:iterator value="posts">
						<s:url action="user" var="userLink">
							<s:param name="userId" value="user.id"></s:param>
						</s:url>

						<hr />
						<div class="post-box">
							<div class="btn-group pull-right post-box-button">
								<button class="close dropdown-toggle" data-toggle="dropdown">&times;</button>
								<ul class="dropdown-menu pull-left">
									<li class="postEdit" postId="<s:property value='id'/>" ><a href="#modalEditPost" data-toggle="modal">Edit Post</a></li>
									<li class="postDelete" postId="<s:property value='id'/>"><a href="#">Delete Post</a></li>
								</ul>
							</div>
							<div class="media">
								<a class="pull-left" href="#">
									<img class="media-object" data-src="holder.js/64x64">
								</a>

								<div class="media-body">
									<h4 class="media-heading"><a href="${userLink}">
											<s:property value="person.firstName" />&nbsp;<s:property value="person.lastName" />
										</a></h4>
									<div class="media" id="postContent_<s:property value='id'/>"><s:property value="content"/></div>								
									<p class="muted">
										<script type="text/javascript">
											var date = "<s:date name="created" format="yyyy-MM-dd HH:mm:ss"/>";
											document.write(moment(date, "YYYY-MM-DD HH:mm:ss").fromNow());
										</script>									
									</p>
								</div>													
							</div>
						</div>
					</s:iterator>
				</div><!--/span-->
			</div><!--/row-->

			<hr>

			<footer>
				<p>&copy; Company 2013</p>
			</footer>

		</div><!--/.fluid-container-->

		<!-- Hidden Post Inputs -->
		<s:form id="postForm" action="home">
			<s:textfield name="post.id" />
			<s:textfield name="post.personId" value="1" />
			<s:textfield name="post.content" />
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

		<!-- Help Modal Dialog -->
		<div id="modalHelp" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Getting Help</h3>
			</div>
			<div class="modal-body">
				<p>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</p>
				<p>
					Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div><!--/modalHelp-->

		<script type="text/javascript">
			$("#newPostSubmit").click(function() {
				$("#postForm_post_id").val("0");
				$("#postForm_post_content").val($("#newPostContent").val());
				$("#postForm").submit();
			})
			
			$("#editPostSubmit").click(function() {
				$("#postForm_post_content").val($("#editPostContent").val());
				$("#postForm").submit();
			})
			
			$(".postDelete").click(function() {
				if (confirm("Are you sure you want to permanently delete this post?")) {
					$("#postForm_post_id").val("-" + $(this).attr("postId"));
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