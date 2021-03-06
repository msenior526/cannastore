module ApplicationHelper
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
      end
    
      def logged_in?
        !!current_user
      end

      def log_in(user)
        session[:user_id] = user.id
      end

      def redirect_if_not_logged_in
        if !logged_in?
          redirect_to login_path
        end
      end

      def redirect_if_logged_in
        if logged_in?
          redirect_to user_path(current_user)
        end
      end
end
