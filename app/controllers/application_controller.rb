class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :define_user
  protect_from_forgery with: :exception

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :age, :gender, :country, :native_language, :learning_language, :hobby, :tag_list])
    end

    def after_sign_in_path_for(resource)
      posts_path
    end

    def set_search
      @search = User.ransack(params[:q])
      @results = @search.result
    end

    # def define_user
    #   @user = User.find(params[:id])
    # end
end
