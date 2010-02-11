# AjaxWillPaginate
# == Global options
#
# You can set your preferred javascript framework globally for the app:
#
#   AjaxWillPaginate.js = :jquery
#
# This could be set from "config/initializers/ajax_will_paginate.rb" 
# (or simply environment.rb in older versions of Rails) 
module AjaxWillPaginate
  
  @@js = :prototype
  mattr_reader :js
  
  def self.enable_actionpack
    require 'ajax_will_paginate/ControllerHelpers'
    ActionController::Base.send :include, ControllerHelpers
  end
  
  
end


if defined? Rails
  AjaxWillPaginate.enable_actionpack if defined? ActionController
end