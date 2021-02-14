module Api
  class UsersController < BaseController
    skip_before_action :authenticate

    def create
      @user = User.create!(user_params)
      render_json({user: serialize_hash(UserSerializer, @users)}, 200, "User created successfully")
    end

    
    private
    def user_params
      params.require(:user).permit(:email, :username, :password)
    end
  end
end