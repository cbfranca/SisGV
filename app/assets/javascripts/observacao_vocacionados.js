  $(document).ready(function() {

  $(function(){
      $('#with_date').mask("99/99/9999");
    });

  $("#observacao_vocacionados_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });

  });