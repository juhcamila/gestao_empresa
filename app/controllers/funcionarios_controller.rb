class FuncionariosController < ApplicationController
  respond_to :html
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_cliente, only: [:index, :new, :create, :edit, :update]
  before_action :permit?, only: [:new, :create, :index]
  before_action :permit_edit?, only: [:edit, :update]

  def index
    @users = User.where(clientes_id: @cliente, manager: false)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(funcionario_params)
    @user.clientes_id = @cliente

    respond_to do |format|
      if @user.save
        format.html { redirect_to funcionarios_path, notice: 'Usuário Cadastrado com sucesso' }
        format.json { render :index, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(funcionario_params)
        format.html { redirect_to funcionarios_path, notice: 'Usuário alterado com sucesso' }
        format.json { render :index, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to funcionarios_path, notice: 'Usuário excluído com sucesso' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_cliente
    @cliente = current_user.clientes_id
  end

  def permit?
    if @cliente != current_user.clientes_id
      redirect_to funcionarios_path
    end
  end

  def permit_edit?
    if @user.clientes_id != current_user.clientes_id
      redirect_to funcionarios_path
    end
  end

  def funcionario_params
    params.require(:user).permit(:email, :password, :username).merge(manager: false)
  end
end
