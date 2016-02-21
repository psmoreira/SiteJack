class TrabalhoDatatable < AjaxDatatablesRails::Base

  def_delegator :@view, :best_in_place
  def_delegator :@view, :check_box_tag

  include ActionView::Helpers::UrlHelper
  include AjaxDatatablesRails::Extensions::Kaminari
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper



  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['trabalhos.id','eventos.descricao']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['trabalhos.id','eventos.descricao']
  end

  private

  def data

    records.map do |record|
      [
        record.id,
        record.descricao,
        record.tipoEvento,
        parse_date(record.dataTrabalho,:date),
        parse_date(record.dataHoraInicio),
        parse_date(record.dataHoraFim),
        best_in_place(record, 'numHorasPagas'),
        number_to_currency(record.precoTotal),
        check_box_tag('ids[]',record.id, false,{class: "updateFooter"}),
        link_to('Ver Evento',Rails.application.routes.url_helpers.evento_path(record.evento_id.to_s) ,{:class=>"btn btn-info"})
      ]
    end
  end

  def get_raw_records
    # insert query here
    if @view.params.has_key?(:funcionario_id)
      Trabalho.joins(:funcionario, :evento).select('trabalhos.id, eventos.descricao, eventos.tipoEvento, trabalhos.*').where(funcionario_id: @view.params[:funcionario_id]).where(regularizado: false)
    else
      Trabalho.all
    end
  end
end
