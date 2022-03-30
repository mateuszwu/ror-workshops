class UsersControler < ActionController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to team_path()
        end

    end

    private

    def user_params
        #strong parameters
        params.require(:user).permit(:name)
    end