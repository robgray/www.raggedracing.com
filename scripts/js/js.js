var $j = jQuery.noConflict();


function triangleOverlap() {
  var canvas_i = 0;
  var cwidth = $j(window).width();
  var canvas_support = true;
  if ( $j.browser.msie == true && $j.browser.version < 9 ) {
    canvas_support = false;
  }
  $j('.triangle_top').each(function() {
    if ( canvas_support == true && slanted_panels == "true" ) {
      if ($j('#canvas_'+canvas_i).length == 0) {
        $j(this).append('<canvas id="canvas_'+canvas_i+'" width="'+cwidth+'" height="85"></canvas>');
      } else {
        $j('#canvas_'+canvas_i).remove();
        $j(this).append('<canvas id="canvas_'+canvas_i+'" width="'+cwidth+'" height="85"></canvas>');
      }
      $j('#canvas_'+canvas_i).css({"position" : "absolute", "top" : -85, "z-index" : 100});
      
      var canvas = document.getElementById("canvas_"+canvas_i);
      if (canvas.getContext) {
        
        var ctx = canvas.getContext("2d");
        var triangle_bg;
          triangle_bg = $j(this).css("background-color");
          triangle_image = $j(this).css("background-image").replace('url("', "").replace('")', "");
        
        if (triangle_bg == "transparent" || triangle_bg == 'rgba(0, 0, 0, 0)') {
          var tmpclassO = $j(this).attr("class");
          var tmpclassO = tmpclassO.split(" ");
          var tmpclass = tmpclassO[0].split("_");
          
          if ( tmpclass[0] == 'color' ) {
            triangle_bg = "#"+tmpclass[1];
            $j(this).css({"background-color" : triangle_bg});
          } else {
            triangle_bg = "no color found";
          }
          
          var tmpBottom = tmpclassO[1].split("_");
          if (tmpBottom[0] == 'height')
          {            
            $j(this).css({"padding-bottom" : tmpBottom[1]});
          } else {
            $j(this).css({"padding-bottom" : 65});
          }

          
        }
        
        if ( triangle_bg == "no color found" ) {
          triangle_bg = $j("body").css("background-color");
          
          var body_img = $j("body").css("background-image").replace('url("', "").replace('")', "").replace('url(', '')
.replace(')', '');
          if (body_img != 'none') {
            var p_img = new Image();  
            p_img.src = body_img;
            try {
              triangle_bg = ctx.createPattern(p_img, 'repeat');
            } catch (err) { }
          }
        }
        
        if (triangle_image != "none") {
          var p_img = new Image();  
          p_img.src = triangle_image;
          triangle_bg = ctx.createPattern(p_img, 'repeat');
        }
        
        ctx.clearRect(0,0, canvas.width, canvas.height);
        ctx.fillStyle = triangle_bg;
        ctx.beginPath();  
        ctx.moveTo(0,85);  
        ctx.lineTo(cwidth, 0);
        ctx.lineTo(cwidth, 85);  
        ctx.closePath();
        ctx.fill();  
      }
      canvas_i++;
    } else {
      //IE or slanted panels are switched off
      var triangle_bg = $j(this).css("background-color");
      if (triangle_bg == "transparent" || triangle_bg == 'rgba(0, 0, 0, 0)') {
        var tmpclass = $j(this).attr("class");
        tmpclass = tmpclass.split(" ");
        tmpclass = tmpclass[0].split("_");
        
        if ( tmpclass[0] == 'color' ) {
          triangle_bg = "#"+tmpclass[1];
          $j(this).css({"background-color" : triangle_bg});
        }
      }
    }
  });
}

function initJsSweetness() {    

}

jQuery(document).ready(function($j) {
  triangleOverlap();  
});

jQuery(window).resize(function() {
  triangleOverlap();
});

jQuery(window).load(function() {  
  triangleOverlap();
});


(function($j) {
    var userAgent = navigator.userAgent.toLowerCase();

    $j.browser = {
        version: (userAgent.match( /.+(?:rv|it|ra|ie)[\/: ]([\d.]+)/ ) || [0,'0'])[1],
        safari: /webkit/.test( userAgent ),
        opera: /opera/.test( userAgent ),
        msie: /msie/.test( userAgent ) && !/opera/.test( userAgent ),
        mozilla: /mozilla/.test( userAgent ) && !/(compatible|webkit)/.test( userAgent )
    };

})(jQuery);