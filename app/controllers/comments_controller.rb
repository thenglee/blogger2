class CommentsController < ApplicationController

  include CommentsHelper

  before_filter :require_login, except: [:create]
  before_filter :get_article, only: [:create]

  def create
    if @comment = @article.comments.create(comment_params)
      redirect_to article_path(@comment.article)
    else
      render @comment
    end

    # @comment = Comment.new(comment_params)
    # puts "\n========\n#{@comment.inspect}\n========\n"

    # @comment.article_id = params[:article_id]
    # @comment.save
    # redirect_to article_path(@comment.article)
  end

  def get_article
    @article = Article.find_by(id: params[:article_id])
  end
end
