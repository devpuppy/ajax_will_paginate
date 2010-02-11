module AjaxWillPaginate

  module ViewHelpers
    
    
    def ajax_will_paginate(*args)
      output = will_paginate(args)
      # TODO: find a way to see if yield block is defined
      output += javascript_tag do
        "ajaxWillPaginate('element', '.pagination');"
        # ignore the param_name
        # inspect the class = 'pagination'
      end
    end
    
  end
  
end