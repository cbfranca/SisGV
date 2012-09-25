  $(document).ready(function() {

  $(function(){
      $('#with_date').mask("99/99/9999");
    });

  $("#observacao_vocacionadas_search").submit(function(){

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