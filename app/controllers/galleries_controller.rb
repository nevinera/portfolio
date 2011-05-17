class GalleriesController < ApplicationController
  def index
    @gals = Gallery.all
  end

  def show
    puts "params[:shortname] = '#{params[:shortname]}'"
    @gal = Gallery.find_by_shortname(params[:shortname])
    raise "No gallery found" unless @gal.present?
    puts "Gallery #{@gal.id} was chosen"
  end
end
