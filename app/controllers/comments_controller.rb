class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
    # @comment = Comment.new
    # @comment.comment_id = @comment.id
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]

    @comment.save

    # flash.notice = "Comment '#{@comment.title}' Creaated!"

    redirect_to article_path(@comment.article)
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy

    flash.notice = "Comment '#{@comment.title}' Deleted!"

    redirect_to '/comments'
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update(comment_params)

    flash.notice = "Comment '#{@comment.title}' Updated!"

    redirect_to comment_path(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:author_name, :body)
  end
end
