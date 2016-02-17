module ApplicationHelper

  def location_is_know
    # GET COOKEIS
    lat_cookie = cookies[:lat]
    lng_cookie = cookies[:lng]
    # TEST IF COOKIES ARE SET
    if (!cookies[:lat] or !cookies[:lng])
      return false
    else
      return true
    end
  end

end
