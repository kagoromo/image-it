class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @images = current_user.images.build
    end
  end
end
