  $(document).ready(function() {

    $('#vocacionado_cod_estado').change(function(){ 
      $.getJSON("/estados/" + $(this).val() + '/cidades.json', function(data) {
        $('#vocacionado_cidade_id').empty();        
        $('#vocacionado_cidade_id').append(new Option('Selecione a cidade','',true,true));
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