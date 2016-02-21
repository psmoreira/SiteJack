class FuncionarioDatatable < AjaxDatatablesRails::Base

  include ActionView::Helpers::UrlHelper
  include AjaxDatatablesRails::Extensions::Kaminari
  include ActionView::Helpers::NumberHelper
  include ApplicationHelper

  def sortable_columns
    # Declare strings in this format: ModelName.column_name
    @sortable_columns ||= ['funcionarios.nome','funcionarios.contacto', 'funcionarios.precoHora1']
  end

  def searchable_columns
    # Declare strings in this format: ModelName.column_name
    @searchable_columns ||= ['funcionarios.nome','funcionarios.contribuinte','funcionarios.localTrabalho']
  end

  private

  def data
    records.map do |record|
      [
        # comma separated list of the values for each cell of a table row
        # example: record.attribute,
        record.id,
        record.nome,
        record.contacto,
        record.email,
        record.contribuinte,
        number_to_currency(record.precoHora1),
        #record.regularizado,
        content_tag(:div,nil,{class: get_regularizado_class(record.regularizado), style: "text-align:center"}),
        link_to('Editar',"funcionarios/" + record.id.to_s + "/edit",{:class=>"btn btn-info"})
      ]
    end
  end

  def get_raw_records
    # insert query here
    Funcionario.all
  end


  # ==== Insert 'presenter'-like methods below if necessary
end
