class ApplicationController < ActionController::API
    def authorize_user!(action, resource)
      unless current_user.can?(action, resource)
        raise GraphQL::ExecutionError, "You do not have permission to perform this action"
      end
    end
  
    def current_user
      User.find(session[:user_id])
    end
  end
