# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
   #before_action :configure_sign_in_params, only: [:create]

   #GET /resource/sign_in
   #def new
     #@user = User.new
   #end

  #POST /resource/sign_in
   #def create
     #@user = User.find_by(email: session_params[:email], encrypted_password: session_params[:encrypted_password])
     #if @user
      #redirect_to :root_path
     #else
     #render "devise/sessions/new"
     #end
   #end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end


   

   #protected
   
   #def session_params
    #params.permit(:email, :encrypted_password)
 #end

  # If you have extra params to permit, append them to the sanitizer.
   #def configure_sign_in_params
     #devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
   #end
end
