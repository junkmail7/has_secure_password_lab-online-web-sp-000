class SessionsController <  ApplicationController
    def new
    end
    def create
        user = User.find_or_create_by(name: params[:user][:name])
        user = user.try(:authenticate, params[:user][:name])
        return redirect_to(controller: 'sessions', action: 'new') unless user
        session[:user_id] = 1
        @user = user
        redirect_to controller: 'users', action: 'home'
    end
    def destroy
        session.delete :user_id
        redirect_to '/'
      end
  end
  