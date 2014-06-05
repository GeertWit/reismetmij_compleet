InboxesApp::Application.routes.draw do
  get "posts/index"

  get "posts/show"

  get "posts/new"

  get "posts/create"

  get "posts/view"



  devise_for :users

  root :to => "home#index"

  mount Inboxes::Engine => "/inboxes"




  resources :discussions, :except => :edit, :module => :inboxes do
    resources :messages, :only => [:create, :index]
    resources :speakers, :only => [:create, :destroy]
    member do
      post 'leave'
    end
  end
end


