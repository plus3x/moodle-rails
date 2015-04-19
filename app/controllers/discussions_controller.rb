class DiscussionsController < ApplicationController
  before_action :set_course
  before_action :set_discussion, only: %i(show edit update destroy)

  # GET /discussions
  # GET /discussions.json
  def index
    @discussions = Discussion.where(course: @course)
  end

  # GET /discussions/1
  # GET /discussions/1.json
  def show
  end

  # GET /discussions/new
  def new
    @discussion = Discussion.new course: @course
  end

  # GET /discussions/1/edit
  def edit
  end

  # POST /discussions
  # POST /discussions.json
  def create
    @discussion = Discussion.new(discussion_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to [@course, @discussion], notice: 'Discussion was successfully created.' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /discussions/1
  # PATCH/PUT /discussions/1.json
  def update
    respond_to do |format|
      if @discussion.update(discussion_params)
        format.html { redirect_to [@course, @discussion], notice: 'Discussion was successfully updated.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /discussions/1
  # DELETE /discussions/1.json
  def destroy
    @discussion.destroy
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Discussion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_discussion
    @discussion = Discussion.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def discussion_params
    params
      .require(:discussion)
      .permit(:title, :question, :course_id, :author_id, :bootsy_image_gallery_id)
      .merge(course_id: params[:course_id])
  end
end
