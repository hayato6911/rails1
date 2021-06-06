class UsersController < ApplicationController
  def index
   @users = User.all
   #Userテーブルから1つ1つidを取り出して計算をしている。
   @schedule = User.find_by(id: params[:id])
   @schedule_count = User.all.count
  end
  
  def new
   @user = User.new
  end
 
  def create
    @user = User.new(params.require(:user).permit(:title, :startdate, :enddate, :allday,  :introduction,))
      if @user.save
      flash[:notice] = "スケジュールを登録しました"
        redirect_to :users
      #更新に失敗した時はスケジュール一覧に戻る。
      else
        render "new"
      end
  end
 
  def show
    #Userモデルからidが「1」のレコードを読み込む
   @user = User.find(params[:id])
  end
 
  def edit
   @user = User.find(params[:id])
  end
 
  def update
    @user = User.find(params[:id])
    #@userにはfindメソッドで取得した編集対象のユーザー情報が格納されて、この@userに対してupdateメソッドを実行してる
      if @user.update(params.require(:user).permit(:title, :startdate, :enddate, :allday, :introduction))
        flash[:notice] = "ID「#{@user.id}」のスケジュールを更新しました"
        #更新成功時にはスケジュール一覧へ戻る
        redirect_to :users
      else
        render "edit"
      end
  end
 
  def destroy
   @user = User.find(params[:id])
    @user.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :users
  end
end
