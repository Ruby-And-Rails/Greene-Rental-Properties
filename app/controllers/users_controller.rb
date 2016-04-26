class UsersController < ApplicationController
  before_action :require_login, except: [:home, :login, :register, :create_register, :create_login, :forgot_password, :check_username, :check_email]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  layout :resolve_layout

  # GET /users
  # GET /users.json
  def home
    @page = Page.find_by_seo('home')
    @title = @page.title
    @description = @page.description
    
    #getProperties
    @properties = Property.eager_load(:property_images).group("property_id")
    #@properties = Property.first.property_images.first
  end
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.fetch(:user, {})
  end
    
  def resolve_layout
    case action_name
    when "login", "register","register_success"
      "login"
    when "my_profile", "dashboard"
      "admin_layout"
    else
      "application"
    end
  end
end
