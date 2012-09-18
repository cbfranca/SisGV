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
      $('#area_tabela .pagination a').live('click',
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
    });
    

    $('#vocacionado_cod_estado').change(function(){ 
      $.getJSON("/estados/" + $(this).val() + '/cidades.json', function(data) {
        $('#vocacionado_cidade_id').empty();                
        $('#vocacionado_cidade_id').append(new Option('Selecione', '', true, true));
        $.each(data, function(i,item){ 
          $('#vocacionado_cidade_id').append('<option value="' + item.id + '">' + item.nome + '</option>');
        });        
      });
    });    

    $("#vocacionados_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });
  });