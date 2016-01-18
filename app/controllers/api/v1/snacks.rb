module API  
  module V1
    class Snacks < Grape::API
      include API::V1::Defaults

      resource :snacks do
        desc "Return all snacks"
        get "", root: :snacks do
          Srsnack.all
        end

        desc "Return a snacks"
        params do
          requires :id, type: String, desc: "ID of the 
            snack"
        end
        get ":id", root: "snacks" do
          Srsnack.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end 