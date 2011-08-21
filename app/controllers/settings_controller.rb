class SettingsController < ApplicationController
  before_filter :authenticate_user!
  layout "settings"
  def index
    @view_name="index"
  end

  def card
    @view_name="card"
  end

  def resume
    @view_name="resume"
  end

  def extra
    @view_name="extra"
  end

  #这个方法不用了，调用registrationscontroller中的edit方法
  def account
    @view_name="account"
  end
  
  def contact
    @view_name="contact"
  end
end
