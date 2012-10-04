/**
* @author Remy Sharp
* @url http://remysharp.com/2007/01/25/jquery-tutorial-text-box-hints/
*/
(function(e){e.fn.hint=function(t){return t||(t="blur"),this.each(function(){function o(){n.val()===r&&n.hasClass(t)&&n.val("").removeClass(t)}var n=e(this),r=n.attr("title"),i=e(this.form),s=e(window);r&&(n.blur(function(){this.value===""&&n.val(r).addClass(t)}).focus(o).blur(),i.submit(o),s.unload(o))})}})(jQuery);