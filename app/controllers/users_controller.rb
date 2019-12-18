class UsersController < ApplicationController

    before_action :authenticate_user!, only: [:show, :new, :index, :edit]
    before_action :correct_user, only: [:edit, :update]

    def new
		@user = User.new
    end
    def create
    	@user = User.new(user_params)
    	@user.user_id = current_user.user_id
    	if @user.save
    	   redirect_to users_path
        else
            render 'index'
        end
    end
    def index
        @user = current_user
        @users = User.all
        @book = Book.new
        @books = Book.all
    end
    def show
        @book = Book.new
        @books = Book.all
        @user = User.find(params[:id])
        @users = User.all
    end
    def edit
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
           redirect_to user_path(@user.id), notice: "You have updated user successfully."
        else
           render 'edit'
        end
    end

    private
    	def user_params
    		params.require(:user).permit(:name, :profile_image, :introduction)
    	end

        def correct_user
            @user = User.find(params[:id])
            if @user.id != current_user.id
               redirect_to user_path(current_user.id)
            end
        end
end
