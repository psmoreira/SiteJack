# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#funcionarios-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#funcionarios-table').data('source')
    pagingType: 'full_numbers'
    language: {
          "sProcessing":   "A processar...",
          "sLengthMenu":   "Mostrar _MENU_ registos",
          "sZeroRecords":  "Não foram encontrados resultados",
          "sInfo":         "Mostrando de _START_ até _END_ de _TOTAL_ registos",
          "sInfoEmpty":    "Mostrando de 0 até 0 de 0 registos",
          "sInfoFiltered": "(filtrado de _MAX_ registos no total)",
          "sInfoPostFix":  "",
          "sSearch":       "Procurar:",
          "sUrl":          "",
          "oPaginate": {
              "sFirst":    "Primeiro",
              "sPrevious": "Anterior",
              "sNext":     "Seguinte",
              "sLast":     "Último"
          }
        }
  columnDefs: [
    {
      targets: 5 # targets last column, use 0 for first column
      className: 'dt-body-center'
    }
  ]
