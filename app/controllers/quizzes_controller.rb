class QuizzesController < ApplicationController

    def index
        @quizzes = Quiz.all
      end
    
      # GET /users/1
      # GET /users/1.json
      def show
      end
    
      # GET /users/new
      def new
        @quiz = Quiz.new
      end
    
      # GET /users/1/edit
      def edit
      end

      def create
        @quiz = Quiz.new(quiz_params)
        if @quiz.save
          redirect_to @user
        else
          render 'new'
        end
      end
    
      private
    
        def user_params
          params.require(:user).permit(:name, :email, :password,
                                       :password_confirmation)
        end

end