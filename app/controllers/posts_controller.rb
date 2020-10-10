class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:index, :new, :create]
  before_action :set_cliente, only: [:index, :new, :create, :show]
  before_action :permit?, only: [:show]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.where(cliente_id: @cliente)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.cliente_id = @cliente
    @post.user_id = @user

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = current_user.id
    end

    def set_cliente
      @cliente = current_user.clientes_id
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def permit?
      if @post.cliente_id != @cliente
        redirect_to posts_path
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:descricao, :assunto, :clientes_id, :users_id)
    end
end
