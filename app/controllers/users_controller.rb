class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    render json: @user, serializer: UserSerializer
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
    unless @user
      render json: { error: "User Not Found" }
    end
  end
end
