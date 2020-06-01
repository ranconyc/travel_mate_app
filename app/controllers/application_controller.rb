class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :save_user_languages, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [
        :first_name, :last_name, :date_of_birth, :gender,
        :location, :interest, :about, :avatar, :hometown,
        :language_ids
      ])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys:
      [
        :first_name, :last_name, :date_of_birth, :gender,
        :location, :interest, :about, :avatar, :hometown,
        :language_ids
      ])
  end

  def save_user_languages
    if controller_name != 'registrations' ||
       !['create', 'update'].include?(action_name)
      return
    end

    return if current_user.nil?

    language_ids = params[:user][:language_ids].reject { |id| id == '' }
    languages = language_ids.map { |id| Language.find(id) }
    current_user.user_languages.destroy_all
    current_user.languages << languages
  end
end
