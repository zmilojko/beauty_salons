module DistanceModule

  def power(num, pow)
    num ** pow
  end

  def sorted_by_distance
    dtor = Math::PI/180
    r = 6378.14

    rlat1 = 44.8395236 * dtor
    rlong1 = 20.4160086 * dtor
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
