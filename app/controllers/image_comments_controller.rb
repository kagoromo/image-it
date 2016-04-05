class ImageCommentsController < ApplicationController
  before_action :set_image_comment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  
  # Check owner
  def correct_user
    if current_user != ImageComment.find(params[:id]).user
      redirect_to set_url
    end
  end

  # GET /image_comments
  # GET /image_comments.json
  def index
    @image_comments = ImageComment.all
  end

  # GET /image_comments/1
  # GET /image_comments/1.json
  def show
  end

  # GET /image_comments/new
  def new
    @image_comment = ImageComment.new
  end

  # GET /image_comments/1/edit
  def edit
  end

  # POST /image_comments
  # POST /image_comments.json
  def create
    @image_comment = ImageComment.new(image_comment_params)
    @image_comment.user_id = current_user.id

    respond_to do |format|
      if @image_comment.save
        format.html { redirect_to set_url, notice: 'Image comment was successfully created.' }
        format.json { render :show, status: :created, location: @image_comment }
      else
        format.html { render :new }
        format.json { render json: @image_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /image_comments/1
  # PATCH/PUT /image_comments/1.json
  def update
    respond_to do |format|
      if @image_comment.update(image_comment_params)
        format.html { redirect_to set_url, notice: 'Image comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_comment }
      else
        format.html { render :edit }
        format.json { render json: @image_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_comments/1
  # DELETE /image_comments/1.json
  def destroy
    @image_comment.destroy
    respond_to do |format|
      format.html { redirect_to set_url, notice: 'Image comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_comment
      @image_comment = ImageComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_comment_params
      params.require(:image_comment).permit(:user_id, :image_id, :comment)
    end
    
    def set_url
      "/images/" + @image_comment.image_id.to_s
    end
end
