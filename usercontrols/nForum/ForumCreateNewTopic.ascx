﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumCreateNewTopic.ascx.cs" Inherits="nForum.usercontrols.nForum.ForumCreateNewTopic" %>
<%@ Register src="~/usercontrols/nForum/includes/Emoticons.ascx" tagname="Emoticons" tagprefix="nforum" %>
<div class="createnewtopicform">
        <asp:LoginView ID="lvNewTopic" runat="server">
            <LoggedInTemplate>

                <h2>Create New Topic</h2>
                <p><asp:TextBox ID="tbTopicTitle" CssClass="topictitletextbox" runat="server" ClientIDMode="Static" ToolTip="Topic Title" placeholder="Thread Title"></asp:TextBox></p>
                <nforum:Emoticons ID="emoticonInclude" runat="server" />
                <p><asp:TextBox ID="txtPost" runat="server" TextMode="MultiLine" Rows="14" ClientIDMode="Static"></asp:TextBox></p>
                <asp:Panel ID="pnlMakeSticky" runat="server" Visible="false">
                    <p>Mark as a sticky topic <asp:CheckBox ID="cbSticky" ClientIDMode="Static" runat="server" /></p>
                </asp:Panel>
                <p><asp:Button ID="btnSubmitPost" CssClass="btn btn-primary" runat="server" Text="Create Topic" /></p>

            </LoggedInTemplate>
        </asp:LoginView>
</div>

<div class="postsuccess" style="display: none;">
  <h4 style="text-align: center;">Creating your topic...</h4>
</div>