class AuthConstraint
  def matches?(request)
    request.session['user_id'].present?
  end
end

Myapp::Application.routes.draw do

  resources :requests_closures

  resources :careers

  resources :roles

  get "requests/registrarme" => "requests#registrarme"
  get "requests/quitarme" => "requests#quitarme"
  get "requests/cambioestado" => "requests#cambioestado"
  get "user_in_requests/borrar_todo" => "user_in_requests#borrar_todo"

  resources :user_in_requests

  resources :requests

  resources :courses

  resources :schedules

  resources :states


  get "sessions/new"
  get "users/new"
  get '/users/destroy/:id', to: 'users#destroy'
  get "home/index"
	get "users/usuario"

get "log_out" => "sessions#destroy", :as => "log_out"
get "log_in" => "sessions#new", :as => "log_in"
get "sign_up" => "users#new", :as => "sign_up"
get "users/usuario" => "users#usuario", :as => "usuario"

constraints(AuthConstraint.new) do
	root :to => 'requests#rooturl', :as => "authenticated_root"
end

root :to => "sessions#new"
resources :users
resources :sessions

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
