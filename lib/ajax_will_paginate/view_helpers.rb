module AjaxWillPaginate

  module ViewHelpers
    
    
    def ajax_will_paginate(*args)
      collection = args.shift
      options = args.shift
      pagination_class = options[:class] || WillPaginate::ViewHelpers.pagination_options[:class]
      pagination_selector = ".#{pagination_class}"
      element_selector = options.delete(:element)
      output = will_paginate(collection, options)
      if AjaxWillPaginate.yield_javascript_within
        content_for AjaxWillPaginate.yield_javascript_within do
          ajax_will_paginate_javascript(element_selector, pagination_selector, true)
        end
      else
        output += ajax_will_paginate_javascript(element_selector, pagination_selector)
      end
    end
    
    def ajax_will_paginate_javascript_include_tag
      javascript_include_tag AjaxWillPaginate.javascript_include_filename
    end
    
    private 
    def ajax_will_paginate_javascript(element_selector, pagination_selector, reactivate_after_ajax = false)
      javascript_tag do
        # "ajaxWillPaginate('#{element_selector}', '#{pagination_selector}', #{reactivate_after_ajax ? 'true' : 'false'});"
        "ajaxWillPaginate('#{element_selector}', '#{pagination_selector}');"
        
      end
    end
    
  end
  
end