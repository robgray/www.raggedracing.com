<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumForgotPassword.ascx.cs" Inherits="nForum.usercontrols.nForum.membership.ForumForgotPassword" %>

<h4>Forgot your password</h4>
<div class="form">	
	<asp:TextBox ID="tbEmail" runat="server" CssClass="span4" placeholder="Email address..."></asp:TextBox><asp:Button ID="btnSubmit" runat="server" Text="Go" onclick="BtnSubmitClick" CssClass="btn btn-primary" />
</div>
