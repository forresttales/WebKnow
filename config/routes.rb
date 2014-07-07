Webknow::Application.routes.draw do


  get "static_pages/fonts"
  
  match '/Mail', to: 'user_messages#index', via: 'get'
  resources :user_messages

  match '/Connections', to: 'user_connections#index', via: 'get'
  resources :user_connections
  
  match '/Groups', to: 'user_groups#index', via: 'get'
  resources :user_groups
  
  match '/Metrics', to: 'publisher_metrics#index', via: 'get'
  resources :publisher_metrics
  
  match '/Advertisements', to: 'publisher_ads#index', via: 'get'
  resources :publisher_ads


  # get "members/index"
  # get "members/show"
  match '/Members', to: 'members#index', via: 'get'
  resources :members
  
  
  
  # get "journalposterpurchases/index"
  # get "journalposterpurchases/new"
  # get "journalposterpurchases/show"
  # get "journalposterpurchases/create"
  
  get "diagnostics/rmagick"
  
  root to: 'users#new'
  match '/', to: 'users#new', via: 'get'
  # match '/Members', to: 'users#index', via: 'get'
  
  # match '/Signup', to: 'users#new', via: 'get'
  
  resources :users do
    collection do
      post :dbdelete
    end
  end

  resources :users

  

  match '/Signin', to: 'sessions#new', via: 'get'
  match '/Signout', to: 'sessions#destroy', via: 'get'  
  resources :sessions, only: [:new, :create, :destroy]



  resources :password_resets



  # match '/id:id', to: 'profiles#index', via: 'get'  

  match '/id:id', to: 'profile_users#index', via: 'get'  
  match '/publisher-id:id', to: 'profile_publishers#index', via: 'get'  
  match '/institute-id:id', to: 'profile_institutes#index', via: 'get'  
  match '/instructor-id:id', to: 'profile_instructors#index', via: 'get'  
  match '/student-id:id', to: 'profile_students#index', via: 'get'  
  match '/recruiter-id:id', to: 'profile_recruiters#index', via: 'get'  


  
  # root to: 'static_pages#index'


  match '/Map-1-Available-Poster-Pins', to: 'journal1poster_positions#index', via: 'get'


  match '/Posters', to: 'journal1posters#index', via: 'get'
  match '/Posters-1', to: 'journal1posters#index', via: 'get'
  
  resources :journal1posters do
    collection do
      post :dbdelete
    end
  end
  
  resources :journal1posters



  match '/Posters-2', to: 'journal2posters#index', via: 'get'
  resources :journal2posters



  match '/Posters-3', to: 'journal3posters#index', via: 'get'
  resources :journal3posters



  match '/Posters-4', to: 'journal4posters#index', via: 'get'
  resources :journal4posters



  match '/Posters-5', to: 'journal5posters#index', via: 'get'
  resources :journal5posters


  
  # scope :constraints => { :protocol => "https", :subdomain => "secure" } do
    # :publisher_journalposter_purchases #, : ...
  # end

  match '/Advertise', to: 'static_pages#advertise', via: 'get'

  match '/test-image', to: 'static_pages#test-image', via: 'get'

  # get "journalposters/index"
  #get "journalposters/new"
  #get "journalposters/create"
  #get "journalposters/show"
  match '/Journal-Poster-Start', to: 'journalposters#index', via: 'get'
  match '/Journal-Poster-About', to: 'journalposters#journal_poster_about', via: 'get'
  resources :journalposters
  


  match '/Journal-Poster-New', to: 'journalposterpurchases#new', via: 'get'
  match '/JournalPoster/:id', to: 'journalposterpurchases#index', via: 'get'
  match '/Journal-Poster-Selections/:id', to: 'journalposterpurchases#show', via: 'get'
  match '/Journal-Poster-Update/:id', to: 'journalposterpurchases#update', via: 'post'
  resources :journalposterpurchases



  # match '/', to: 'static_pages#index', via: 'get'
  # match '/Journal-Poster', to: 'static_pages#journalposter', via: 'get'

  resources :charges
  
  # match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  # match '/payments/relay_response', :to => 'payments#relay_response', :as => 'payments_relay_response', :via => [:post]
  # match '/payments/receipt', :to => 'payments#receipt', :as => 'payments_receipt', :via => [:get]
  


  get "paypals/index"

  resources :paypals do
    collection do
      post :pay
    end
  end

  resources :paypals



  resources :journalposters

  resources :journalposterpurchases









  match '/institutes/home', to: 'institutes#index', via: 'get'
  match '/publishers/home', to: 'publishers#index', via: 'get'






  #users
  
  #user_profile_images

  match '/Photos', to: 'user_profile_images#index', via: 'get'
  match '/Photo-New/:id', to: 'user_profile_images#new', via: 'get'
  match '/Photo-Crop-Center/:id', to: 'user_profile_images#crop', via: 'get'
  # get "user_profile_images/crop"
  # match '/Crop-Center-Commit', to: 'user_profile_images#crop_commit', via: 'post'

  # resources :user_profile_images do
    # collection do
      # get :crop
    # end
  # end

  resources :user_profile_images do
    collection do
      post :dbdelete
    end
  end

  resources :user_profile_images do
    collection do
      post :crop_commit
    end
  end

  resources :user_profile_images





  # publishers  
  
  #get 'publishers/index'
  match "/Publisher" => "publishers#index", via: 'get'  
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

  resources :publishers do
    collection do
      post :dbdelete
    end
  end

  resources :publishers





  match "/Publisher-Admin" => "publisher_admins#index", via: 'get'  
  match '/Publisher-Admin-Upload', to: 'publisher_admins#upload', via: 'post'
  match '/Publisher-Admin-New', to: 'publisher_admins#new', via: 'get'
  match "/Publisher-Admin-Edit" => "publisher_admins#edit", via: 'post'
  match "/Publisher-Admin-Update" => "publisher_admins#update", via: 'post'

  # resources :publisher_admins do
    # collection do
      # post :settings
    # end
  # end

  # resources :publisher_admins do
    # collection do
      # post :dbdelete
    # end
  # end


  resources :publisher_admins





  match '/Publisher-Photos', to: 'publisher_profile_images#index', via: 'get'
  match '/Publisher-Photos-New', to: 'publisher_profile_images#new', via: 'get'
  match 'publisher_profile_images/update', to: 'publisher_profile_images#update', via: 'get'
  match '/Publisher-Photo-Crop-and-Center/:id', to: 'publisher_profile_images#crop', via: 'get'  
  # match '/Publisher-Photo-Crop-and-Center', to: 'publisher_profile_images#crop', via: 'get'  

  resources :publisher_profile_images do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_profile_images do
    collection do
      post :crop_commit
    end
  end

  resources :publisher_profile_images



  
  # #get "publisher_images/index"
  # get "publisher_images/show"
  # match '/PublisherImages', to: 'publisher_images#index', via: 'get'
  # match '/publisher_images/upload', to: 'publisher_images#upload', via: 'post'
  # match '/PublisherNewImage', to: 'publisher_images#new', via: 'get'
  # match "/publisher_images/:id/edit" => "publisher_images#edit", via: 'post'
  # match "/publisher_images/:id" => "publisher_images#update", via: 'get'
  # resources :publisher_images do
    # collection { post :set_primary }
  # end
  # resources :publisher_images





  # get "publisher_profiles/index"
  get "publisher_profiles/show"
  match '/Publisher-Profile', to: 'publisher_profiles#index', via: 'get'
  # match '/PublisherProfiles', to: 'publisher_profiles#edit', via: 'get'
  match '/publisher_profiles/upload', to: 'publisher_profiles#upload', via: 'post'
  match '/publisher_profiles/new', to: 'publisher_profiles#new', via: 'get'
  # match "/publisher_profiles/:id/edit" => "publisher_profiles#edit", via: 'post'
  # match "/publisher_profiles/:id" => "publisher_profiles#update", via: 'get'
  # match "/publisher_profiles/update" => "publisher_profiles#update", via: 'post'
  # match '/JournalPosterCreate-1', to: 'journal1poster_positions#create', via: 'post'
  # match '/Update-FirstName', to: 'publisher_profiles#update_name_first', via: 'post'
  resources :publisher_profiles do
    collection do
      post :update_name
    end
  end
  resources :publisher_profiles do
    collection do
      post :update_url
    end
  end
  resources :publisher_profiles do
    collection do
      post :update_company_contact_email
    end
  end
  resources :publisher_profiles do
    collection do
      post :update_company_contact_phone
    end
  end
  resources :publisher_profiles do
    collection do
      post :update_company_contact_name
    end
  end
  resources :publisher_profiles do
    collection do
      post :update_address
    end
  end
  resources :publisher_profiles do
    collection do
      post :update_description
    end
  end

  resources :publisher_profiles






  # get "publisher_profiles/index"
  get "publisher_profile_admins/show"
  match '/Publisher-Profile-Admin', to: 'publisher_profile_admins#index', via: 'get'
  # match '/PublisherProfiles', to: 'publisher_profiles#edit', via: 'get'
  match '/publisher_profile_admins/upload', to: 'publisher_profile_admins#upload', via: 'post'
  match '/publisher_profile_admins/new', to: 'publisher_profile_admins#new', via: 'get'
  # match "/publisher_profiles/:id/edit" => "publisher_profiles#edit", via: 'post'
  # match "/publisher_profiles/:id" => "publisher_profiles#update", via: 'get'
  # match "/publisher_profiles/update" => "publisher_profiles#update", via: 'post'
  # match '/JournalPosterCreate-1', to: 'journal1poster_positions#create', via: 'post'
  

  # match '/Update-FirstName', to: 'publisher_profiles#update_name_first', via: 'post'

  resources :publisher_profile_admins do
    collection do
      post :update_name
    end
  end

  resources :publisher_profile_admins do
    collection do
      post :update_bd
    end
  end

  resources :publisher_profile_admins do
    collection do
      post :update_email
    end
  end

  resources :publisher_profile_admins do
    collection do
      post :update_username
    end
  end

  resources :publisher_profile_admins do
    collection do
      post :update_gender
    end
  end

  resources :publisher_profile_admins do
    collection do
      post :update_password
    end
  end

  resources :publisher_profile_admins





  # get "publisher_settings/index"
  get "publisher_settings/show"
  match '/Publisher-Settings', to: 'publisher_settings#index', via: 'get'
  match '/publisher_settings/upload', to: 'publisher_settings#upload', via: 'post'
  match '/publisher_settings/new', to: 'publisher_settings#new', via: 'get'
  match "/publisher_settings/:id/edit" => "publisher_settings#edit", via: 'post'
  match "/publisher_settings/:id" => "publisher_settings#update", via: 'get'

  resources :publisher_settings





  # get "publisher_admin_settings/index"
  get "publisher_admin_settings/show"
  match '/Publisher-Admin-Settings', to: 'publisher_admin_settings#index', via: 'get'
  match '/publisher_admin_settings/upload', to: 'publisher_admin_settings#upload', via: 'post'
  match '/publisher_admin_settings/new', to: 'publisher_admin_settings#new', via: 'get'
  match "/publisher_admin_settings/:id/edit" => "publisher_admin_settings#edit", via: 'post'
  match "/publisher_admin_settings/:id" => "publisher_admin_settings#update", via: 'get'

  resources :publisher_admin_settings






  # get "publisher_products/index"
  get "publisher_products/show"
  match '/Publisher-Products', to: 'publisher_products#index', via: 'get'
  match '/publisher_products/upload', to: 'publisher_products#upload', via: 'post'
  # match '/Publisher-Add-Product', to: 'publisher_products#new', via: 'get'
  match '/Publisher-Add-Product', to: 'publisher_products#create', via: 'get'
  match "/Publisher-Products-Edit/:id/edit" => "publisher_products#edit", via: 'post'
  match "/publisher_products/:id" => "publisher_products#update", via: 'get'

  resources :publisher_products do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_products




  get "publisher_product_descriptions/show"
  match '/Publisher-Product-Description', to: 'publisher_product_descriptions#index', via: 'get' 
  match '/publisher_product_descriptions/upload', to: 'publisher_product_descriptions#upload', via: 'post'
  match '/PublisherAddProductInformation', to: 'publisher_product_descriptions#new', via: 'get'
  match "/Publisher-Product-Edit/:id/edit" => "publisher_product_descriptions#edit", via: 'post'

  resources :publisher_product_descriptions do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_product_descriptions do
    collection do
      post :update_name_product
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_description
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_type_content_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_core_supplemental_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_source_url
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_subject_category_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_age_appropriate_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_grade_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_platform_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_pricing_model_index
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_price
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_versions
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_topic
    end
  end
  resources :publisher_product_descriptions do
    collection do
      post :update_word_description
    end
  end




  # match "/publisher_product_descriptions/:id" => "publisher_product_descriptions#update", via: 'post'

  resources :publisher_product_descriptions



  # #get "publisher_images/index"
  # get "publisher_product_logos/show"
  # match '/PublisherLogos/:id', to: 'publisher_product_logos#index', via: 'get'
  # match '/publisher_product_logos/upload', to: 'publisher_product_logos#upload', via: 'post'
  # match '/PublisherNewLogo', to: 'publisher_product_logos#new', via: 'get'
  # match "/publisher_product_logos/:id/edit" => "publisher_product_logos#edit", via: 'post'
  # match "/publisher_product_logos/:id" => "publisher_product_logos#update", via: 'get'
# 
  # # resources :publisher_product_logos do
    # # collection { post :set_primary }
  # # end
# 
  # resources :publisher_product_logos




  #get "publisher_logos/index"
  get "publisher_product_logos/show"
  match '/Publisher-Product-Logo-Image/:id', to: 'publisher_product_logos#index', via: 'get'
  match '/publisher_product_logos/upload', to: 'publisher_product_logos#upload', via: 'post'
  match '/Publisher-New-Logo-Image', to: 'publisher_product_logos#new', via: 'get'
  # match '/Publisher-Product-Image-Crop-and-Center/:id', to: 'publisher_product_logos#crop', via: 'get'  
  
  # match "/publisher_product_logos/:id/edit" => "publisher_product_logos#edit", via: 'post'
  # match "/publisher_product_logos/:id" => "publisher_product_logos#update", via: 'get'

  resources :publisher_product_logos do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_product_logos do
    collection do
      post :crop
    end
  end

  resources :publisher_product_logos do
    collection do
      post :crop_commit
    end
  end

  resources :publisher_product_logos do
    collection do
      post :destroy_image
    end
  end

  # resources :publisher_product_images do
    # collection { post :set_primary }
  # end

  resources :publisher_product_logos






  #get "publisher_images/index"
  get "publisher_product_images/show"
  match '/Publisher-Product-Image/:id', to: 'publisher_product_images#index', via: 'get'
  match '/publisher_product_images/upload', to: 'publisher_product_images#upload', via: 'post'
  match '/Publisher-New-Image', to: 'publisher_product_images#new', via: 'get'
  # match '/Publisher-Product-Image-Crop-and-Center/:id', to: 'publisher_product_images#crop', via: 'get'  
  
  # match "/publisher_product_images/:id/edit" => "publisher_product_images#edit", via: 'post'
  # match "/publisher_product_images/:id" => "publisher_product_images#update", via: 'get'

  resources :publisher_product_images do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_product_images do
    collection do
      post :crop
    end
  end

  resources :publisher_product_images do
    collection do
      post :crop_commit
    end
  end

  resources :publisher_product_images do
    collection do
      post :destroy_image
    end
  end

  # resources :publisher_product_images do
    # collection do
      # post :destroy_image_descr
    # end
  # end

  # resources :publisher_product_images do
    # collection { post :set_primary }
  # end

  resources :publisher_product_images




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
  match '/Publisher-Posters', to: 'publisher_journalposters#index', via: 'get'
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




  # match '/Publisher-Poster-Images', to: 'publisher_journalposter_logos#index', via: 'get'
  # match '/New-Poster-Image', to: 'publisher_journalposter_logos#new', via: 'get'
  # match '/Poster-Photo-Crop-Center/:id', to: 'publisher_journalposter_logos#crop', via: 'get'
  # resources :publisher_journalposter_logos do
    # collection do
      # post :dbdelete
    # end
  # end
  # resources :publisher_journalposter_logos do
    # collection do
      # post :crop_commit
    # end
  # end
  # resources :publisher_journalposter_logos



  match '/Publisher-Poster-Images', to: 'publisher_journalposter_images#index', via: 'get'
  # match '/New-Poster-Image', to: 'publisher_journalposter_images#new', via: 'get'
  # match '/Poster-Photo-Crop-Center/:id', to: 'publisher_journalposter_images#crop', via: 'get'

  resources :publisher_journalposter_images do
    collection do
      post :dbdelete
    end
  end

  resources :publisher_journalposter_images do
    collection do
      post :crop
    end
  end

  resources :publisher_journalposter_images do
    collection do
      post :crop_commit
    end
  end
  
  resources :publisher_journalposter_images do
    collection do
      post :destroy_image
    end
  end
  
  resources :publisher_journalposter_images




  resources :publisher_journalposter_prodshots




  # match '/payments/payment', :to => 'payments#payment', :as => 'paymentspayment', :via => [:get]
  match '/publisher_journalposter_purchases/relay_response', :to => 'publisher_journalposter_purchases#relay_response', :as => 'publisher_journalposter_purchases_relay_response', :via => [:post]
  match '/publisher_journalposter_purchases/receipt', :to => 'publisher_journalposter_purchases#receipt', :as => 'publisher_journalposter_purchases_receipt', :via => [:get]
  match '/Journalposter-Purchase', :to => 'publisher_journalposter_purchases#new', :via => [:get]

  resources :publisher_journalposter_purchases



  resources :image_sizes do
    collection do
      post :dbdelete
    end
  end

  resources :image_sizes











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

  
  

  match "/Gallery" => "galleries#index", via: 'get'
  
  resources :galleries
  resources :paintings

  
  
  
  
    #*********************************************************************
  # mtables
  
  # get "mtablets/index"
  # get "mtablets/show"
  # match '/mtablets/new', to: 'mtablets#new', via: 'get'
  # match "/mtablets/:id/edit" => "mtablets#edit", via: 'post'
  # match "/mtablets/:id" => "mtablets#update", via: 'get'
  # match '/mtablets/upload', to: 'mtablets#upload', via: 'post'
  
  get "mtablets/index"
  get "mtablets/update_show"
  match "/mtablets/show/:id" => "mtablets#show", via: 'get'
  match '/mtablets/new', to: 'mtablets#new', via: 'get'
  match "/mtablets/:id/edit" => "mtablets#edit", via: 'post'
  match '/mtablets/upload', to: 'mtablets#upload', via: 'post'
  
  resources :mtablets do
    collection { post :import }
  end

  resources :mtablets do
    member do
      get 'export'
    end
  end

  resources :mtablets do
    collection { post :exec_sql }
  end

  resources :mtablets do
    collection do
      post :dbclear
    end
  end

  resources :mtablets do
    collection do
      post :dbdelete
    end
  end

  match "/mtablets/:id" => "mtablets#update", via: 'post'

  resources :mtablets



  # resources :mtab1lets do
    # member do
      # get 'list'
    # end
  # end

  get "mtab1lets/index"
  # resources :mtab1lets do
    # member do
      # get 'list'
    # end
  # end

  # resources :mtab1lets do
    # collection { get :list }
  # end
  
  # get "mtab1lets/update_show"
  match "/mtab1lets/show/:id" => "mtab1lets#show", via: 'get'
  # get "mtab1lets/list"  
  # match '/mtab1lets/list' => 'mtab1lets#list', :constraints => { :only_ajax => true }, via: 'get'  
  match '/mtab1lets/list' => 'mtab1lets#list', via: 'get'  
  
  match '/mtab1lets/new', to: 'mtab1lets#new', via: 'get'
  match "/mtab1lets/:id/edit" => "mtab1lets#edit", via: 'post'
  match '/mtab1lets/upload', to: 'mtab1lets#upload', via: 'post'
  
  resources :mtab1lets do
    collection { post :import }
  end

  resources :mtab1lets do
    member do
      get 'export'
    end
  end

  resources :mtab1lets do
    collection { post :exec_sql }
  end

  resources :mtab1lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab1lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab1lets/:id" => "mtab1lets#update", via: 'post'

  resources :mtab1lets




  get "mtab2lets/index"
  get "mtab2lets/update_show"
  match "/mtab2lets/show/:id" => "mtab2lets#show", via: 'get'
  match '/mtab2lets/new', to: 'mtab2lets#new', via: 'get'
  match "/mtab2lets/:id/edit" => "mtab2lets#edit", via: 'post'
  match '/mtab2lets/upload', to: 'mtab2lets#upload', via: 'post'
  
  resources :mtab2lets do
    collection { post :import }
  end

  resources :mtab2lets do
    member do
      get 'export'
    end
  end

  resources :mtab2lets do
    collection { post :exec_sql }
  end

  resources :mtab2lets do
    collection do
      post :dbclear
    end
  end

  resources :mtab2lets do
    collection do
      post :dbdelete
    end
  end

  match "/mtab2lets/:id" => "mtab2lets#update", via: 'post'

  resources :mtab2lets

  
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
