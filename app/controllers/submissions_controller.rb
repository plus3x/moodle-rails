class SubmissionsController < ApplicationController
  before_action :set_submission, only: %i(show edit update destroy)
  before_action :set_activity, only: %i(new create update)

  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = Submission.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @uploaded_files = @activity.uploaded_files.not_submitted.where(author: current_user)
    @submission = Submission.new(
      activity: @activity,
      author: current_user,
      files: @uploaded_files
    )
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @submission = Submission.new(submission_params)

    respond_to do |format|
      if @submission.save
        format.html do
          redirect_to [@activity.learning_unit.course, @activity.learning_unit, @activity],
                      notice: 'Submission was successfully created.'
        end
        format.json { render :show, status: :created, location: @submission }
      else
        format.html { render :new }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @submission.update(submission_params)
        format.html do
          redirect_to [@activity.learning_unit.course, @activity.learning_unit, @activity],
                      notice: 'Submission was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @submission }
      else
        format.html { render :edit }
        format.json { render json: @submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to submissions_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_submission
    @submission = Submission.find(params[:id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id] || (params[:submission] && params[:submission][:activity_id]))
  end

  def submission_params
    params.require(:submission).permit(:comment, :author_id, :activity_id, :grade, file_ids: [])
  end
end
