Odk::Application.routes.draw do
  resource :history, :only => :show
  resource :contact, :only => :show

  root :to => 'home#show'
end
