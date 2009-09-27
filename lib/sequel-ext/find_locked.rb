Sequel::Model.class_eval do
  def self.find_locked(param)
    dataset = if param.is_a?(Hash)
      filter(param)
    else
      filter(:id => param)
    end
    dataset.for_update.limit(1).all.first
  end
end
