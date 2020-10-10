class ComentariosController < ApplicationController
  before_action :set_post, only: [:new, :create]
  before_action :set_user, only: [:new, :create]
  before_action :set_cliente, only: [:new, :create]
  before_action :permit?, only: [:new, :create]

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.user_id = @user
    @comentario.cliente_id = @cliente
    @comentario.post_id = @post.id

    respond_to do |format|
      if @comentario.save
        format.html { redirect_to @post, notice: 'Comentário adicionado com sucesso' }
        format.json { render :show, status: :created, location: @comentario }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:post_id])
    end

    def set_user
      @user = current_user.id
    end

    def set_cliente
      @cliente = current_user.clientes_id
    end

    def permit?
      if @post.cliente_id != @cliente
        redirect_to posts_path
      end
    end

    # Only allow a list of trusted parameters through.
    def comentario_params
      params.require(:comentario).permit(:posts_id, :descricao, :clientes_id, :users_id)
    end
end
