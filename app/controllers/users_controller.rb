class UsersController < ApplicationController
   add_flash_types :success, :danger, :warning, :info

   def new
      @user = User.new
   end


   def create
      @user = User.new(user_params)
      if @user.save
         redirect_to root_path
         flash[:success] = "Sign up was successfully!"
      else
         respond_to do |format|
            format.html { render :new ,status: :unprocessable_entity}
         end
      end
   end


    private
      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :birthday, :phone)
      end
end
