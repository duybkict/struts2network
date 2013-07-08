<%-- 
    Document   : account
    Created on : Jul 6, 2013, 4:11:29 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Settings</title>

		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap-responsive.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css">

		<script type="text/javascript" src="js/jquery.min.js" ></script>
		<script type="text/javascript" src="bootstrap/js/bootstrap.min.js" ></script>		
		<script type="text/javascript" src="js/holder.js" ></script>
		<script type="text/javascript" src="js/moment.min.js" ></script>
    </head>
    <body>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container">
					<a class="brand" href="#">Struts2 Network</a>
					<div class="nav-collapse collapse">
						<ul class="nav pull-right">
							<li><a href="<s:url action='home' />">Home</a></li>
							<li><a href="<s:url action='profile' />">Profile</a></li>
							<li><a href="<s:url action='people' />">Find Friends</a></li>
							<li class="dropdown active">
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
				<div class="span3 photo-box">
					<img id="profilePhoto" src="" class="img-polaroid hide" />
					<img id="noPhoto" src="holder.js/220x220" class="img-polaroid " />
					<div class="btn-group">
						<button id="editPhoto" class="btn btn-large dropdown-toggle photo-box-button enable-toggle" data-toggle="dropdown">
							Edit Profile Photo
						</button>
						<ul class="dropdown-menu">
							<li id="uploadPhoto"><a href="#"><i class="icon-camera"></i>&nbsp;Upload Photo</a></li>
							<li id="discardPhoto"><a href="#"><i class="icon-ban-circle"></i>&nbsp;Discard Changes</a></li>
							<li id="removePhoto"><a href="#"><i class="icon-remove"></i>&nbsp;Remove</a></li>
						</ul>
					</div>

				</div><!--/span-->
				<div class="span9" >
					<div class="row well well-small">
						<span class="lead">General Account Settings</span>
						<hr />

						<form onsubmit="return validateSaveSettings();" action="account" method="POST" class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="user_name">Name</label>
								<div class="controls">
									<s:textfield name="user.name" />
									<span class="help-inline"></span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="user_email">Email</label>
								<div class="controls">
									<s:textfield name="user.email" />
									<span class="help-inline"></span>
								</div>
							</div>							

							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn btn-primary">Save Settings</button>
								</div>
							</div>

							<s:hidden name="submitAction" value="UPDATE" />
						</form>
					</div>

					<div class="row well well-small">
						<span class="lead">Change Password</span>
						<hr />

						<form onsubmit="return validateChangePassword();" action="account" method="POST" class="form-horizontal">
							<div class="control-group">
								<label class="control-label" for="current_password">Current Password</label>
								<div class="controls">
									<input id="current_password" name="current_password" type="password" />
									<span class="help-inline"></span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="new_password">New Password</label>
								<div class="controls">
									<input id="new_password" name="new_password" type="password" />
									<span class="help-inline"></span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label" for="user_password">Retype Password</label>
								<div class="controls">
									<s:password name="user.password" />
									<span class="help-inline"></span>
								</div>
							</div>

							<div class="control-group">
								<div class="controls">
									<button type="submit" class="btn btn-primary">Change Password</button>
								</div>
							</div>
							
							<s:hidden name="submitAction" value="SECURITY" />							
						</form>
					</div>

				</div><!--/span-->
			</div>

			<hr>
<s:file id="fileUpload" name="fileUpload" onchange="readURL(this);" cssClass="hide"/>
			<footer>
				<p>&copy; Company 2013</p>
			</footer>

		</div><!--/.fluid-container-->

		<!--Help Modal Dialog-->
		<div id="modalHelp" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="modalHelpLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="modalHelpLabel">Getting Help</h3>
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
		</div><!--/Help Modal Dialog-->

		<script type="text/javascript">
			var password = <s:property value="user.password" />;
			
			function validateSaveSettings() {				
				var user_name = $("#user_name").val();
				var user_email = $("#user_email").val();
				var valid = true;
				
				removeFieldErrors();
				
				if (user_email == null || user_email == "") {
					addFieldError($("#user_email"), "Email must not be left blank.");
					valid = false;
				}
				
				if (user_name == null || user_name == "") {
					addFieldError($("#user_name"), "Name must not be left blank.");
					valid = false;
				}
				
				if (valid) {
					if (!/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(user_email)) {
						addFieldError($("#user_email"), "Invalid email address.");
						valid = false;
					}
				
					if (user_name.length < 5) {
						addFieldError($("#user_name"), "Name should be at least 5 characters.");
						valid = false;
					}
				}				
				
				return valid;
			}
			
			function validateChangePassword() {
				var current_password = $("#current_password").val();
				var new_password = $("#new_password").val();
				var re_password = $("#user_password").val();
				var valid = true;
				
				removeFieldErrors();
				
				if (new_password == null || new_password == "") {
					addFieldError($("#new_password"), "New password must not be left blank.");
					valid = false;
				} else if (new_password.length < 5) {
					addFieldError($("#new_password"), "New password should be at least 5 characters.");
					valid = false;				
				}
				
				if (current_password == null || current_password == "") {
					addFieldError($("#current_password"), "Current password must not be left blank.");
					valid = false;
				} else if (current_password != password) {
					addFieldError($("#current_password"), "Incorrect password.");
					valid = false;
				}
				
				if (valid && new_password != re_password) {
					addFieldError($("#user_password"), "Passwords mismatch.");
					valid = false;
				}
				
				return valid;
			}
			
			function removeFieldErrors() {
				$(".control-group").removeClass("error");			
				$(".help-inline").html("");
			}
			
			function addFieldError(o, message) {
				o.parents(".control-group").addClass("error");
				o.siblings(".help-inline").html(message);
				o.focus();
			}
			
			$("#editPhoto").focus(function() {
				$(this).removeClass("enable-toggle");
			});
			
			$("#editPhoto").blur(function() {
				$(this).addClass("enable-toggle");
			});

			$("#uploadPhoto").bind("click", function(e) {
				$("#fileUpload").click();
			});
			
			$("#removePhoto").bind("click", function(e) {
				$("#fileUpload").val("");
				$("#profilePhoto").addClass("hide");
				$("#noPhoto").removeClass("hide");
			});
			
			$("#fileUpload").change(function() {
				if ($(this).files && $(this).files[0]) {
					var reader = new FileReader();
					reader.onload = function (e) {
						$("#profilePhoto").attr("src", e.target.result);
					};
					reader.readAsDataURL($(this).files[0]);
				}
				
				$("#profilePhoto").removeClass("hide");
				$("#noPhoto").addClass("hide");
			});
			
			function readURL(input) {
				if (input.files && input.files[0]) {
					var reader = new FileReader();
					reader.onload = function (e) {
						$("#profilePhoto")
						.attr("src", e.target.result)
						.width(250)
						.heigh(250);
					};
					reader.readAsDataURL(input.files[0]);
				}
			}
		</script>
	</body>
</html>
