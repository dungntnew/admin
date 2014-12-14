module Admin
  class ApplicationController < ActionController::Base
    layout "admin/application"
    
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception
    
    # Define handler for authority
    # def authority_forbidden
    #   # redirect_to request.referrer.presence || root_path, :alert => 'You are not authorized to complete that action.'
    #   render :text => "Hihi"
    #   return
    # end
  end
end
