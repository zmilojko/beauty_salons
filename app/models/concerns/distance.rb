module Distance
  extend ActiveSupport::Concern

  def power(num, pow)
    num ** pow
  end

  def calculate_distance(lat,lng,mylat,mylng)
    dtor = Math::PI/180
    r = 6378.14

    # 44.8395236
    # 20.4160086
    rlat1 = lat * dtor
    rlong1 = lng * dtor
    rlat2 = mylat * dtor
    rlong2 = mylng * dtor

    dlon = rlong1 - rlong2
    dlat = rlat1 - rlat2

    a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1) * Math::cos(rlat2) * power(Math::sin(dlon/2), 2)
    c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
    d = r * c

    return d
  end

end
