class ApplicationController < ActionController::Base
  before_action :set_search
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception
  before_action :set_locale


  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :icon])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :icon, :age, :gender,
                                        :country, :native_language, :learning_language,:introduction,
                                        label_ids: [] ])

    end

    def after_sign_in_path_for(resource)
      users_path
    end

    def set_search
      @search = User.ransack(params[:q])
      @results = @search.result
    end

    def set_locale
      I18n.locale = locale
    end

    def locale
      # ここで言語の切り替えを行う
      @locale ||= params[:locale] || I18n.default_locale
    end
end
