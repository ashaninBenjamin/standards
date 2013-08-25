Standards::Application.routes.draw do
  get "sessions/new"
  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      root to: "clients#index"
      resource :session, only: [:new, :create, :destroy]
      resources :clients, only: [:index, :edit, :update] do
        put :trigger_state_event, on: :member
      end
    end

    resource :client, only: [:new, :edit, :update, :create]
    resource :session, only: [:new, :create, :destroy]
  end
end
