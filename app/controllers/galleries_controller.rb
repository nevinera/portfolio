class GalleriesController < ApplicationController

  def splash
  end

  def main
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
    Gallery.limited_rebuild! 5.minutes
    redirect_to  root_path
  end
end
