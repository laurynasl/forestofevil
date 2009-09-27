class Welcome < Application

  def index
    render
  end

  def resource_urls
    @ingame_ids = User.filter(~{:ingame_id => nil}).select(:ingame_id).all.invoke(:ingame_id)
    render
  end
  
end
