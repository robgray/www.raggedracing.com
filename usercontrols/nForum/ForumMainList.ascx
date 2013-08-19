<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ForumMainList.ascx.cs" Inherits="nForum.usercontrols.nForum.ForumMainList" %>
<%@ Import Namespace="nForum.BusinessLogic" %>
<%@ Register src="~/usercontrols/nForum/ForumListSubForums.ascx" tagname="ForumListSubForums" tagprefix="uc1" %>

<div id="mainforumlist" class="mainforumlist" runat="server">
    <asp:Repeater ID="rptMainForumList" runat="server" onitemdatabound="HidePrivateCategories" EnableViewState="false">       
        <ItemTemplate>
            <div class="forumcategories">

                <div class="forumcategorieslink">
                        <h3><a href="<%# ((ForumCategory)Container.DataItem).Url%>"><%# ((ForumCategory)Container.DataItem).NodeName%></a></h3>
                        <p class="forumcategoriesdesc"><%# ((ForumCategory)Container.DataItem).ForumCategoryDescription%></p>
                        <uc1:ForumListSubForums ID="ForumListSubForums1" ParentCategoryId="<%# ((ForumCategory)Container.DataItem).Id%>" runat="server" />
                </div>
                
                <div class="forumcategoriesdetails">
                    <%# ((ForumCategory)Container.DataItem).TopicsInCategory.Count() %> Topics
                </div>

                <div class="forumcategorieslatestpost">
                    <%# GetLastPostInCategory((ForumCategory)Container.DataItem)%>
                </div>

            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

