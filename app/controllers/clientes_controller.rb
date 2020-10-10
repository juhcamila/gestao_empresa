class ClientesController < ApplicationController
  before_action :set_cliente, only: [:show, :edit, :update]
  before_action :permit?, only: [:edit, :update]
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  # GET /clientes/new
  def new
    @cliente = Cliente.new
    render layout: 'login'
  end

  # GET /clientes/1/edit
  def edit
  end

  # POST /clientes
  # POST /clientes.json
  def create
    @cliente = Cliente.new(cliente_params)
    respond_to do |format|
      if @cliente.save

        user = User.create(
            email: cliente_params["email"], username: cliente_params["usuario"],
            clientes_id: @cliente.id, manager: true, password: cliente_params["senha"]
        )

        sign_in(user, scope: :user)
        format.html { redirect_to funcionarios_path, notice: 'Cliente criado com sucesso' }
        format.json { render :show, status: :created, location: @cliente }
      else
        format.html { render :new, layout: 'login' }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clientes/1
  # PATCH/PUT /clientes/1.json
  def update
    respond_to do |format|
      if @cliente.update(cliente_params)
        format.html { redirect_to funcionarios_path, notice: 'Cliente alterado com sucesso' }
        format.json { render :show, status: :ok, location: @cliente }
      else
        format.html { render :edit }
        format.json { render json: @cliente.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cliente
      @cliente = Cliente.find(params[:id])
    end

    def permit?
      if @cliente.id != current_user.clientes_id
        redirect_to funcionarios_path
      end
    end

    # Only allow a list of trusted parameters through.
    def cliente_params
      params.require(:cliente).permit(:nome, :email, :descricao, :usuario, :senha)
    end
end
