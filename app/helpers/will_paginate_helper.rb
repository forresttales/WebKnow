module WillPaginateHelper

# class PaginationListLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer
# class PaginationListLinkRenderer < WillPaginate::ActionView::LinkRenderer
  class WillPaginateAjaxLinkRenderer < WillPaginate::ActionView::LinkRenderer
    
    
    protected
  
      def page_number(page)
        unless page == current_page
          tag(:li, link(page, page, :rel => rel_value(page)))
        else
          tag(:li, page, :class => "current")
        end
      end
  
      def previous_or_next_page(page, text, classname)
        if page
          tag(:li, link(text, page), :class => classname)
        else
          tag(:li, text, :class => classname + ' disabled')
        end
      end
  
      def html_container(html)
        tag(:ul, html, container_attributes)
      end
  
  end


  def ajax_will_paginate(collection, options = {})
    will_paginate(collection, options.merge(:renderer => WillPaginateHelper::WillPaginateAjaxLinkRenderer))
  end

  # class WillPaginateAjaxLinkRenderer < WillPaginate::ActionView::LinkRenderer
#     
#     
#     
      # def prepare(collection, options, template)
        # options[:params] ||= {}
        # options[:params]["_"] = nil
        # super(collection, options, template)
      # end
# 
# 
# 
      # protected
# 
        # def link(text, target, attributes = {})
          # if target.is_a? Fixnum
            # attributes[:rel] = rel_value(target)
            # target = url(target)
          # end
#       
      # # Rails.logger.info('target = ' + target.to_s)
#       
          # # @target = target.to_s      
          # # respond_to do |format|
            # # format.html
            # # format.js { render :action => 'publisher_users/index' }
            # # # format.js
            # # # render :partial => 'widget', :locals => { :poll => @poll }
          # # end
# 
          # ajax_call = "$.ajax({url: '#{target}', dataType: 'script'});"
          # @template.link_to_function(text.to_s.html_safe, ajax_call, attributes)
#           
        # end
#                   
#       
      # # respond_to do |format|
          # # # that will mean to send a javascript code to client-side;
          # # format.js { render             
              # # # raw javascript to be executed on client-side
              # # "alert('Hello Rails');", 
              # # # send HTTP response code on header
              # # :status => 404 # page not found,
              # # # load /app/views/your-controller/different_action.js.erb
              # # :action => "different_action",
              # # # send json file with @line_item variable as json
              # # :json => @line_item,
              # # :file => filename,
              # # :text => "OK",
              # # # the :location option to set the HTTP Location header
              # # :location => path_to_controller_method_url(argument)
            # # }
      # # end
#       
  # end      
#       
#       
# 
# 
  # def ajax_will_paginate(collection, options = {})
    # will_paginate(collection, options.merge(:renderer => WillPaginateHelper::WillPaginateAjaxLinkRenderer))
  # end


end
