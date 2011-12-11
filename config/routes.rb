Odk::Application.routes.draw do
  ActiveAdmin.routes(self)
  resource :history, :only => :show
  resource :contact, :only => :show

  root :to => 'home#show'
end
