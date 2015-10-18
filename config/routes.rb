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
  ##### admin #####

  get 'admin/login'
  get 'admin/index', as: :admin

  #### posts ######
  get 'admin/posts', to: 'posts#posts', as: :posts
  get 'admin/posts/:id', to: 'posts#show', as: :post 
  get 'admin/my_posts', to: 'posts#user_posts', as: :my_posts 
  get 'admin/post'
  get 'admin/new_post', as: :new_post
  get 'admin/files', as: :files
  post 'admin/create_post', to: 'posts#create', as: :create_post

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

  #### roles ####

  get '/admin/roles/new', to: 'roles#new', as: :new_role
  get '/admin/roles', to: 'roles#roles', as: :roles
  get '/admin/roles/create', to: 'roles#create', as: :create_role
  post '/admin/roles/create', to: 'roles#create'

  #### api #####

  get '/api/posts', to: 'api#posts', as: :api_posts
  get '/api/users', to: 'api#users', as: :api_users
  get '/api/create_ticket', to: 'api#create_ticket', as: :create_ticket

  ### user_help ####
  get '/admin/tickets', as: :tickets
  get '/user_help/show/:id', to: 'admin#admin_tiket_show',  as: :ticket
  get '/user_help/new_ticket', as: :new_ticket
  get '/user_help/new_customer', as: :new_customer
  get '/user_help/chat', as: :chat
  get '/api/create_ticket', as: :ticket_create
  post '/api/create_ticket'
  get '/api/create_customer', as: :create_customer
  post '/api/create_customer'

  #### external db conections ###
  get 'external_conections/create'


end
