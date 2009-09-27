class User < Sequel::Model
  include Sequel::Timestamps

  def change_ingame_id(value)
    if %r{http://riteriai.draugas.lt/\?recruit=6H(\d+)} === value
      self.ingame_id = $1
    else
      self.ingame_id = value
    end
    save
  end
end
