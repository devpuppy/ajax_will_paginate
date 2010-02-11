function ajaxWillPaginate(element_id, pagination_selector) {
  $(element_id).select(pagination_selector + ' a').each(function(control){
    control.observe('click', function(event){
      new Ajax.Request( control.readAttribute('href'), {
                        method: 'get', 
                        evalJS: true,
                        parameters: 'ajax_will_paginate_target='+escape('#'+element_id)
      });
      event.stop();
    });
  });
}