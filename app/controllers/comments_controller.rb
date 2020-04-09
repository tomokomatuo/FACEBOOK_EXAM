class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :show, :edit]
  
  def index
    @comment = Comment.all
  end
  
  def new
    @comment = Comment.new
  end
  
  def create
    @comment = Comment.create(comment_params)
    if @comment.save
    redirect_to comments_path, notice: "投稿完了しました！"
    else
    render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @comment.update(comment_params)
      redirect_to comments_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end
  
  def destroy
    @comment.destroy
    redirect_to comments_path, notice: "コメントを削除しました。"
  end
  
  def confirm
    @comment = Comment.new(comment_params)
    render :new if @comment.invalid?
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content)
  end
  
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
