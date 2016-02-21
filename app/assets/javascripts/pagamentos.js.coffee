# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $('#pagamentos-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#pagamentos-table').data('source')
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
    footerCallback: (row, data, start, end, display) ->
      api = @api()
  # Remove the formatting to get integer data for summation

      intVal = (i) ->
        if typeof i == 'string' then i.replace(/,+/g,'.').replace(/[^(0-9.)]+/g, '') * 1 else if typeof i == 'number' then i else 0

  # Total over all pages
      total = api.column(5).data().reduce(((a, b) ->
        intVal(a) + intVal(b)
      ), 0)
  # Total over this page
      pageTotal = api.column(5, page: 'current').data().reduce(((a, b) ->
        intVal(a) + intVal(b)
      ), 0)
  # Update footer
      $(api.column(5).footer()).html   total + '€'
