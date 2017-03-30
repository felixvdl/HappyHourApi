Rails.application.routes.draw do
  namespace :api, defaults: {format: :json } do
    scope module: :v1 do
      resources :bars, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
