class PagesController < ApplicationController
  def home
  end

  def start_quiz
    @genres = Genre.all
  end

  def show_subgenres
    @all = Subgenre.all
    @subgenres = Subgenre.where(genreId: params[:genreId])
  end

  def show_questions
    @all = Question.all
    @i = params[:i].to_i
    @subgenre_id = params[:subgenreId].to_i
    @questions = Question.where(subgenreId: params[:subgenreId])
    if @i >= @questions.count()
      render 'final_result'
    end
  end

  def result
    @q = Question.find_by(id: params[:question_id])
    @subgenreId = params[:subgenre_id]
    @right = false
    right_ans = @q.answer
    ans = params[:option]
    if ans == right_ans
      @right = true
    end
    @i = params[:q_no].to_i
    @i+=1
    #render 'show_result'
    redirect_to :controller => 'pages', :action => 'show_result' , :i => @i, :right => @right, :s_id => @subgenreId
    #format.html { redirect_to show_result_url(:i => @i, :right => @right), notice: ''  }
    #format.json { render :show_result, status: :ok, location: show_result_url }
    
  end 

  def show_result
    @subgenreId = params[:s_id].to_i
    @i = params[:i]
    @right = params[:right]
  end 
  
  def final_result
  end

end
