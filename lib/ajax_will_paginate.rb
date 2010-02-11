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
  
  # Valid options are :prototype, :jquery, :lowpro
  @@javascript_framework = :prototype
  mattr_reader :javascript_framework
  
  # Set this to a symbol to yield javascripts into a particular part of your
  # template or layout, e.g. <%= yield :javascripts %> within <head>.
  @@yield_javascript_within = nil
  mattr_reader :yield_javascript_within
  
  def self.javascript_include_filename
    "ajax-will-paginate.#{javascript_framework}.js"
  end
  
  def self.enable_actionpack
    require 'ajax_will_paginate/controller_helpers'
    ActionController::Base.send :include, ControllerHelpers
    require 'ajax_will_paginate/view_helpers'
    ActionView::Base.send :include, ViewHelpers
  end
  
end


if defined? Rails
  AjaxWillPaginate.enable_actionpack if defined? ActionController
  unless File.exist?(File.join(RAILS_ROOT, 'public', 'javascripts', AjaxWillPaginate.javascript_include_filename))
    Rails.logger.warn "#{AjaxWillPaginate.javascript_include_filename} not found in your application. Run ./script/generate ajax_will_paginate_javascripts to create it"
  end
end