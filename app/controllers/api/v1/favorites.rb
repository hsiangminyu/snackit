module API
  module V1
    class Favorites < Grape::API
      include API::V1::Defaults

      resource :favorites do
        desc "Return all favorite snacks of current user"
        params do
          requires :user_token, type: String, desc: "current user token"
        end
        get "", root: :snacks do
          current_user.favorite_snacks
        end

        desc "Add a favorite snack to current user"
        params do
          requires :user_token, type: String, desc: "current user token"
          requires :snack_id, type: String, desc: "snack id"
        end
        post "", root: "" do
          Favorite.create!({
                            user_id:current_user.id,
                            snack_id:params[:snack_id]
          })
        end
      end
    end
  end
end
