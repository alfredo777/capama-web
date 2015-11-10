Rails.application.routes.draw do
  

  ##### public ######

  root 'public_views#index'
  get '/contact', to: 'public_views#contact', as: :contact
  get '/procedures_and_services', to: 'public_views#procedures_and_services', as: :procedures_and_services
  get '/whater_culture', to: 'public_views#whater_culture', as: :whater_culture
  get '/citizen_management', to: 'public_views#citizen_management', as: :citizen_management
  get '/news', to: 'public_views#news', as: :news
  get '/transparency', to: 'public_views#transparency', as: :transparency
  get '/about_capama', to: 'public_views#about_capama', as: :about_capama
  get '/infraestructure', to: 'public_views#infraestructure', as: :infraestructure
  get '/capama_basics', to: 'public_views#capama_basics', as: :capama_basics
  get '/service_contract', to: 'public_views#service_contract', as: :service_contract
  get '/water_treatment_plants', to: 'public_views#water_treatment_plants', as: :water_treatment_plants
  get '/water_catchments', to: 'public_views#water_catchments', as: :water_catchments
  get '/capama_history', to: 'public_views#capama_history', as: :capama_history
  get '/organization_chart', to: 'public_views#organization_chart', as: :organization_chart
  get '/branches_for_payments', to: 'public_views#branches_for_payments', as: :branches_for_payments
  get '/post/:id', to: 'public_views#show_post', as: :post_public_view
  get '/recipt', to: 'public_views#recipt', as: :recipt

  ##### admin #####

  get 'admin/login'
  get 'admin/index', as: :admin
  get 'admin/config_roles', to: 'admin#config_roles', as: :congif_roles
  get 'admin/congif_users', to: 'admin#congif_users', as: :congif_users
  get 'admin/readings', as: :readings
  get 'admin/create_reading', to: 'api#create_reading', as: :create_reading
  post 'admin/create_reading', to: 'api#create_reading'

  #### posts ######
  get 'admin/posts', to: 'posts#posts', as: :posts
  get 'admin/posts/:id', to: 'posts#show', as: :post 
  get 'admin/my_posts', to: 'posts#user_posts', as: :my_posts 
  get 'admin/post'
  get 'admin/new_post', as: :new_post
  get 'admin/files', as: :files
  post 'admin/create_post', to: 'posts#create', as: :create_post
  get 'admin/edit_post/:id', to: "admin#edit_post" , as: :edit_post 
  post 'admin/update_post/:id', to: 'posts#edit', as: :update_post
  get 'admin/destroy_post', to: 'posts#destroy', as: :destroy_post
  post 'admin/destroy_post', to: 'posts#destroy'

  ##### images #####
  post 'admin/create_new_image', to: 'admin#create_new_image', as: :create_new_image
  get 'admin/load_image_select', to: 'admin#load_image_select', as: :load_image_select
  get 'admin/destroy_file_image', to: 'admin#destroy_file_image', as: :destroy_file_image
  post 'admin/destroy_file_image', to: 'admin#destroy_file_image'
  #### users #####

  get '/admin/users', to: 'users#users', as: :users
  get '/admin/users/new', to: 'users#new', as: :new_user
  get '/admin/users/create', to: 'users#create', as: :register_user
  post '/admin/users/create', to: 'users#create'
  post '/admin/users/update/:id', to: 'users#update', as: :update_user
  post '/admin/users/session_create', to: 'users#session_create', as: :session_create_user
  get '/admin/users/session_exit', to: 'users#session_exit', as: :session_exit_user
  get '/admin/users/login', to: 'users#login', as: :login_user
  get '/admin/users/:id', to: 'users#show', as: :user
  get '/admin/users/edit/:id', to: 'users#edit', as: :edit_user
  get '/admin/users/destroy/:id', to: 'users#destroy', as: :destroy_user
  post '/admin/users/destroy/:id', to: 'users#destroy'
  get '/admin/create_users_masive', to: 'users#create_users_masive', as: :create_users_masive
  post '/users/import_users', as: :import_users

  #### roles ####

  get '/admin/roles/new', to: 'roles#new', as: :new_role
  get '/admin/roles', to: 'roles#roles', as: :roles
  get '/admin/roles/create', to: 'roles#create', as: :create_role
  post '/admin/roles/create', to: 'roles#create'
  get '/admin/roles/destroy', to: 'roles#destroy', as: :destroy_role
  post '/admin/roles/destroy', to: 'roles#destroy'
  #### api #####

  get '/api/posts', to: 'api#posts', as: :api_posts
  get '/api/users', to: 'api#users', as: :api_users
  get '/api/create_ticket', to: 'api#create_ticket', as: :create_ticket
  get '/api/post/:id', to: 'api#post', as: :api_post
  get '/api/viewver', to: 'api#viewver', as: :viewver
  post '/api/viewver'
  get '/api/clicking', to: 'api#clicking', as: :clicking
  post '/api/clicking'
  get '/lang_select', to: 'api#lang', as: :lang
  get '/api/view_post', to: 'api#view_post'
    ### user_help ####
  get '/admin/tickets', as: :tickets
  get '/admin/customers', as: :customers
  get '/admin/destroy_customer', as: :destroy_customer
  post '/admin/destroy_customer'
  get '/user_help/show/:id', to: 'admin#admin_tiket_show',  as: :ticket
  get '/admin/close_ticket', as: :close_ticket
  post '/admin/close_ticket'
  post '/admin/admin_tiket_show'
  get '/user_help/new_ticket', as: :new_ticket
  get '/user_help/new_customer', as: :new_customer
  get '/user_help/chat', to: 'user_help#chat', as: :chat
  post '/user_help/chat', to: 'user_help#chat'
  get '/api/create_ticket', as: :ticket_create
  post '/api/create_ticket'
  get '/api/create_customer', as: :create_customer
  post '/api/create_customer'

  #### messages ####
  get '/messages/show', to: "messages#show", as: :show_message
  get '/messages/create', to: "messages#create", as: :create_message
  post '/messages/create'
  get '/messages/paginate_messages', to: "messages#paginate_messages", as: :paginate_messages
  get '/messages/events', to: "messages#events", as: :events_messages
  post '/messages/events'

  #### filter map ####

  get '/admin/new_zone', to: "admin#new_zone", as: :new_zone
  get '/admin/create_zone', as: :create_zone
  post '/admin/create_zone'
  get '/admin/destroy_zone', as: :destroy_zone
  post '/admin/destroy_zone'


  #### external db conections ###
  get 'external_conections/create'

  #### format forms ####

  resources :format_forms

  get "/format/:id", to: "format_forms#view_action", as: :view_action
  get "/api/response_forms", as: :response_forms
  post "/api/response_forms"
  get '/printing_view_format', to: "format_forms#printing_view_format", as: :printing_view_format

  ##### get mobile api ####

  get "mobile/login", to: "appmobile_api#login"
  post "mobile/login", to: "appmobile_api#login"

end
