$('document').ready(function() {

  $('.dataTable').dataTable({
    columnDefs: [
      { targets: 'no-sort', orderable: false }
    ]
  });

  $('.table #selectAll').on('click', function(){
    if ($(this).is(':checked')){
      $(this).closest('.table').find('td:first-child input[type=checkbox]').prop('checked', true)
    }else{
      $(this).closest('.table').find('td:first-child input[type=checkbox]').prop('checked', false)
    }
  });

  $("#start_date").datepicker({
    orientation: 'bottom',
    autoclose: true
  }).on('changeDate', function(selected) {
    var startDate = new Date(selected.date.valueOf());
    $('#end_date').datepicker('setStartDate', startDate);
  });
  
  $("#end_date").datepicker({
    orientation: 'bottom',
    autoclose: true
  }).on('changeDate', function(selected) {
    var startDate = new Date(selected.date.valueOf());
    $('#start_date').datepicker('setEndDate', startDate);
  });

  $('.upld1-img').on('change','input', function(e){

    readURL(this);

  });

  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      // console.log(reader);
      reader.onload = function (e) {  
        $(input).parents('.upld1-img').find('.upld-item').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
});