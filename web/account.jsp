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
		<jsp:include page="template/documents.jsp" />
	</head>

    <body>
		<s:set var="active" >settings</s:set>
		<jsp:include page="template/navbar.jsp" />

		<div class="container">
			<div class="row-fluid">

				<!-- Profile Image -->
				<div class="span3 photo-box">
					<img id="profilePhoto" src="<s:property value="user.profileImagePath" />" class="img-polaroid" />

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

						<form id="formChangeSettings" action="account" method="POST" class="form-horizontal">
							<fieldset>
								<legend>General Account Settings</legend>
								<div class="control-group">
									<label class="control-label" for="user_name">Name</label>
									<div class="controls">
										<s:textfield name="user.name" />
										<span class="help-inline error"></span>
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
							</fieldset>
						</form>
					</div>

					<!-- Change Password -->
					<div class="row well well-small">

						<form id="formChangePassword" action="account" method="POST" class="form-horizontal">
							<fieldset>
								<legend>Change Pasword</legend>
								<div class="control-group">
									<label class="control-label" for="current_password">Current Password</label>
									<div class="controls">
										<s:hidden name="user.password" />
										<input name="current_password" type="password" />
										<span class="help-inline"></span>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="new_password">New Password</label>
									<div class="controls">
										<s:password name="new_password" />
										<span class="help-inline"></span>
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="confirm_password">Confirm Password</label>
									<div class="controls">
										<s:password name="confirm_password" />
										<span class="help-inline"></span>
									</div>
								</div>

								<div class="control-group">
									<div class="controls">
										<button type="submit" class="btn btn-primary">Change Password</button>
									</div>
								</div>

								<s:hidden name="submitAction" value="SECURITY" />
							</fieldset>
						</form>
					</div>

					<s:form action="account" method="POST" enctype="multipart/form-data" cssClass="hide" >
						<s:file name="profileImage" />
						<s:textfield name="submitAction" value="NONE" />
					</s:form>

				</div><!--/span-->
			</div>

			<jsp:include page="template/footer.jsp" />

		</div><!--/.fluid-container-->

		<script type="text/javascript">
			$('#formChangeSettings').validate({
				rules: {
					'user.name': {
						required: true,
						minlength: 3
					},
					'user.email': {
						required: true,
						email: true
					}
				},
				messages: {
					'user.name': {
						required: 'Name must not be left blank.',
						minlength: 'Name must have at least {0} characters.'
					},
					'user.email': {
						required: 'Email must not be left blank.',
						email: 'Invalid email format.'
					}
				},
				errorPlacement: function(error, element) {
					error.appendTo(element.next('span.help-inline'));
				},
				validClass: 'success'
			});

			$('#formChangePassword').validate({
				rules: {
					'current_password': {
						required: true,
						equalTo: 'input[name="user.password"]'
					},
					'new_password': {
						required: true,
						minlength: 6,
						maxlength: 32
					},
					'confirm_password': {
						required: true,
						equalTo: 'input[name=new_password]'
					}
				},
				messages: {
					'current_password': {
						required: 'Password must not be left blank.',
						equalTo: 'Wrong password.'
					},
					'new_password': {
						required: 'New password must not be left blank.',
						minlength: 'new password must have at least {0} characters.',
						maxlength: 'new password must have at max {0} characters.'
					},
					'confirm_password': {
						required: 'Please confirm password.',
						equalTo: 'Passwords do not match.'
					}
				},
				errorPlacement: function(error, element) {
					error.appendTo(element.next('span.help-inline'));
				},
				validClass: 'success',
				ignore: '.ignore'
			});

			$("#editPhoto").focus(function() {
				$(this).removeClass("enable-toggle");
			});

			$("#editPhoto").blur(function() {
				$(this).addClass("enable-toggle");
			});

			$("#uploadPhoto").bind("click", function(e) {
				$("#account_profileImage").click();
			});

			$("#removePhoto").click(function() {
				$("#account_submitAction").val("DELETE");
				$("#account_profileImage").parents("form").first().submit();
			});

			$("#account_profileImage").change(function() {
				$(this).parents("form").first().submit();
			});

			/*function readURL(input) {
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
			}*/
		</script>
	</body>
</html>
