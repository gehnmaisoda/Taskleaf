class ApplicationController < ActionController::Base
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    # ||=User... は = @current_user || User...と同じ。左から順に評価されるため
    # この記法は変数の中がnilならsessionから取ったユーザーが代入されそれ以降はなにかを代入しようとしても値が入らない(値を破棄しない限り)
  end
  
end
