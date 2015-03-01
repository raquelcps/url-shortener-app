Rails.application.routes.draw do
  
  devise_for :users

  devise_scope :user do
     authenticated :user do
       root 'links#index', as: :authenticated_root
     end

     unauthenticated do
       root 'devise/registrations#new', as: :unauthenticated_root
     end
  end

  get '/links' => 'links#index', :as => :links
  get '/links/new' => 'links#new', :as => :new_link
  post '/links' => 'links#create'
  get '/links/:id/edit' => 'links#edit', :as => :edit_link 
  patch '/links/:id' => 'links#update'
  delete 'links/:id' => 'links#destroy' 
  get '/links/:id' => 'links#show', :as => :link

  get '/:slug' => 'links#redirect'

  resource :visits

end
