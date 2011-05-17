class OwnersController < ApplicationController
  def refresh
    @own = Owner.find_by_id(params[:id])
    raise "Owner #{params[:id]} not found" unless @own.present?

    @own.rebuild_galleries_from_imgur!
    redirect_to "/"
  end
end
