class UploadFilesController < ApplicationController
  before_action :set_upload_file, only: %i(show edit update destroy)
  before_action :set_activity, only: %i(new create)

  # GET /upload_files
  # GET /upload_files.json
  def index
    @upload_files = UploadFile.all
  end

  # GET /upload_files/1
  # GET /upload_files/1.json
  def show
  end

  # GET /upload_files/new
  def new
    @upload_file = UploadFile.new
  end

  # GET /upload_files/1/edit
  def edit
  end

  # POST /upload_files
  # POST /upload_files.json
  def create
    @upload_file = UploadFile.new(upload_file_params)

    respond_to do |format|
      if @upload_file.save
        format.html do
          redirect_to [@activity.learning_unit.course, @activity.learning_unit, @activity],
                      notice: 'Upload file was successfully created.'
        end
        format.json { render :show, status: :created, location: @upload_file }
      else
        format.html { render :new }
        format.json { render json: @upload_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /upload_files/1
  # PATCH/PUT /upload_files/1.json
  def update
    respond_to do |format|
      if @upload_file.update(upload_file_params)
        format.html { redirect_to @upload_file, notice: 'Upload file was successfully updated.' }
        format.json { render :show, status: :ok, location: @upload_file }
      else
        format.html { render :edit }
        format.json { render json: @upload_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /upload_files/1
  # DELETE /upload_files/1.json
  def destroy
    @upload_file.destroy
    respond_to do |format|
      format.html { redirect_to upload_files_url, notice: 'Upload file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_upload_file
    @upload_file = UploadFile.find(params[:id])
  end

  def set_activity
    @activity = Activity.find(params[:activity_id] || (params[:upload_file] && params[:upload_file][:activity_id]))
  end

  def upload_file_params
    params.require(:upload_file).permit(:file, :activity_id, :author_id)
  end
end
