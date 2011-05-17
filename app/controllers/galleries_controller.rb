class GalleriesController < ApplicationController

  def splash
  end

  def index
    @gals = Gallery.all
  end

  def show
    @gal = Gallery.find_by_shortname(params[:shortname])
    raise "No gallery found" unless @gal.present?
  end
end
