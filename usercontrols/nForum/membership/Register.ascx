<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Register.ascx.cs" Inherits="nForum.usercontrols.nForum.membership.Register" %>

    <div id="forumregistration" class="validate">

            <div class="form-horizontal">
                
                <div class="control-group"><label for="<%= tbLoginName.ClientID %>" class="control-label">Login/Username</label>
                <div class="controls"><asp:TextBox ToolTip="Enter username" CssClass="span4 required" ID="tbLoginName" runat="server" /></div></div>

                <div class="control-group"><label for="<%= tbName.ClientID %>" class="control-label">Name</label>
                <div class="controls"><asp:TextBox ToolTip="Enter name" CssClass="span4 required" ID="tbName" runat="server" /></div></div>

                <div class="control-group"><label for="<%= tbEmail.ClientID %>" class="control-label">Email</label>
                <div class="controls"><asp:TextBox ToolTip="Enter email address" CssClass="span4 required email" ID="tbEmail" runat="server" /></div></div>

                <div class="control-group"><label for="<%= tbPassword.ClientID %>" class="control-label">Password</label>
                <div class="controls"><asp:TextBox ToolTip="Enter a password" CssClass="span4 required" ID="tbPassword" TextMode="Password" runat="server" /></div></div>

                <h4>Other Information</h4>
                
                <div class="control-group"><label for="<%= tbTwitter.ClientID %>" class="control-label">Twitter Username</label>
                <div class="controls"><asp:TextBox ID="tbTwitter" runat="server" CssClass="span4" /></div></div>
                
                <div class="control-group"><div class="controls"><asp:Button ID="btnSubmit" CssClass="btn btn-primary" runat="server" Text="Create Account" onclick="BtnSubmitClick" /></div></div>

            </dl>


    </div>