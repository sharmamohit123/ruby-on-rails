module QuizzesHelper
    def quiz_start(quiz)
        session[:quiz_id] = quiz.id
    end

    # Returns the current logged-in user (if any).
    def current_quiz
        @current_quiz ||= Quiz.find_by(id: session[:quiz_id])
    end

    # Returns true if the user is logged in, false otherwise.
    def play_in?
        !current_quiz.nil?
    end

    def quiz_end
        session[:current1] = -1
        session.delete(:quiz_id)
        @current_quiz = nil
    end
end 