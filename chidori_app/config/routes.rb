Rails.application.routes.draw do
  get 'posts/index' => 'posts#index'
  get 'posts/new' => 'posts#new'
  get 'posts/:id' => 'posts#show'
  get '/' => "host#top"
  post '/posts/create' => 'posts#create'
  get  '/posts/:id/edit' => 'posts#edit'
  post '/posts/:id/update' => 'posts#update'
  post '/posts/:id/delete' => 'posts#delete'
  get '/about' => "host#about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
