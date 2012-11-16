  $(document).ready(function() {
   
    $(function () {  
      $('#area_tabela .pagination a').click(function()
        {
          $('#show_spinner_image').show();
          $('#area_tabela .pagination a').attr('data-remote','true');
        }  
      );  
    });
  

    $("#benfeitores_search").submit(function(){

      $.get(this.action, $(this).serialize(), null, "script");      
      return false;      
   
    });
  });