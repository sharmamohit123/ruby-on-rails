module SessionsHelper
    def log_in(user)
        session[:user_id] = user.id
        if (user.current1 == nil )
            session[:current1] = -1
        else
            session[:current1] = user.current1
        end
        session[:quiz_id] = user.current
    end

    def admin_log_in(user)
        session[:user_id] = user.id
        session[:admin] = 1
    end
    
      # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end
    
      # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    def log_out
        @user =  User.find_by(id: session[:user_id])
        #@user.current1 = session[:current1]
        #@user.save
        @user.update_attribute(:current1, session[:current1])
        if play_in?
            @user.update_attribute(:current, session[:quiz_id])
        else
            @user.update_attribute(:current, 0)
        end
            #@current = @user.current1
        session.delete(:user_id)
        session.delete(:current1)
        @current_user = nil
        session.delete(:quiz_id)
        session.delete(:admin)
        @current_quiz = nil
    end

    def admin_log_out
        session.delete(:user_id)
        session.delete(:admin)
        @current_user = nil        
    end

end
