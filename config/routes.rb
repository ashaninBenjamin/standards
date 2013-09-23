Standards::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      root to: "clients#index"
      resource :session, only: [:new, :create, :destroy]
      resources :clients, only: [:index] do
        put :trigger_state_event, on: :member
      end
      resources :feeds, only: [:index, :new, :create, :show, :edit, :update] do
        put :trigger_state_event, on: :member
      end
    end

    resource :client, only: [:new, :edit, :update, :create]
    resource :session, only: [:new, :create, :destroy]
    resources :standards, only: [:index, :show, :new, :create, :edit, :update] do
      put :trigger_state_event, on: :member
    end
    resources :feeds, only: [:index, :show]
  end
end
