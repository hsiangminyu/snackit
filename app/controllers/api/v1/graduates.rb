module API  
  module V1
    class Graduates < Grape::API
      include API::V1::Defaults

      resource :graduates do
        desc "Return all graduates"
        get "", root: :hello do
          Snack.all
        end

        desc "Return a graduate"
        params do
          requires :id, type: String, desc: "ID of the 
            graduate"
        end
        get ":id", root: "graduate" do
          Snack.where(id: permitted_params[:id]).first!
        end
      end
    end
  end
end 