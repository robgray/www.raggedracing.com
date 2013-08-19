<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Login.ascx.cs" Inherits="nForum.usercontrols.nForum.membership.Login" %>

<asp:Login RenderOuterTable="false" ID="ctlLogin" runat="server" OnLoginError="OnLoginError" onloggedin="OnLoggedIn" RememberMeSet="True" VisibleWhenLoggedIn="False">
    <LayoutTemplate>        
		<div class="form-horizontal">
			<div class="control-group">
				<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="control-label">User Name:</asp:Label>
				<div class="controls">
					<asp:TextBox ID="UserName" CssClass="required" ToolTip="Enter username" runat="server"></asp:TextBox>
				</div>
			</div>
							
			<div class="control-group">
				<asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="control-label">Password:</asp:Label>			
				<div class="controls">
					<asp:TextBox ID="Password" CssClass="required" ToolTip="Enter password" runat="server" TextMode="Password"></asp:TextBox>
					<label class="checkbox">
					<asp:CheckBox ID="RememberMe" runat="server" Text="" /> Remember me next time
				</label>				
				</div>
			</div>						
			<div class="control-group">
				<div class="controls">
					<asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" CssClass="btn btn-primary" />        
				</div>
			</div>
			<p class="forgotpasswordlink"><a href="/forgotpassword.aspx">Forgot your password?</a></p>
    </LayoutTemplate>
</asp:Login>