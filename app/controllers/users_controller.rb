class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice] = "Welcome to the mokoblog #{@user.username}, your account has been successfully created"
			redirect_to articles_path
		else
			render :new
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:notice] = "Hey #{@user.username}, your account has been successfully updated"
			redirect_to articles_path
		else
			render :new
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end