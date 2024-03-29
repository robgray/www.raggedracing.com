<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AjaxCommentForm.ascx.cs" Inherits="Runway.Blog.usercontrols.AjaxCommentForm" %>


<asp:PlaceHolder ID="ph_closed" runat="server" Visible="false">
    <p class="blogCommentsClosed umbError">
        <%= CommentsClosedMessage %>
    </p>
</asp:PlaceHolder>

<asp:PlaceHolder ID="ph_form" Visible="false" runat="server">
<div id="commentform" class="post-comment">
<div id="gravatar" style="display: none; height: 80px; width:80px;"></div>

    <div class="control-group">
		<label for="author" class="control-label">
		   <%= Runway.Blog.BlogLibrary.Dictionary("#Name","Your name") %>:
		</label>    
		<div class="controls">
			<input type="text" id="author" name="name" class="input-text required" placeholder="Your Name" />
		</div>
	</div>

    <div class="control-group">
		<label for="email" class="fieldLabel">
			<%= Runway.Blog.BlogLibrary.Dictionary("#Email","Email address") %>:
		</label>
    
		<div class="controls">
			<input type="text" id="email" name="email" class="input-text required email" placeholder="Your Email (for gravatar)" />
		</div>
	</div>
	
    <div class="control-group">
		<label for="url" class="fieldLabel">
			<%= Runway.Blog.BlogLibrary.Dictionary("#Website","Website url") %>:
		</label>
		<div class="controls">
			<input type="text" id="url" name="website"  class="input-text url" placeholder="Linky goodness from your name" />
		</div>
    </div>
	
    <div class="control-group">
		<label for="comment" class="fieldLabel">
			<%= Runway.Blog.BlogLibrary.Dictionary("#Comment","Your message") %>:
		</label>		
		<div class="controls">
			<textarea id="comment" cols="20" name="comment" rows="7" class="required")></textarea>
		</div>
	</div<
    <div class="well">
		<input type="submit" id="submit" class="btn btn-success submit" value="<%= Runway.Blog.BlogLibrary.Dictionary("#Submit","Post Comment") %>" />
    </div>
</div>

<div id="commentLoading" style="display: none">
    <%= Runway.Blog.BlogLibrary.Dictionary("#CommentLoading","Your comment is being submitted, please wait") %>
</div>

<div id="commentPosted" style="display: none">
    <%= Runway.Blog.BlogLibrary.Dictionary("#CommentPosted","Your comment has been posted, thank you very much") %>
</div>


<script type="text/javascript">
    jQuery(document).ready(function(){
          
          
          jQuery("#commentform #email").blur(function(){
                var email = jQuery("#commentform #email").val();
                                
                if(email != ""){
                    var url = "/base/umbBlog/GetGravatarImage/" + email + "/80.aspx";
                    jQuery.get(url, function(data){
                        if(data != ""){
                             jQuery("#gravatar").css( "background-image","url(" + data + ")" ).show();
                        }else{
                            jQuery("#gravatar").hide();
                        }
                    });
                }
          });
            
          jQuery("form").validate({
          	submitHandler: function(form) {
			    jQuery("#commentform").hide();
			    jQuery("#commentLoading").show();
			    jQuery("#commentform #submit").attr("enabled", false);
			    
			    var url = "/base/umbBlog/CreateComment/<umbraco:Item field="pageID" runat="server"/>.aspx";
			    
				jQuery.post(url, { author: jQuery("#commentform #author").val(), email: jQuery("#commentform #email").val(), url: jQuery("#commentform #url").val(), comment: jQuery("#commentform #comment").val() },
                   function(data){
                
                    jQuery("#commentLoading").hide();
                    jQuery("#commentPosted").show().removeClass("error");
                   
                    if(data == 0){
                          jQuery("#commentPosted").addClass("error").html(" <%= Runway.Blog.BlogLibrary.Dictionary("#CommentFailend","Your comment could not be posted, we're very sorry for the inconvenience") %> ");
                          jQuery("#commentform").show();
                          jQuery("#commentform #submit").attr("enabled", true);
                    }
                    
                   });
			}
			});
    });
</script>
</asp:PlaceHolder>