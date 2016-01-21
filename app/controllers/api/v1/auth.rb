module API
  module V1
    class Auth < Grape::API
      include API::V1::Defaults
      resource :auth do

        desc "Email & password register."
        params do
          requires :email,    type: String
          requires :password, type: String
          optional :device_token, type: String , desc: "User's iOS device token for push notification"
        end
        post :signup do
          user = User.new(email: params[:email], password: params[:password])
          # binding.pry
          if user.save
            user.token = SecureRandom.uuid
            user.save
            { auth_token:user.token }
          else
            error_message =error_message(user)
            error! error_message, 400
          end
        end

        desc "Email & password login."
        params do
          requires :email,    type: String
          requires :password, type: String
          optional :device_token, type: String, desc: "User's iOS device token for push notification"
        end
        post :login do
          user = User.find_by_email(params[:email])
          if user
            if user.valid_password?(params[:password])
              if user.token.blank?
                user.token = SecureRandom.uuid
                user.save
              end
              # user.update_attributes(device_token: params[:device_token])
              { auth_token: user.token,
                name: user.name,
                # avatar_url: user.photo
                }
            else
              error_message =error_message(user)
              error! error_message, 401
            end
          else
            error_message =error_message(user)
            error! error_message, 404
          end
        end

      end
    end
  end
end
