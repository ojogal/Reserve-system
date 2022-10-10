Rails.application.routes.draw do
  namespace :api , defaults: { format: :json } do
    namespace :vi do
      resources :users, only: %i[:show :create :update :destroy]
    end
  end
end
