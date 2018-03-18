class Users::OmniauthController < Devise::OmniauthCallbacksController

  def self.provides_callback_for(provider)
    class_eval %Q{
      def #{provider}
        @user = User.create_from_provider_data(request.env['omniauth.auth'])
        if @user.persisted?
          sign_in_and_redirect @user
          set_flash_message(:notice, :sucess, kind: 'Logged in') if is_navigational_format?
        else
          flash[:error] = 'There was a problem signing you in throught #{provider}'
          redirect_to new_user_registration_url
        end
      end
    }
  end

  [:facebook, :google_oauth2, :twitter].each do |provider|
    provides_callback_for provider
  end
end
