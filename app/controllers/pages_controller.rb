class PagesController < ApplicationController
  def home
  end

  def start_quiz
    new = params[:new].to_i
    if(new == 1)
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
  
end
