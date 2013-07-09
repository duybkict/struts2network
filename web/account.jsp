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
    <jsp:include page="template/header.jsp" />
    <body>
		<s:set var="active" >settings</s:set>
		<jsp:include page="template/navbar.jsp" />

		<div class="container">
			<div class="row-fluid">

				<!-- Profile Image -->
				<div class="span3 photo-box">
					<img id="profilePhoto" src="profile_images/<s:property value="user.id" />.tmp" class="img-polaroid" />

					<div class="btn-group">
						<button id="editPhoto" class="btn dropdown-toggle photo-box-button enable-toggle" data-toggle="dropdown">
							Edit Profile Photo
						</button>
						<ul class="dropdown-menu">
							<li id="uploadPhoto"><a href="#"><i class="icon-camera"></i>&nbsp;Upload Photo</a></li>
							<li id="removePhoto"><a href="#"><i class="icon-remove"></i>&nbsp;Remove</a></li>
						</ul>
					</div>
				</div><!--/span-->

				<!-- Settings -->
				<div class="span9" >
					<!-- General Settings -->
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

					<!-- Change Password -->
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

					<s:form action="account" method="POST" enctype="multipart/form-data" cssClass="hide" >
						<s:file name="profileImage" />
					</s:form>

				</div><!--/span-->
			</div>

			<jsp:include page="template/footer.jsp" />

		</div><!--/.fluid-container-->		

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
				o.parents(".control-group").first().addClass("error");
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
				$("#account_profileImage").click();
			});
			
			/*$("#removePhoto").bind("click", function(e) {
				$("#fileUpload").val("");
				$("#profilePhoto").addClass("hide");
				$("#noPhoto").removeClass("hide");
			});*/
			
			$("#account_profileImage").change(function() {
				//alert(.html())
				$(this).parents("form").first().submit();
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
