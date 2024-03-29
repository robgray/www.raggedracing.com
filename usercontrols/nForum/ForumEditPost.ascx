﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumEditPost.ascx.cs" Inherits="nForum.usercontrols.nForum.ForumEditPost" %>
<%@ Register src="~/usercontrols/nForum/includes/Emoticons.ascx" tagname="Emoticons" tagprefix="nforum" %>
        <asp:LoginView ID="lvEditPost" runat="server">
            <LoggedInTemplate>
                <h2>Edit Post</h2>
                
                <asp:Panel ID="pnlTopicTitle" runat="server" Visible="false">
                    <p><asp:TextBox ID="tbTopicTitle" CssClass="topictitletextbox" runat="server" ClientIDMode="Static" ToolTip="Topic Title"></asp:TextBox></p>
                </asp:Panel>
                <nforum:Emoticons ID="emoticonInclude" runat="server" />
                <p><asp:TextBox ID="txtPost" runat="server" TextMode="MultiLine" Rows="14" ClientIDMode="Static"></asp:TextBox></p>
                
                <asp:Panel ID="pnlMakeSticky" runat="server" Visible="false">
                    <p>Mark as a sticky topic <asp:CheckBox ID="cbSticky" ClientIDMode="Static" runat="server" /></p>
                </asp:Panel>
                
                <p class="submitbutton"><asp:Button ID="btnSubmitPost" runat="server" Text="Edit Post" onclick="BtnSubmitPostClick" CssClass="btn btn-primary" /></p>

            </LoggedInTemplate>
        </asp:LoginView>