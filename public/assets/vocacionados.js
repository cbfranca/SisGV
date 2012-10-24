  $(document).ready(function() {

      //  $(function(){ 
      //     // find all the input elements with title attributes
      //   $('input[title!=""]').hint();
      // });
       
    // $(function(){
    //   $('#vocacionado_nascimento').datepicker().datepicker('option', 'dateformat', 'dd/mm/yy');      
    // })

  $(function(){
      $('#vocacionado_telefone_residencial').mask("(999) 9999-9999");
      $('#vocacionado_celular').mask("(999) 9999-9999");
      $('#vocacionado_cep').mask("99999-999");
    });

    $(function () {  
      $('#area_tabela .pagination a').click(function()
        {
          $('#show_spinner_image').show();
          $('#area_tabela .pagination a').attr('data-remote','true');
        }  
      );  
    });
 

    $("#vocacionados_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });
  });
