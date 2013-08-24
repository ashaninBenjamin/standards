Standards::Application.routes.draw do
  scope module: :web do
    root to: 'welcome#index'
    namespace :admin do
      root to: "sessions#new"
      resource :session, only: [:new, :create, :destroy]
    end
  end
end
