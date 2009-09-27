class String
  def self.random
    "#{Time.now.to_i}r%X" % rand(10**32)
  end
end
