  $(document).ready(function() {

    $('#vocacionado_estado').change(function(){ 
      $.getJSON("/estados/" + $(this).val() + '/cidades.json', function(data) {
        $('#vocacionado_cidade').empty();        
        $('#vocacionado_cidade').append(new Option('Selecione a cidade','0',true,true));
        $.each(data, function(i,item){ 
          $('#vocacionado_cidade').append('<option value="' + item.id + '">' + item.nome + '</option>');
        });
      });
    });
    
  });
