Time.class_eval do
  def eu_wday
    wday == 0 ? 7 : wday
  end
end
