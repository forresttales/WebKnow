class LogErrorsController < ApplicationController
  
  layout 'log_error'
  
  
  def index

      id_passed = nil
      id_passed = params[:id]
      @log_error_description = 'An error has occured'
      b_error = false
      if !id_passed.nil? 
        log_error = LogError.find(id_passed) rescue nil
        if !log_error.nil?
            @log_error_description = log_error.description
            b_error = true        
        end
      end
            
  end
  


  # def create
      # h_log_error = Hash.new
      # h_log_error[:controller] = params[:param_controller]
      # h_log_error[:action] = params[:param_action]
      # h_log_error[:profile_index] = params[:param_profile_index]
      # h_log_error[:profile_description] = params[:param_profile_description]
      # h_log_error[:description] = params[:param_description]
      # description = params[:param_description]
      # @description_saved = nil
      # @b_saved = false
      # log_error = LogError.new(h_log_error)
      # if log_error.save
          # @b_saved = true
          # @log_error_description = log_error.description
      # else
          # @log_error_description = description
      # end
      
      # :profile_index
      # :profile_description
      # :controller
      # :action
      # :description
  # end
  
end
