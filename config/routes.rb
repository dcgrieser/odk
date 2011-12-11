Odk::Application.routes.draw do
  ActiveAdmin.routes(self)
  resource :history, :only => :show
  resource :contact, :only => :show
  resources :members, :controller => :users, :only => :index do
    collection do
      get :officers
    end
  end

  root :to => 'home#show'
end
