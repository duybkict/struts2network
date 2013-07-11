<%-- 
    Document   : register
    Created on : Jul 2, 2013, 2:58:27 PM
    Author     : DELL
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

		<jsp:include page="template/documents.jsp" />

		<style type="text/css">
			body {
				background-color: #f5f5f5;
			}
		</style>

		<sx:head />
    </head>
    <body>
        <div class="container">

			<form id="formSignUp" class="form-signin validate">
				<h2 class="form-signin-heading">Sign Up</h2>

				<div class="alert alert-error hide">
					<button type="button" class="close" data-dismiss="alert">&times;</button>
					<label><strong>Warning!</strong></label>
					<div class="alert-messages">
					</div>
				</div>

				<div class="controls controls-row">
					<s:textfield name="firstname" placeholder="First Name" cssClass="input-large" />
					<s:textfield name="lastname" placeholder="Last Name" cssClass="input-medium" />
				</div>
				<div class="controls">
					<s:textfield name="email" placeholder="Email" cssClass="input-block-level" />
				</div>
				<div class="controls">
					<s:password name="password" placeholder="Password" cssClass="input-block-level" />
				</div>
				<div class="controls">
					<s:password name="repassword" placeholder="Confirm Password" cssClass="input-block-level" />
				</div>

				<div class="controls pull-left">
					<h4>Birthday</h4>
					<sx:datetimepicker displayFormat="dd-MM-yyyy" value="%{'today'}" id="birthday" />
				</div>
				<div class="controls pull-right">
					<h4>Gender</h4>
					<s:select theme="simple" list="#{'1':'Male','0':'Female'}" cssClass="input-medium"/>
				</div>
				<div class="clearfix"></div>

				<p>By clicking Sign Up, you agree to our <a href="#modalTermsAndConditions" data-toggle="modal">Terms</a> and that you have read our <a href="#modalDataUsePolicy" data-toggle="modal">Data use policy</a>.</p>

				<input class="btn btn-large btn-primary submit" type="submit" value="Create New Account" />
				<a href="login.jsp" style="margin-left:30px;vertical-align:bottom" >Already have an Account.</a>
			</form>

		</div> <!-- /container -->

		<!--Terms and Conditions Modal-->
		<div id="modalTermsAndConditions" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Terms And Conditions</h3>
			</div>
			<div class="modal-body">
				<h5>A Heading</h5>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</p>
				<p>
					Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.
				</p>
				<h5>Another Heading</h5>
				<p>
					Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.
				</p>
				<p>
					Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.
				</p>
				<p>
					Aliquam vehicula sem ut pede. Cras purus lectus, egestas eu, vehicula at, imperdiet sed, nibh. Morbi consectetuer luctus felis. Donec vitae nisi. Aliquam tincidunt feugiat elit. Duis sed elit ut turpis ullamcorper feugiat. Praesent pretium, mauris sed fermentum hendrerit, nulla lorem iaculis magna, pulvinar scelerisque urna tellus a justo. Suspendisse pulvinar massa in metus. Duis quis quam. Proin justo. Curabitur ac sapien. Nam erat. Praesent ut quam.
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div><!--/Terms and Conditions Modal-->

		<!--Data Use Policy Modal-->
		<div id="modalDataUsePolicy" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h3 id="myModalLabel">Data Use Policy</h3>
			</div>
			<div class="modal-body">
				<p>
					Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
				</p>
				<p>
					Curabitur pretium tincidunt lacus. Nulla gravida orci a odio. Nullam varius, turpis et commodo pharetra, est eros bibendum elit, nec luctus magna felis sollicitudin mauris. Integer in mauris eu nibh euismod gravida. Duis ac tellus et risus vulputate vehicula. Donec lobortis risus a elit. Etiam tempor. Ut ullamcorper, ligula eu tempor congue, eros est euismod turpis, id tincidunt sapien risus a quam. Maecenas fermentum consequat mi. Donec fermentum. Pellentesque malesuada nulla a mi. Duis sapien sem, aliquet nec, commodo eget, consequat quis, neque. Aliquam faucibus, elit ut dictum aliquet, felis nisl adipiscing sapien, sed malesuada diam lacus eget erat. Cras mollis scelerisque nunc. Nullam arcu. Aliquam consequat. Curabitur augue lorem, dapibus quis, laoreet et, pretium ac, nisi. Aenean magna nisl, mollis quis, molestie eu, feugiat in, orci. In hac habitasse platea dictumst.
				</p>
				<p>
					Fusce convallis, mauris imperdiet gravida bibendum, nisl turpis suscipit mauris, sed placerat ipsum urna sed risus. In convallis tellus a mauris. Curabitur non elit ut libero tristique sodales. Mauris a lacus. Donec mattis semper leo. In hac habitasse platea dictumst. Vivamus facilisis diam at odio. Mauris dictum, nisi eget consequat elementum, lacus ligula molestie metus, non feugiat orci magna ac sem. Donec turpis. Donec vitae metus. Morbi tristique neque eu mauris. Quisque gravida ipsum non sapien. Proin turpis lacus, scelerisque vitae, elementum at, lobortis ac, quam. Aliquam dictum eleifend risus. In hac habitasse platea dictumst. Etiam sit amet diam. Suspendisse odio. Suspendisse nunc. In semper bibendum libero.
				</p>
				<p>
					Proin nonummy, lacus eget pulvinar lacinia, pede felis dignissim leo, vitae tristique magna lacus sit amet eros. Nullam ornare. Praesent odio ligula, dapibus sed, tincidunt eget, dictum ac, nibh. Nam quis lacus. Nunc eleifend molestie velit. Morbi lobortis quam eu velit. Donec euismod vestibulum massa. Donec non lectus. Aliquam commodo lacus sit amet nulla. Cras dignissim elit et augue. Nullam non diam. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. In hac habitasse platea dictumst. Aenean vestibulum. Sed lobortis elit quis lectus. Nunc sed lacus at augue bibendum dapibus.
				</p>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div><!--/Data Use Policy Modal-->

		<script type="text/javascript">			
			var validator = $('#formSignUp').validate({
				rules: {
					firstname: {
						required: true,
						minlength: 3,
						maxlength: 32
					},
					lastname: {
						required: true,
						minlength: 3,
						maxlength: 32
					},
					email: {
						required: true,
						email: true
					},
					password: {
						required: true,
						minlength: 6,
						maxlength: 32
					},
					repassword: {
						required: true,
						equalTo: 'input[name=password]'
					}
				}, 
				messages: {
					firstname: {
						required: 'First name must not be left blank.',
						minlength: 'First name must has at least 3 characters.',
						maxlength: 'First name must has no longer than 32 characters.'
					},
					lastname: {
						required: 'Last name must not be left blank.',
						minlength: 'Last name must has at least 3 characters.',
						maxlength: 'Last name must has no longer than 32 characters.'
					},
					email: {
						required: 'Email must not be left blank.',
						email: 'Invalid email format.'
					},
					password: {
						required: 'Password must not be left blank.',
						minlength: 'Password must has at least 6 characters.',
						maxlength: 'Password must has no longer than 32 characters.'
					},
					repassword: {
						required: 'Confirm password is required.',
						equalTo: 'Passwords do not match.'
					}
				},				
				invalidHandler: function() {
					$(this).find('.alert').first().show();
				},
				errorPlacement: function(error, element) {
					error.appendTo(element.parents('form').first().find('.alert-messages').first());
				},
				validClass: 'success',
				onkeyup: false
			});
			
			$('#formSignUp input').blur(function() {
				if (validator.numberOfInvalids() <= 0) {
					$('#formSignUp .alert').hide();
				} else {
					$('#formSignUp .alert').show();
				}
			});
		</script>
    </body>
</html>
