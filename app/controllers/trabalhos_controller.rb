class TrabalhosController < ApplicationController
  before_action :set_trabalho, only: [:show, :edit, :update, :destroy]

  # GET /trabalhos
  # GET /trabalhos.json
  def index

    @sum_trabalho = 0

    respond_to do |format|
      format.html
      format.json { render json: TrabalhoDatatable.new(view_context) }
  end
  end

  # GET /trabalhos/1
  # GET /trabalhos/1.json
  def show
  end

  # GET /trabalhos/new
  def new
    @trabalho = Trabalho.new
  end

  # GET /trabalhos/1/edit
  def edit
  end

  # POST /trabalhos
  # POST /trabalhos.json
  def create
    @trabalho = Trabalho.new(trabalho_params)

    respond_to do |format|
      if @trabalho.save
        format.html { redirect_to @trabalho, notice: 'Trabalho was successfully created.' }
        format.json { render action: 'show', status: :created, location: @trabalho }
      else
        format.html { render action: 'new' }
        format.json { render json: @trabalho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trabalhos/1
  # PATCH/PUT /trabalhos/1.json
  def update
    respond_to do |format|
      if @trabalho.update(trabalho_params)
        format.html { redirect_to @trabalho, notice: 'Trabalho was successfully updated.' }
        format.json { respond_with_bip(@trabalho) }
      else
        format.html { render action: 'edit' }
        format.json { render json: @trabalho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trabalhos/1
  # DELETE /trabalhos/1.json
  def destroy
    @trabalho.destroy
    respond_to do |format|
      format.html { redirect_to trabalhos_url }
      format.json { head :no_content }
    end
  end

  def check
    render json: @trabalho.to_json
  end

  def regularizar
    #recebe a collection
    #Para os Id recebidos
      # chama função que regulariza um trabalho (ou seja, que cria um pagamento)

    params[:ids].each do |id|
      regulariza_trabalho(Trabalho.find(id))
    end unless params[:ids].blank?

    redirect_to :back

    #redirect para funcionario?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trabalho
      @trabalho = Trabalho.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trabalho_params
      params.require(:trabalho).permit!
    end

    def regulariza_trabalho(trab)
      #Update Trabalho
      trab.dataPagamento = Time.now
      trab.regularizado = true
      trab.save

      #Create Pagamento
      trab.pagamento.create({dataCriacao: Time.now, numTotalHoras: trab.noteumTotalHoras,
        numHorasPagas: trab.numHorasPagas,regularizado: true, precoHora1: trab.precoHora1,
        dataPagamento: Time.now, evento_id: trab.evento_id, funcionario_id: trab.funcionario_id,
          precoTotal: trab.precoTotal
        })
    end


end
