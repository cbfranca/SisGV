$(document).ready(function(){$(function(){$("#area_tabela .pagination a").live("click",function(){return $.getScript(this.href),!1})}),$("#usuarios_search").submit(function(){return $.get(this.action,$(this).serialize(),null,"script"),!1})});