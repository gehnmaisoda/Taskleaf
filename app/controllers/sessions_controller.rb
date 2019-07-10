class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      # ぼっち演算子&.は中身がnilだった場合も例外を出さない
      #session_params[:email]に対応するユーザーが見つからなかった場合はnilになるので&.を使う必要がある
      session[:user_id] = user.id
      redirect_to root_url, notice: "ログインしました"
    else
      render :new
    end
  end
  
  def destroy
    reser_session
    redirect_to root_url, notice: "ログアウトしました。"
  end
  
  private
    # publicなメソッドは基本的にアクションとして使える(urlからアクセスできる？)
    # そのため内部的に使いたいメソッドはprivate内に記述するのが基本
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
