# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
    # puts "Hello"
    # puts params[:user][:type]
    # @user = User.new(name: params[:user][:name],phone: params[:user][:phone],email: params[:user][:email],type: params[:user][:type],encrypted_password: params[:user][:password],)
    # # puts @user.errors.size
    # if @user.save(validate: false)
    #   redirect_to root_url
    # end
  # end

  # private
  # def add_params
  #   params.require(:user).permit(:email, :encrypted_password, :name, :phone, :type, :reset_password_token, :reset_password_sent_at, :remember_created_at)
  # end

  # def sign_up_params
  #   params.require(:user).permit(:name, :phone, :type, :password_confirmation)
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :type, :phone])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
