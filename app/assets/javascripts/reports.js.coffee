# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  
  table = $(".datatable").dataTable
            sDom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>"
            sPaginationType: "bootstrap"
            bSort: false

  $("input#region-filter").on 'change', ->
    table.fnFilter( this.value, 2 )
  
  $("button.region-btn").on 'click', ->
    if $(this).hasClass("btn-primary")
      $("button.region-btn").removeClass("btn-primary")
      $("input#region-filter").val("").change()
    else
      $("button.region-btn").removeClass("btn-primary")      
      $(this).addClass("btn-primary")
      $("input#region-filter").val($(this).text()).change()

