Standards::Application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      root to: "sessions#new"
      resource :session, only: [:new, :create, :destroy]
      resources :clients, only: [:index, :edit, :update] do
        put :trigger_state_event, on: :member
      end
    end
  end
end
