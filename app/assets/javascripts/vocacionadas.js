  $(document).ready(function() {

  $(function(){
      $('#vocacionada_telefone_residencial').mask("(999) 9999-9999");
      $('#vocacionada_celular').mask("(999) 9999-9999");
      $('#vocacionada_cep').mask("99999-999");
    });

    $(function () {  
      $('#area_tabela .pagination a').live('click',
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
    });
    

    $('#vocacionada_cod_estado').change(function(){ 
      $.getJSON("/estados/" + $(this).val() + '/cidades.json', function(data) {
        $('#vocacionada_cidade_id').empty();                
        $('#vocacionada_cidade_id').append(new Option('Selecione', '', true, true));
        $.each(data, function(i,item){ 
          $('#vocacionada_cidade_id').append('<option value="' + item.id + '">' + item.nome + '</option>');
        });        
      });
    });    

    $("#vocacionadas_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });
  });