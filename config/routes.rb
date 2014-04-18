Webknow::Application.routes.draw do

  # get "journalposterpurchases/index"
  # get "journalposterpurchases/new"
  # get "journalposterpurchases/show"
  # get "journalposterpurchases/create"
  root to: 'static_pages#index'


  match '/Advertise', to: 'static_pages#advertise', via: 'get'


  # get "journalposters/index"
  #get "journalposters/new"
  #get "journalposters/create"
  #get "journalposters/show"
  match '/Journal-Poster', to: 'journalposters#index', via: 'get'
  resources :journalposters
  


  match '/Journal-Poster-New', to: 'journalposterpurchases#new', via: 'get'
  match '/JournalPoster/:id', to: 'journalposterpurchases#index', via: 'get'
  match '/Journal-Poster-Selections/:id', to: 'journalposterpurchases#show', via: 'get'
  match '/Journal-Poster-Update/:id', to: 'journalposterpurchases#update', via: 'post'
  resources :journalposterpurchases



  match '/', to: 'static_pages#index', via: 'get'
  # match '/Journal-Poster', to: 'static_pages#journalposter', via: 'get'

  resources :charges
  
  match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  match '/payments/relay_response', :to => 'payments#relay_response', :as => 'payments_relay_response', :via => [:post]
  match '/payments/receipt', :to => 'payments#receipt', :as => 'payments_receipt', :via => [:get]
  


  get "paypals/index"

  resources :paypals do
    collection do
      post :pay
    end
  end

  resources :paypals



  resources :journalposters

  resources :journalposterpurchases





  match '/Signup', to: 'users#new', via: 'get'

  resources :sessions, only: [:new, :create, :destroy]

  match '/Signin', to: 'sessions#new', via: 'get'
  match '/Signout', to: 'sessions#destroy', via: 'get'


  match '/users/show', to: 'users#show', via: 'get'


  match '/institutes/home', to: 'institutes#index', via: 'get'
  match '/publishers/home', to: 'publishers#index', via: 'get'


  resources :users



  # publishers  
  
  #get 'publishers/index'
  match "/Publishers" => "publishers#index", via: 'get'  
  match '/PublishersUpload', to: 'publishers#upload', via: 'post'
  match '/PublishersNew', to: 'publishers#new', via: 'get'
  match "/PublishersEdit" => "publishers#edit", via: 'post'
  match "/PublishersUpdate" => "publishers#update", via: 'post'

  # match "/Publishers/:id/edit" => "publishers#edit", via: 'post'
  # match "/publishers/:id" => "publishers#update", via: 'post'
  
  resources :publishers do
    collection do
      post :settings
    end
  end

  resources :publishers

  
  #get "publisher_images/index"
  get "publisher_images/show"
  match '/PublisherImages', to: 'publisher_images#index', via: 'get'
  match '/publisher_images/upload', to: 'publisher_images#upload', via: 'post'
  match '/PublisherNewImage', to: 'publisher_images#new', via: 'get'
  match "/publisher_images/:id/edit" => "publisher_images#edit", via: 'post'
  match "/publisher_images/:id" => "publisher_images#update", via: 'get'

  resources :publisher_images do
    collection { post :set_primary }
  end

  resources :publisher_images



  # get "publisher_profiles/index"
  get "publisher_profiles/show"
  match '/PublisherProfiles', to: 'publisher_profiles#index', via: 'get'
  match '/publisher_profiles/upload', to: 'publisher_profiles#upload', via: 'post'
  match '/publisher_profiles/new', to: 'publisher_profiles#new', via: 'get'
  match "/publisher_profiles/:id/edit" => "publisher_profiles#edit", via: 'post'
  match "/publisher_profiles/:id" => "publisher_profiles#update", via: 'get'

  resources :publisher_profiles



  # get "publisher_settings/index"
  get "publisher_settings/show"
  match '/PublisherSettings', to: 'publisher_settings#index', via: 'get'
  match '/publisher_settings/upload', to: 'publisher_settings#upload', via: 'post'
  match '/publisher_settings/new', to: 'publisher_settings#new', via: 'get'
  match "/publisher_settings/:id/edit" => "publisher_settings#edit", via: 'post'
  match "/publisher_settings/:id" => "publisher_settings#update", via: 'get'

  resources :publisher_settings



  # get "publisher_products/index"
  get "publisher_products/show"
  match '/PublisherProducts', to: 'publisher_products#index', via: 'get'
  match '/publisher_products/upload', to: 'publisher_products#upload', via: 'post'
  match '/PublisherAddProduct', to: 'publisher_products#new', via: 'get'
  match "/publisher_products/:id/edit" => "publisher_products#edit", via: 'post'
  match "/publisher_products/:id" => "publisher_products#update", via: 'get'

  resources :publisher_products




  get "publisher_product_descriptions/show"
  match '/PublisherProductDescription', to: 'publisher_product_descriptions#index', via: 'get'
  match '/publisher_product_descriptions/upload', to: 'publisher_product_descriptions#upload', via: 'post'
  match '/PublisherAddProductInformation', to: 'publisher_product_descriptions#new', via: 'get'
  match "/publisher_product_descriptions/:id/edit" => "publisher_product_descriptions#edit", via: 'post'
  match "/publisher_product_descriptions/:id" => "publisher_product_descriptions#update", via: 'post'

  resources :publisher_product_descriptions



  #get "publisher_images/index"
  get "publisher_product_logos/show"
  match '/PublisherLogos/:id', to: 'publisher_product_logos#index', via: 'get'
  match '/publisher_product_logos/upload', to: 'publisher_product_logos#upload', via: 'post'
  match '/PublisherNewLogo', to: 'publisher_product_logos#new', via: 'get'
  match "/publisher_product_logos/:id/edit" => "publisher_product_logos#edit", via: 'post'
  match "/publisher_product_logos/:id" => "publisher_product_logos#update", via: 'get'

  # resources :publisher_product_logos do
    # collection { post :set_primary }
  # end

  resources :publisher_product_logos



  #get "publisher_images/index"
  get "publisher_product_metadatatags/show"
  match '/PublisherMetadata/:id', to: 'publisher_product_metadatatags#index', via: 'get'
  match '/publisher_product_metadatatags/upload', to: 'publisher_product_metadatatags#upload', via: 'post'
  match '/PublisherNewMetadata', to: 'publisher_product_metadatatags#new', via: 'get'
  match "/publisher_product_metadatatags/:id/edit" => "publisher_product_metadatatags#edit", via: 'post'
  match "/publisher_product_metadatatags/:id" => "publisher_product_metadatatags#update", via: 'post'

  # resources :publisher_product_metadatatags do
    # collection { post :set_primary }
  # end

  resources :publisher_product_metadatatags



  # get "publisher_journalposters/index"
  get "publisher_journalposters/show"
  match '/PublisherJournalPosters', to: 'publisher_journalposters#index', via: 'get'
  match '/publisher_journalposters/upload', to: 'publisher_journalposters#upload', via: 'post'
  match '/PublisherCreateJournalPoster', to: 'publisher_journalposters#new', via: 'get'
  match "/publisher_journalposters/:id/edit" => "publisher_journalposters#edit", via: 'post'
  match "/publisher_journalposters/:id" => "publisher_journalposters#update", via: 'get'

  resources :publisher_journalposters do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_journalposters


  # get "publisher_journalposter_descriptions/edit"
  get "publisher_journalposter_descriptions/show"
  match '/PublisherJournalPosterDescription', to: 'publisher_journalposter_descriptions#index', via: 'get'
  match '/publisher_journalposter_descriptions/upload', to: 'publisher_journalposter_descriptions#upload', via: 'post'
  match '/Publisher-JournalPoster-New', to: 'publisher_journalposter_descriptions#new', via: 'get'
  match "/publisher_journalposter_descriptions/:id/edit" => "publisher_journalposter_descriptions#edit", via: 'post'
  match "/publisher_journalposter_descriptions/:id" => "publisher_journalposter_descriptions#update", via: 'post'

  resources :publisher_journalposter_descriptions do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_journalposter_descriptions


  # get "journalposterpurchases/show"
  # match '/JournalPoster', to: 'journalposterpurchases#index', via: 'get'
  # # match '/journalposterpurchases/upload', to: 'journalposterpurchases#upload', via: 'post'
  # match '/JournalPoster-New', to: 'journalposterpurchases#new', via: 'get'
  # match "/JournalPoster-Edit/:id/edit" => "journalposterpurchases#edit", via: 'post'
  # match "/JournalPoster-Update/:id" => "journalposterpurchases#update", via: 'post'
# 
  # resources :journalposterpurchases


  # match '/Journal-Poster-New', to: 'journalposterpurchases#new', via: 'get'
  # match '/JournalPoster/:id', to: 'journalposterpurchases#index', via: 'get'
  # match '/Journal-Poster-Selections/:id', to: 'journalposterpurchases#show', via: 'get'
  # match '/Journal-Poster-Update/:id', to: 'journalposterpurchases#update', via: 'post'
  # resources :journalposterpurchases



  
  
  # institutes
  
  #get 'institutes/index'
  match "/Institutes" => "institutes#index", via: 'get'  
  match '/InstitutesUpload', to: 'institutes#upload', via: 'post'
  match '/InstitutesNew', to: 'institutes#new', via: 'get'
  match "/InstitutesEdit" => "institutes#edit", via: 'post'
  match "/InstitutesUpdate" => "institutes#update", via: 'post'

  # match "/Institutes/:id/edit" => "institutes#edit", via: 'post'
  # match "/institutes/:id" => "institutes#update", via: 'post'
  
  resources :institutes do
    collection do
      post :settings
    end
  end

  resources :institutes

  
  #get "institute_images/index"
  get "institute_images/show"
  match '/InstituteImages', to: 'institute_images#index', via: 'get'
  match '/institute_images/upload', to: 'institute_images#upload', via: 'post'
  match '/InstituteNewImage', to: 'institute_images#new', via: 'get'
  match "/institute_images/:id/edit" => "institute_images#edit", via: 'post'
  match "/institute_images/:id" => "institute_images#update", via: 'get'

  resources :institute_images do
    collection { post :set_primary }
  end

  resources :institute_images



  # get "institute_profiles/index"
  get "institute_profiles/show"
  match '/InstituteProfiles', to: 'institute_profiles#index', via: 'get'
  match '/institute_profiles/upload', to: 'institute_profiles#upload', via: 'post'
  match '/institute_profiles/new', to: 'institute_profiles#new', via: 'get'
  match "/institute_profiles/:id/edit" => "institute_profiles#edit", via: 'post'
  match "/institute_profiles/:id" => "institute_profiles#update", via: 'get'

  resources :institute_profiles



  # get "institute_settings/index"
  get "institute_settings/show"
  match '/InstituteSettings', to: 'institute_settings#index', via: 'get'
  match '/institute_settings/upload', to: 'institute_settings#upload', via: 'post'
  match '/institute_settings/new', to: 'institute_settings#new', via: 'get'
  match "/institute_settings/:id/edit" => "institute_settings#edit", via: 'post'
  match "/institute_settings/:id" => "institute_settings#update", via: 'get'

  resources :institute_settings



  # get "institute_queries/index"
  # get "institute_queries/show"
  match '/InstituteQuery/:id', to: 'institute_queries#show', via: 'get'
  match '/InstituteQueries', to: 'institute_queries#index', via: 'get'
  match '/institute_queries/upload', to: 'institute_queries#upload', via: 'post'
  match '/InstituteAddQuery', to: 'institute_queries#new', via: 'get'
  match "/institute_queries/:id/edit" => "institute_queries#edit", via: 'post'
  match "/institute_queries/:id" => "institute_queries#update", via: 'post'

  resources :institute_queries do
    member do
      post :execute
    end
  end


  resources :institute_queries




  #get "institute_query_results/show"
  match '/InstituteQueryResult/:id', to: 'institute_query_results#show', via: 'get'  
  match '/InstituteQueryResults/:id', to: 'institute_query_results#index', via: 'get'
  match '/institute_query_results/upload', to: 'institute_query_results#upload', via: 'post'
  match '/InstituteAddQueryDetails', to: 'institute_query_results#new', via: 'get'
  match "/institute_query_results/:id/edit" => "institute_query_results#edit", via: 'post'
  match "/institute_query_results/:id" => "institute_query_results#update", via: 'post'

  resources :institute_query_results do
    member do
      post :execute
    end
  end

  resources :institute_query_results

  
  
  
  
  
  
  
  
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
