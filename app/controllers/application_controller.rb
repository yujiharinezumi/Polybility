class ApplicationController < ActionController::Base
  before_action :set_search
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :age, :gender, :country, :native_language, :learning_language, :hobby])
    end

    def after_sign_in_path_for(resource)
      posts_path
    end

    def set_search
      @search = User.ransack(params[:q])
      @results = @search.result
    end
end
