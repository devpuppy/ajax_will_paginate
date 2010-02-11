module AjaxWillPaginate

  module ControllerHelpers
    
    # Renders the next page of results via ajax.
    #
    # Pass element, render_options to generate an RJS response
    # element will be treated as an id if using Prototype, or a selector if using jQuery
    #
    # Why use RJS?  It makes it easier to handle unexpected cases, e.g. redirect to a login URL 
    # if the user's session has timed out and they click a pagination link. If you don't want to
    # use RJS, just call render instead of this method.
    # 
    # The partial should include the element to be replaced wrapping the paginated results and 
    # pagination controls. If you need something more complex, simply define your own RJS instead
    # of calling this method.
    def ajax_will_paginate(element, render_options)
      response = render_to_string render_options
      render :update do |page|
        page.replace_html element, response
      end
    end
    
  end
  
end