  $(document).ready(function() {

  $(function(){
      $('#benfeitor_telefone_residencial').mask("(999) 9999-9999");
      $('#benfeitor_celular').mask("(999) 9999-9999");
      $('#benfeitor_cep').mask("99999-999");
    });

    $(function () {  
      $('#area_tabela .pagination a').live('click',
        function () {  
          $.getScript(this.href);  
          return false;  
        }  
      );  
    });
    

    $('#benfeitor_cod_estado').change(function(){ 
      $.getJSON("/estados/" + $(this).val() + '/cidades.json', function(data) {
        $('#benfeitor_cidade_id').empty();                
        $('#benfeitor_cidade_id').append(new Option('Selecione', '', true, true));
        $.each(data, function(i,item){ 
          $('#benfeitor_cidade_id').append('<option value="' + item.id + '">' + item.nome + '</option>');
        });        
      });
    });    

    $("#benfeitores_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });
  });