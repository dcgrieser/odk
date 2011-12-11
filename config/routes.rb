Odk::Application.routes.draw do
  ActiveAdmin.routes(self)
  resource :history, :only => :show
  resource :contact, :only => :show

  resources :members, :controller => :users, :only => :index do
    collection do
      get :officers
    end
  end

  namespace :admin do
    resource :sessions, :only => [:new, :create, :destroy]
  end

  root :to => 'home#show'
end
