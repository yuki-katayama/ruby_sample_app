class PostsController < ApplicationController
    before_action :authenticate_user, {only: [:index, :show, :edit, :update]}
    before_action :ensure_correct_user, {only: [:delete, :edit, :update]}

    def index
      @posts = Post.all.order(created_at: :desc)
    end
    def show
      @post = Post.find_by(id: params[:id])
      @user = @post.user
      @likes_count = Like.where(post_id: @post.id).count
    end
    def new
      @post = Post.new
    end
    def create
      @post = Post.new(content: params[:content], user_id: @current_user.id)
      if @post.save
        flash[:notice] = "投稿を作成しましした to Chidori"
        redirect_to('/posts/index')
      else
        render('posts/new')
      end
    end
  
    def edit
      @post = Post.find_by(id: params[:id])
    end
    def update
      @post = Post.find_by(id: params[:id])
      @post.content = params[:content]
  
      if @post.save
        flash[:notice] = "編集内容を保存しました by Chidori"
        redirect_to("/posts/index")
      else
        render("posts/edit")
      end
    end
    def delete
      @post = Post.find_by(id: params[:id])
      @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    end

    def ensure_correct_user
      @post = Post.find_by(id: params[:id])
      if @current_user.id != @post.user_id
        flash[:notice] = "権限がありません"
        redirect_to("/posts/index")
      end
    end
  end
  