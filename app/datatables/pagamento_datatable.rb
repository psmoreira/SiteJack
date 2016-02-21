class PagamentoDatatable < AjaxDatatablesRails::Base


  include ActionView::Helpers::UrlHelper
  include AjaxDatatablesRails::Extensions::Kaminari
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper


  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['pagamentos.id','eventos.descricao', 'pagamentos.dataPagamento']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['pagamentos.id','eventos.descricao', 'pagamentos.dataPagamento']
  end


  private

  def data
    records.map do |record|
      [
        record.id,
        record.descricao,
        parse_date(record.dataInicio, :date),
        parse_date(record.dataPagamento, :date),
        record.numHorasPagas,
        number_to_currency(record.precoTotal),
        link_to('Ver Evento',Rails.application.routes.url_helpers.evento_path(record.evento_id.to_s) ,{:class=>"btn btn-info"})
      ]
    end
  end

  def get_raw_records
    if @view.params.has_key?(:funcionario_id)
      Pagamento.joins(:funcionario, :evento).select('eventos.*, pagamentos.*').where(funcionario_id: @view.params[:funcionario_id])
    else
      Pagamento.all
    end
  end

end
