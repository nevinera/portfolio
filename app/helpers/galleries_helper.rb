module GalleriesHelper
  def gallery_path(gal)
    "/galleries/#{gal.shortname}"
  end
end
