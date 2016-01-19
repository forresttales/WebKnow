class PublisherHomesController < ApplicationController
  
    prepend_view_path 'app/views/publisher/profile'
    
    layout 'publisher_homes_index'
    
end
