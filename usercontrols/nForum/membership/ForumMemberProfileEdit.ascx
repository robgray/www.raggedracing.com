<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumMemberProfileEdit.ascx.cs" Inherits="nForum.usercontrols.nForum.membership.ForumMemberProfileEdit" %>

<div id="membereditprofile" class="form-horizontal" runat="server">
	<div class="control-group">		
		<label for="<%= tbLoginName.ClientID %>" class="control-label">Login/Username</label>
		<div class="controls">
			<asp:TextBox ToolTip="Enter username" CssClass="span4 required" ID="tbLoginName" runat="server" placeholder="Username..." />
		</div>
	</div>
	<div class="control-group">		
		<label for="<%= tbName.ClientID %>" class="control-label">Name</label>
		<div class="controls"><asp:TextBox ToolTip="Enter name" CssClass="span4 required" ID="tbName" runat="server" /></div>
	</div>
	<div class="control-group">		
		<label for="<%= tbEmail.ClientID %>" class="control-label">Email</label>
		<div class="controls"><asp:TextBox ToolTip="Enter email address" CssClass="span4 required" ID="tbEmail" runat="server" /></div>
	</div>	
	<h4>Other Information</h4>
	<div class="control-group">		
		<label for="<%= tbTwitter.ClientID %>" class="control-label">Twitter Username</label>
		<div class="controls"><asp:TextBox ID="tbTwitter" runat="server" CssClass="span4" /></div>
	</div>
	<div class="control-group">		
		<label for="<%= cbAllowPrivateMessages.ClientID %>" class="control-label">Enable Private Messages</label>
		<div class="controls">
			<asp:CheckBox ID="cbAllowPrivateMessages" runat="server" />
		</div>		
	</div>
	
	<asp:Button ID="btnSubmit" runat="server" Text="Update Profile" onclick="BtnSubmitClick"  CssClass="btn btn-primary"/>
	
</div>