class StaticPagesController < ApplicationController
  
  def search_images_by_name
    set_result(Image)
    set_search(Image,"name")
  end
  helper_method :search_images_by_name
  
  def search_images_by_title
    set_result(Image)
    set_search(Image,"title")
  end
  helper_method :search_images_by_title
  
  def search_users_by_name
    set_result(User)
    set_search(User,"name")
  end
  helper_method :search_users_by_name
  
  def search_users_by_email
    set_result(User)
    set_search(User,"email")
  end
  helper_method :search_users_by_email
  
  private
  def set_result(data)
    @result = data.all
  end
  
  def set_search(data, catergory)
    if params[:search]
      @result = data.search(catergory, params[:search]).order("created_at DESC")
    else
      @result = data.all.order('created_at DESC')
    end
  end
  
end
