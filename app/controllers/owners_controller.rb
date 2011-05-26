class OwnersController < ApplicationController
  def rebuild
    @own = Owner.first
  end

  def fetch
    @own = Owner.first
    @own.limited_rebuild! 5.minutes

    redirect_to  root_path
  end
end
