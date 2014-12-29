class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :best_answer]
  before_action :authenticate_user!, only: [:create, :destroy, :edit]
  before_action :correct_user,   only: [:destroy, :edit]

  # GET /posts
  # GET /posts.json
  def question
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @answer = Answer.new
    @tags = @post.tags

    
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
    @post.user_id = current_user.id
   
    respond_to do |format|
      if @post.save
        current_user.update(point: current_user.point + 1)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
        
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    redirect_to root_url
  end

  def answer
    @post = current_user.posts.build(content: params[:post][:content])
    @post.answer_to = params[:id]
    if @post.save
      flash[:success] = "Answer created!"
      redirect_to @post
    else
      @posts = current_user.posts.paginate(page: params[:page])
      render 'about/index'
    end
  end

  def sort
    sort_type = params[:type]
    case sort_type
    when 'new'
      @posts = Post.order(:created_at).limit(10).reverse_order
    when 'popular'
      @posts = Post.order(:favorites_count).limit(10).reverse_order
    when 'noanswer'
      @posts = Post.where(answers_count: 0).limit(10).all.order(:created_at)
    when 'question'
      @posts = current_user.posts.limit(10)
    when 'favorite'
      @posts = current_user.favorite_posts.limit(10)
    when 'nosolved'
      @posts = Post.where(best_answer: 0).limit(10).order(:created_at)
    end
  end
 

  def best_answer
    @post.best_answer = params[:answer_id]
    @post.save
    current_user.update(point: current_user.point + 1)
    @answer = Answer.find(params[:answer_id])
    @answer.user.update(point: @answer.user.point + 5)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params

      params.require(:post).permit(:content,:title,:tag_list,:image_post)
    end

    def correct_user
      @post = Post.find_by(id: params[:id])
      redirect_to root_url unless current_user?(@post.user)
    end

    def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
end

  