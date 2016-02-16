class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def power(num, pow)
    num ** pow
  end

  def sorted_by_distance(mylat,mylng)
    dtor = Math::PI/180
    r = 6378.14

    # 44.8395236
    # 20.4160086
    rlat1 = mylat * dtor
    rlong1 = mylng * dtor
    rlat2 = self.lat * dtor
    rlong2 = self.lng * dtor

    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2

    a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c

    return d
  end

end
