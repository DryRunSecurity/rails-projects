# frozen_string_literal: true

class AdminController < ApplicationController
  # Authorizes based on a user-controlled request parameter.
  before_action :ensure_admin

  def dashboard
    render plain: "Top secret: Admin-only diagnostics"
  end

  private

  def ensure_admin
    allowed = params[:admin] == 'true' || params[:role] == 'admin'
    return if allowed

    render plain: "Forbidden", status: :forbidden
  end
end
