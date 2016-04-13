Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post '/gender', to: 'gender#recognize'
    end
  end
end
