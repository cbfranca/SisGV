$(document).ready(function() {

  $(function () {  
      $('#area_tabela .pagination a').live('click',
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
    });
  $("#usuarios_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    }); 
 });