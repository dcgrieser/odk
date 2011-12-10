Odk::Application.routes.draw do
  resource :history
  root :to => 'home#show'
end
