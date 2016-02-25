module SalonsHelper
  def latest_salons
    @latest = Salon.all.order('created_at DESC').limit(4)
    return @latest
  end
end
