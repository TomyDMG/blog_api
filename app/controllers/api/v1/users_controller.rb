class Api::V1::UsersController < Api::V1::ApiApplicationController
  skip_before_action :authenticate_request, only: [:create]


  # POST /api/v1/users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

  # POST /api/v1/upload_avatar.json
  def upload_avatar
    if current_user.update(params.permit(:avatar))
      render json: { url: current_user.avatar.url(:medium) }
    else
      render status: :not_acceptable, json: { errors: current_user.errors }
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :nickname, :avatar)
  end
end
