class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :edit_password]
  before_action :authenticate_user!, only: [:edit, :update, :edit_password]
  before_action :correct_user,   only: [:edit, :update, :edit_password]
  # GET /users
  # GET /users.json
  def index
    @users = User.paginate(page: params[:page], :per_page => 10)
    
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @posts = @user.posts.paginate(page: params[:page], :per_page => 10)
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def edit_password
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    file = params[:user][:image]
    @user.set_image(file)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to CodeMate!"
      
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    file = params[:user][:image]
    @user.set_image(file)
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      if (params[:user][:password])
        render 'edit_password'
      else
        render 'edit'
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
   @user.destroy
   flash[:success] = "User destroyed."
   redirect_to users_url
  end

  def favorite
    @title = 'Favorite posts'
    @post = current_user.posts.build
    @feed_posts = current_user.favorite_posts.paginate(page: params[:page])
    render template: 'about/index'
  end

  def good
    @post = current_user.posts.build
    @feed_posts = current_user.good_posts.paginate(page: params[:page])
    render template: 'about/index'
  end
  def answer_good
    @answer = current_user.answers.build
    @feed_answers = current_user.answer_good_answers.paginate(page: params[:page])
    render template: 'about/index'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile,
   :password_confirmation)
  end

  # Before actions

  def set_user
    @user = User.find(params[:id])
  end

  def signed_in_user
    redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
