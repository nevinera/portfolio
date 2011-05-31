class GalleriesController < ApplicationController
  def setup
    if settings_found?
      redirect_to root_path
    end
  end

  def write_settings
    if settings_found?
      raise "reset settings by changing the imgur password"
      redirect_to root_path
    else
      if [params[:username], params[:password], params[:email]].all?{|p| p.present?}
        Setting.set(:username, params[:username])
        Setting.set(:password, params[:password])
        Setting.set(:email,    params[:email]) 

        redirect_to root_path
      else
        redirect_to setup_path
      end
    end
  end

  def splash
    redirect_to(setup_path) unless self.settings_found?
  end

  def index
    @gals = Gallery.all
    @email = Setting.get :email
  end

  def show
    @gal = Gallery.find_by_shortname(params[:shortname])
    raise "No gallery found" unless @gal.present?
  end

  def rebuild
    @username = Setting.get :username
    @last_built = Setting.get :last_built
  end

  def fetch
    begin
      Gallery.limited_rebuild! 5.minutes
      redirect_to root_path
    rescue RestClient::BadRequest
      Setting.clear!
      redirect_to root_path
    end
  end


  def settings_found?
    Setting.get(:username).present? and Setting.get(:password).present? and Setting.get(:email).present?
  end
end
