class Users < Application

  def new
    render
  end

  def create
    @user = User.new(params[:user])
    @user.save
    redirect resource(@user)
  end

  def show
    @user = User[params[:id]]
    render
  end
  
end
