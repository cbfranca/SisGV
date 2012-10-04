/*

CUSTOM FORM ELEMENTS

Created by Ryan Fait
www.ryanfait.com

The only things you may need to change in this file are the following
variables: checkboxHeight, radioHeight and selectWidth (lines 24, 25, 26)

The numbers you set for checkboxHeight and radioHeight should be one quarter
of the total height of the image want to use for checkboxes and radio
buttons. Both images should contain the four stages of both inputs stacked
on top of each other in this order: unchecked, unchecked-clicked, checked,
checked-clicked.

You may need to adjust your images a bit if there is a slight vertical
movement during the different stages of the button activation.

The value of selectWidth should be the width of your select list image.

Visit http://ryanfait.com/ for more information.

*/
var checkboxHeight="25",radioHeight="25",selectWidth="190";document.write('<style type="text/css">input.styled, input.styled2, input.styled3 { display: none; } select.styled, select.styled2, select.styled3 { position: relative; width: '+selectWidth+"px; opacity: 0; filter: alpha(opacity=0); z-index: 5; } .disabled { opacity: 0.5; filter: alpha(opacity=50); } </style>");var Custom={init:function(){var e=document.getElementsByTagName("input"),t=Array(),n,r,i;for(a=0;a<e.length;a++)(e[a].type=="checkbox"||e[a].type=="radio")&&e[a].className=="styled"&&(t[a]=document.createElement("span"),t[a].className=e[a].type,e[a].checked==1&&(e[a].type=="checkbox"?(position="0 -"+checkboxHeight*2+"px",t[a].style.backgroundPosition=position):(position="0 -"+radioHeight*2+"px",t[a].style.backgroundPosition=position)),e[a].parentNode.insertBefore(t[a],e[a]),e[a].onchange=Custom.clear,e[a].getAttribute("disabled")?t[a].className=t[a].className+=" disabled":(t[a].onmousedown=Custom.pushed,t[a].onmouseup=Custom.check));e=document.getElementsByTagName("select");for(a=0;a<e.length;a++)if(e[a].className=="styled text_select"||e[a].className=="styled2 text_select"||e[a].className=="styled3 text_select"){r=e[a].getElementsByTagName("option"),i=r[0].childNodes[0].nodeValue,n=document.createTextNode(i);for(b=0;b<r.length;b++)r[b].selected==1&&(n=document.createTextNode(r[b].childNodes[0].nodeValue));t[a]=document.createElement("span"),e[a].className=="styled text_select"?t[a].className="select text_select":e[a].className=="styled2 text_select"?t[a].className="select2 text_select ":t[a].className="select3 text_select",t[a].id="select"+e[a].name,t[a].appendChild(n),e[a].parentNode.insertBefore(t[a],e[a]),e[a].getAttribute("disabled")?e[a].previousSibling.className=e[a].previousSibling.className+=" disabled":e[a].onchange=Custom.choose}document.onmouseup=Custom.clear},pushed:function(){element=this.nextSibling,element.checked==1&&element.type=="checkbox"?this.style.backgroundPosition="0 -"+checkboxHeight*3+"px":element.checked==1&&element.type=="radio"?this.style.backgroundPosition="0 -"+radioHeight*3+"px":element.checked!=1&&element.type=="checkbox"?this.style.backgroundPosition="0 -"+checkboxHeight+"px":this.style.backgroundPosition="0 -"+radioHeight+"px"},check:function(){element=this.nextSibling;if(element.checked==1&&element.type=="checkbox")this.style.backgroundPosition="0 0",element.checked=!1;else{if(element.type=="checkbox")this.style.backgroundPosition="0 -"+checkboxHeight*2+"px";else{this.style.backgroundPosition="0 -"+radioHeight*2+"px",group=this.nextSibling.name,inputs=document.getElementsByTagName("input");for(a=0;a<inputs.length;a++)inputs[a].name==group&&inputs[a]!=this.nextSibling&&(inputs[a].previousSibling.style.backgroundPosition="0 0")}element.checked=!0}},clear:function(){inputs=document.getElementsByTagName("input");for(var e=0;e<inputs.length;e++)inputs[e].type=="checkbox"&&inputs[e].checked==1&&inputs[e].className=="styled"?inputs[e].previousSibling.style.backgroundPosition="0 -"+checkboxHeight*2+"px":inputs[e].type=="checkbox"&&inputs[e].className=="styled"?inputs[e].previousSibling.style.backgroundPosition="0 0":inputs[e].type=="radio"&&inputs[e].checked==1&&inputs[e].className=="styled"?inputs[e].previousSibling.style.backgroundPosition="0 -"+radioHeight*2+"px":inputs[e].type=="radio"&&inputs[e].className=="styled"&&(inputs[e].previousSibling.style.backgroundPosition="0 0")},choose:function(){option=this.getElementsByTagName("option");for(d=0;d<option.length;d++)option[d].selected==1&&(document.getElementById("select"+this.name).childNodes[0].nodeValue=option[d].childNodes[0].nodeValue)}};window.onload=Custom.init;