<%-- 
    Document   : navbar
    Created on : Jul 9, 2013, 9:31:19 AM
    Author     : DELL
--%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<a class="brand" href="#">Struts2 Network</a>
			<div class="nav-collapse collapse">
				<ul class="nav pull-right">
					<li class="<s:if test="#active == 'home'">active</s:if>" ><a href="<s:url action='home' />">Home</a></li>
					<%--<li class="<s:if test="#active == 'home'">profile</s:if>"><a href="<s:url action='profile' />">Profile</a></li>--%>
					<%--<li class="<s:if test="#active == 'home'">active</s:if>"><a href=<s:url action='people' />#">Find Friends</a></li>--%>
					<li class="dropdown <s:if test="#active == 'settings'">active</s:if>">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							Settings 
							<b class="caret"></b>
						</a>
						<ul class="dropdown-menu">
							<li><a href="<s:url action='account' />">Account Settings</a></li>
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

<%-- Help Modal Dialog --%>
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
</div><%--/modalHelp--%>
