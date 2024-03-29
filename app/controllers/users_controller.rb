class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def edit
		@user = User.find(params[:id])
		@roles = Role.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to edit_user_path(@user)
		else
			p @user.errors.full_messages.join(', ')
			render 'edit'
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, role_users_attributes: [:id, :role_id, :_destroy])
	end

end
