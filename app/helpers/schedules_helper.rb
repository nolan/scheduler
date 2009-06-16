module SchedulesHelper
  def miles(distance)
    number_with_precision(distance, :precision => 0, :separator => '.', :delimiter => ',') + ' mi.'
  end
end
