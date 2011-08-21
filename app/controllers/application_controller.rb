class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :specify_layout

  protected 

    def specify_layout
      #controller_name == 'registrations' && action_name == 'edit' ? 'settings' : 'devise'
      controller_name == 'registrations' ? 'settings' : 'application'
    end
end
