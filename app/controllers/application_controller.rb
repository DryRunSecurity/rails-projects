class ApplicationController < ActionController::API
  def authorize_user!(action, resource)
    # this is a test
    unless current_user.can?(action, resource)
      raise GraphQL::ExecutionError, "You do not have permission to perform this action"
    end
  end

  def current_user
    # Assume some method to fetch the current user, e.g., from a session or token
    User.find(session[:user_id])
  end
end