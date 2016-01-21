module API
  module V1
    class Snacks < Grape::API
      include API::V1::Defaults

      resource :snacks do
        desc "Return all snacks"
        get "", root: :snack do

          return_value = Snack.all.map do |snack|
            order = Order.find_by_snack_id(snack.id)
            {
              name: snack.name,
              snack_id: snack.id,
              follow_count: snack.favorite_count,
              photo: snack.photo,
              last_order: {
                created_at: order.created_at,
                user: {
                  id: order.user_id
                }
              }
            }
          end
          
          return_value
        end

        desc "Return a snacks"
        params do
          requires :id, type: String, desc: "ID of the
            snack"
        end
        get ":id", root: "snacks" do
          Snack.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end
