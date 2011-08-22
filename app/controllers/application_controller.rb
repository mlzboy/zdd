class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :specify_layout

  protected 

    def specify_layout
      #controller_name == 'registrations' && action_name == 'edit' ? 'settings' : 'devise'
      controller_name == 'registrations' && (action_name == 'edit' or  action_name== 'update') ? 'settings' : 'application'
    end
end
