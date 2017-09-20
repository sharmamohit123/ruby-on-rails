class PagesController < ApplicationController
  def home
  end

  def contact
  end

  def start_quiz
    start_new = params[:start_new].to_i
    if(start_new == 1)
      quiz_end
    end 

    if (session[:current1] != -1 && session[:quiz_id]!=0)
      redirect_to :controller => 'pages', :action => 'resume'
    else
      @genres = Genre.all
    end

  end

  def show_subgenres
    @all = Subgenre.all
    @subgenres = Subgenre.where(genreId: params[:genreId])
  end

  def show_questions
    @all = Question.all
    @i = params[:i].to_i
    @subgenre_id = params[:subgenreId].to_i
    @subgenre = Subgenre.find_by(id: @subgenre_id)
    @genre_id = @subgenre.genreId
    @questions = Question.where(subgenreId: params[:subgenreId])
    if @i >= @questions.count()
      #render 'final_result'
      session[:current1]=  -1
      redirect_to :controller => 'pages', :action => 'final_result'
    end
  end

  def result
    @q = Question.find_by(id: params[:question_id])
    @subgenreId = params[:subgenre_id]
    @quizId = params[:quiz_id]
    @right = 0
    right_ans = @q.answer
    ans = params[:option]
    if ans == right_ans
      @right = 1
    end
    @i = params[:q_no].to_i
    @i+=1
    session[:current1]+=1
    #render 'show_result'
    redirect_to :controller => 'pages', :action => 'show_result' , :i => @i, :right => @right, :s_id => @subgenreId, :q_id => @quizId
    #format.html { redirect_to show_result_url(:i => @i, :right => @right), notice: ''  }
    #format.json { render :show_result, status: :ok, location: show_result_url }
    
  end 

  def show_result
    @subgenreId = params[:s_id].to_i
    @quiz = Quiz.find_by(id: params[:q_id])
    @i = params[:i]
    @right = params[:right].to_i
  end 
  
  def final_result
    if play_in? 
      @quiz = Quiz.find_by(id: session[:quiz_id])
      @quiz.status = 'finish'
      @quiz.save
      #quiz_end
    end  
  end

  def resume
    @quiz = Quiz.find_by(id: session[:quiz_id])
    @subgenre_id = @quiz.subgenreId
    @i = session[:current1]    
  end

  def history
  end

  def attempt
    @quiz = Quiz.where(userId: session[:user_id])
  end

  def no_attempt
    @attempt = Hash.new
    @quiz = Quiz.where(userId: session[:user_id])
    @subgenre = Subgenre.all
    @subgenre.each do |subgenre|
      @attempt[subgenre.name] = 0
      @quiz.each do |quiz|
        if (quiz.subgenreId == subgenre.id)
          @attempt[subgenre.name] = 1
        end
      end
    end
  end

  def pause
    @quiz = Quiz.where(userId: session[:user_id], status: 'play')    
  end

  def leaderboard
  end

  def genre_board
    @genres = Genre.all
  end
  
  def subgenre_board
    @subgenres = Subgenre.all
  end

  def show_board
    @score = Hash.new
    genre = params[:genre].to_i
    if (genre == 1)
      @quiz = Quiz.where(genreId: params[:genreId])
    else
      @quiz = Quiz.where(subgenreId: params[:subgenreId])
    end
    @users = User.all
    @users.each do |user|
      @quiz_user = @quiz.where(userId: user.id)
      @score[user.name] = 0
      @quiz_user.each do |quiz|
        @score[user.name] += quiz.score
      end
    end
    @score = @score.sort_by {|key, value| value}.reverse      
  end

  def admin_home
    
  end

end
