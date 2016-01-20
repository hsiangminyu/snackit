module API  
  module V1
    class Base < Grape::API
      mount API::V1::Snacks
      mount API::V1::Favorites
      mount API::V1::Auth
    end
  end
end  