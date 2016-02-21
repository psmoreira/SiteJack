class EventoDatatable < AjaxDatatablesRails::Base

  include ActionView::Helpers::UrlHelper
  include AjaxDatatablesRails::Extensions::Kaminari


  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['eventos.id', 'eventos.descricao','eventos.dataInicio', 'eventos.numPessoas']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['eventos.id','eventos.descricao','eventos.dataInicio','eventos.numPessoas']
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.id,
        record.descricao,
        record.dataInicio,
        record.tipoEvento,
        record.localEvento,
        record.numPessoas,
        link_to('Editar',"eventos/" + record.id.to_s + "/edit",{:class=>"btn btn-info"})
      ]
    end
  end

  def get_raw_records
    # insert query here
    Evento.all
  end

  # ==== Insert 'presenter'-like methods below if necessary
end
