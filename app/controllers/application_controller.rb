class ApplicationController < ActionController::Base
    helper_method :current_user

  def current_user
    return @current_user if @current_user.present?

    if cookies[:user_id].present?
      @current_user = User.find_by(id: cookies[:user_id])
    else
      @current_user = User.generate
      cookies[:user_id] = @current_user.id
      @current_user
    end

    if @current_user.nil?
      @current_user = User.generate
      cookies[:user_id] = @current_user.id
      @current_user
    end

    @current_user
  end

end
