  $(document).ready(function() {

  $(function(){
      $('#vocacionada_telefone_residencial').mask("(999) 9999-9999");
      $('#vocacionada_celular').mask("(999) 9999-9999");
      $('#vocacionada_cep').mask("99999-999");
    });

      $(function () {  
      $('#area_tabela .pagination a').click(function()
        {
          $('#show_spinner_image').show();
          $('#area_tabela .pagination a').attr('data-remote','true');
        }  
      );  
    });
    
    $("#vocacionadas_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });
  });