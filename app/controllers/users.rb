class Users < Application

  def new
    render
  end

  def create
    @user = User.new(params[:user])
    if @user.valid?
      @user.save
      redirect resource(@user)
    else
      render :new
    end
  end

  def show
    @user = User[params[:id]]
    render
  end

  def change_ingame_id
    current_user.change_ingame_id params[:ingame_id]
    redirect resource(current_user)
  end
  
end
