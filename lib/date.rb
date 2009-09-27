Date.class_eval do
  def self.yesterday
    today - 1
  end
end
