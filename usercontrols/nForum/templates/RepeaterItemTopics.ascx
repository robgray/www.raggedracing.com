<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RepeaterItemTopics.ascx.cs" Inherits="nForum.usercontrols.nForum.templates.RepeaterItemTopics" %>
<%@ Import Namespace="nForum.BusinessLogic" %>

            <div class="forumtopic">

                <div class='forumtopiclink<%#FTopic.MarkTopicAsSolved %>'>

                        <h3><a href="<%# FTopic.Url%>"<%# ShowAjaxPostLink(FTopic.Id)%>><%# FTopic.NodeName%></a></h3>
                        <p class="topicsubtext">Started By: <%# MembershipHelper.ReturnMemberProfileLink(FTopic.AuthorName, 
                                                            FTopic.ForumTopicOwnedBy, null)%> - 
                                                            <%# Helpers.GetPrettyDate(FTopic.CreateDate.ToString())%></p>
                </div>
                
                <div class="forumtopicreplies">
                    <span><%# (FTopic.ForumPosts.Count() - 1) %></span>
                    Replies
                </div>

                <div class="forumtopicvotes">
                    <span><%# FTopic.SumOfVotesInTopic %></span>Votes
                </div>

                <div class="forumtopiclatestpost">
                    <%# FTopic.LastPostInfo %>
                </div>

            </div>