class PacientesController < ApplicationController
  before_action :set_paciente, only: %i[ show edit update destroy ]

  # GET /pacientes or /pacientes.json
  def index
    @pacientes = Paciente.all
  end

  # GET /pacientes/1 or /pacientes/1.json
  def show
  end

  # GET /pacientes/new
  def new
    @paciente = Paciente.new
    @paciente.build_endereco
  end

  # GET /pacientes/1/edit
  def edit
  end

  # POST /pacientes or /pacientes.json
  def create
    puts paciente_params
    puts endereco_params
    @paciente = Paciente.new(paciente_params)
    @paciente.build_endereco(endereco_params)

    respond_to do |format|
      if @paciente.save
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully created with Endereco." }
        format.json { render :show, status: :created, location: @paciente }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pacientes/1 or /pacientes/1.json
  def update
    respond_to do |format|
      if @paciente.update(paciente_params) && @paciente.endereco.update(endereco_params)
        format.html { redirect_to paciente_url(@paciente), notice: "Paciente was successfully updated." }
        format.json { render :show, status: :ok, location: @paciente }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paciente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pacientes/1 or /pacientes/1.json
  def destroy
    @paciente.destroy

    respond_to do |format|
      format.html { redirect_to pacientes_url, notice: "Paciente was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def agendar_consulta
    @paciente = Paciente.find(params[:id])
    @consulta = @paciente.consultums.build(consultum_params)

    if @consulta.save
      redirect_to @paciente, notice: 'Consulta agendada com sucesso.'
    else
      render :show
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_paciente
    @paciente = Paciente.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def paciente_params
    params.require(:paciente).permit(:nome_completo, :data_nascimento, :CPF, :email)
  end

  def endereco_params
    params.require(:paciente).permit(:CEP, :cidade, :bairro, :logradouro, :complemento)
  end

  def consultum_params
    params.require(:consulta).permit(:data, :horario, :medico_id)
  end
end
