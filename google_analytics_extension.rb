# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class GoogleAnalyticsExtension < Radiant::Extension
  version "1.0"
  description "Nothing. Just a Google Analytics code generater for Radiant CMS"
  url "http://github.com/amrnt/radiant-google-analytics-extension"
  
  # define_routes do |map|
  #   map.namespace :admin, :member => { :remove => :get } do |admin|
  #     admin.resources :google_analytics
  #   end
  # end
  
  def activate
    Page.send :include, GoogleAnalytics
    # admin.tabs.add "Google Analytics", "/admin/google_analytics", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Google Analytics"
  end
  
end
