# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  table = $('#trabalhos-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#trabalhos-table').data('source')
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
      className: 'dt-body-center'
      targets: 8
      ]
  $('#trabalhos-table tbody').on 'click', 'input.updateFooter', ->
    api = table.api()
    $row = $(this).closest('tr')
    rowdata = table.fnGetData($row);
    valor = rowdata[7]
    val = $('#footer-trabalhos-table').attr('valortotal')
    num = 0
    if typeof valor == 'string' then num = valor.replace(/,+/g,'.').replace(/[^(0-9.)]+/g, '') * 1 else if typeof valor == 'number' then num = valor else num = 0
    newVal = if @checked then parseFloat(val) + num else parseFloat(val) - num
    if newVal < 0 then newVal = 0
    $('#footer-trabalhos-table').attr('valortotal', newVal)
    $(api.column(7).footer()).html  newVal.toFixed(2) + '€'

  $('#trabalhos-table').on 'draw.dt', ->
    $('#footer-trabalhos-table').attr('valortotal','0')
    api = table.api()
    $(api.column(7).footer()).html  '0€'

table2 = $('#trabalhos-all-table').dataTable
  processing: true
  serverSide: true
  ajax: $('#trabalhos-table').data('source')
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
