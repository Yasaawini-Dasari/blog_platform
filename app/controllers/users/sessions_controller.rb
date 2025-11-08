# frozen_string_literal: true

# class Users::SessionsController < Devise::SessionsController

#   respond_to :json
#   skip_before_action :verify_authenticity_token, only: [:create, :destroy]

#   # POST /users/sign_in
#   def create
#     self.resource = warden.authenticate!(auth_options)
#     sign_in(resource_name, resource)
#     render json: {
#       message: "Logged in successfully",
#       user: { id: resource.id, email: resource.email }
#     }, status: :ok
#   end

#   # DELETE /users/sign_out
#   def destroy
#     sign_out(resource_name)
#     render json: { message: "Logged out" }, status: :ok
#   end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
# end


class Users::SessionsController < Devise::SessionsController
  include ActionController::Cookies
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: {
        message: "Logged in successfully",
        user: {
          id: resource.id,
          email: resource.email
        }
      }, status: :ok
    else
      render json: { error: "Invalid credentials" }, status: :unauthorized
    end
  end

  def respond_to_on_destroy
    render json: { message: "Logged out successfully" }, status: :ok
  end
end
