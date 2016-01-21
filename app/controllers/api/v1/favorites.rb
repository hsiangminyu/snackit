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
        favorite = Favorite.find_by(snack_id: params[:snack_id], user_id: current_user.id)
        if favorite.nil?
          Favorite.create!({
                             user_id:current_user.id,
                             snack_id:params[:snack_id]
          })
        else
          error_message ="This snack is already in your favorite list!"
          error! error_message, 401
        end
      end

      desc "remove a snack from current user's favorite list"
      params do
        requires :user_token, type: String, desc: "current user token"
        requires :snack_id, type: String, desc: "snack Id"
      end
      delete "", root: "" do
        Favorite.find_by(snack_id: params[:snack_id], user_id: current_user.id).destroy
        current_user.favorite_snacks
      end

    end
  end
end
end
