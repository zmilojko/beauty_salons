module ApplicationHelper

  def is_admin(user)
    if user_signed_in?
      if user.control.to_i == 0
        return true
      else
        return false
      end
    else
      return false
    end
  end

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
