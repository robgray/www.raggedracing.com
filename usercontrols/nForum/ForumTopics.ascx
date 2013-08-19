<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumTopics.ascx.cs" Inherits="nForum.usercontrols.nForum.ForumTopics" %>
<%@ Register src="~/usercontrols/nForum/templates/RepeaterItemTopics.ascx" tagname="RepeaterItemTopics" tagprefix="nforum" %>
<%@ Register src="~/usercontrols/nForum/ForumTopicsSticky.ascx" tagname="stickytopics" tagprefix="nforum" %>

    <div id="topiclisthead" class="row">
        <div class="span10">
            <h1><asp:Literal ID="litHeading" runat="server" /></h1>
            <p><asp:Literal ID="litDescription" runat="server" /></p>
        </div>
        <div class="pull-right">
            <asp:HyperLink ID="lRss" runat="server" Visible="false" Text="rss" CssClass="btn btn-primary btn-mini" />
            <asp:HyperLink ID="hlCreateTopic" runat="server" CssClass="btn btn-primary btn-mini" Visible="false" Text="Create a new topic" />
        </div>
    </div>

<nforum:stickytopics ID="rptSticky" runat="server" />

<div id="topiclist" class="topiclist" runat="server">
    <asp:Repeater ID="rptTopicList" runat="server" EnableViewState="false">       
        <ItemTemplate>

            <nforum:RepeaterItemTopics ID="RepeaterItemTopics1" FTopic="<%# Container.DataItem %>" runat="server" />

        </ItemTemplate>
    </asp:Repeater>
</div>

<asp:Literal ID="litPager" runat="server" />

