require "csv"
require "prawn"
class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy, :download_pdf]

  def index
    @posts = current_user.posts

  end

  def Show
  end 

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
        redirect_to @post, notice: "Post created successfully"
    else
        render :new, status: :unprocessable_entity
    end 
  end

  def edit
  end


  def update
    if @post.update(post_params)
        redirect_to @post, notice: "Post updated successfully"
    else
        render :edit
    end

  end


  def destroy
    @post.destroy
    redirect_to posts_path, notice: "Post deleted"
  end

  def import_csv
    if params[:file].present?
      csv_text = params[:file].read
      csv = CSV.parse(csv_text, headers: true)

      csv.each do |row|
        current_user.posts.create(
          title: row["title"],
          content: row["content"]
        )
      end

      redirect_to posts_path, notice: "CSV Imported!"
    else
      redirect_to posts_path, alert: "Please upload a CSV file."
    end
  end

  def download_pdf
    pdf = Prawn::Document.new
    pdf.text "Title: #{@post.title}", size: 18, style: :bold
    pdf.move_down 10
    pdf.text @post.content.to_s

    send_data pdf.render,
              filename: "#{@post.title}.pdf",
              type: "application/pdf",
              disposition: :attachment
  end



  private

  def set_post
    @post = current_user.posts.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
