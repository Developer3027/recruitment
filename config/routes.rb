Rails.application.routes.draw do

  # privacy page
  get "privacy", to: "privacy#index", as: :privacy

  # Post action for the contact form in landing controller
  post "/landing/lead", to: "landing#create_lead", as: :create_lead
  # Post action for the newsletter form in landing controller
  post "/landing/newsletter", to: "landing#create_newsletter", as: :create_newsletter

  # Root route for advisor
  authenticated :admin, lambda { |a| a.role == "advisor" } do
    root to: "advisor#index", as: :advisor
  end

  # get the blog general root
  get "blog", to: "blog#index", as: :blog
  # get the single blog - show
  get "/blog/:id", to: "blog#show", as: :blog_show

  # Route for new blog
  get "new_blog", to: "advisor#new_blog", as: :advisor_new_blog
  # Route for list of blogs
  get "list_blogs", to: "advisor#list_blogs", as: :advisor_list_blogs
  # Route for edit blog
  get "edit_blog/:id", to: "advisor#edit_blog", as: :advisor_edit_blog
  # create blog through advisor dashboard
  post "create_blog", to: "advisor#create_blog", as: :advisor_create_blog
  # update blog through advisor dashboard
  patch "update_blog/:id", to: "advisor#update_blog", as: :advisor_update_blog
  # delete blog through advisor dashboard
  delete "destroy_blog/:id", to: "advisor#destroy_blog", as: :advisor_destroy_blog
  # delete cover image through advisor dashboard
  resources :blog do
    resources :cover_images, only: [:destroy], module: :blog
  end

  devise_for :admins, controllers: {
    sessions: "admin/sessions"
  }
  root 'landing#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
