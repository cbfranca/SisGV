  $(document).ready(function() {

  $(function(){
    $('#with_date').mask("99/99/9999");         
  });  

  $("#doacoes_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });

   $(function () {  
      $('#area_tabela .pagination a').live('click',
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
    });   

  });

  function BloquearLetras(evento)
   {  
      var tecla; 
      if(window.event) { // Internet Explorer 
          tecla = evento.keyCode; 
      } 
      else{ // Firefox 
          tecla = evento.which; 
      } 
      if(tecla != 44 && tecla != 46)
      { 
        if(tecla >= 48 && tecla <= 57 || tecla == 8 || tecla == 45) return true; 
        return false;      
      }
   }
