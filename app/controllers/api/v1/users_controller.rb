class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy, :allocate_mob]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end
  def allocate_mob
    mob_no = params[:telephone] || random_telephone
    if @user.update!(telephone: mob_no)
      render json: { message: "Mobile num allocated succesfully", User: @user.to_json}, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity

    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  def random_telephone
    rand(111111111..9999999999).to_s.gsub(/^(\d{3})(\d{3})(\d{4})$/, '\1-\2-\3')
  end
  #only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :telephone)
  end
end
