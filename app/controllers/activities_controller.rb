class ActivitiesController < ApplicationController
  before_action :set_course
  before_action :set_learning_unit
  before_action :set_activity, only: %i(show edit update destroy)

  # GET /courses/1/learning_units/1/activities
  # GET /courses/1/learning_units/1/activities.json
  def index
    @activities = @learning_unit.activities
  end

  # GET /courses/1/learning_units/1/activities/1
  # GET /courses/1/learning_units/1/activities/1.json
  def show
  end

  # GET /courses/1/learning_units/1/activities/new
  def new
    @activity = Activity.new learning_unit: @learning_unit
  end

  # GET /courses/1/learning_units/1/activities/1/edit
  def edit
  end

  # POST /courses/1/learning_units/1/activities
  # POST /courses/1/learning_units/1/activities.json
  def create
    @activity = Activity.new(activity_params)

    respond_to do |format|
      if @activity.save
        format.html { redirect_to [@course, @learning_unit, @activity], notice: 'Activity was successfully created.' }
        format.json { render :show, status: :created, location: @activity }
      else
        format.html { render :new }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1/learning_units/1/activities/1
  # PATCH/PUT /courses/1/learning_units/1/activities/1.json
  def update
    respond_to do |format|
      if @activity.update(activity_params)
        format.html { redirect_to [@course, @learning_unit, @activity], notice: 'Activity was successfully updated.' }
        format.json { render :show, status: :ok, location: @activity }
      else
        format.html { render :edit }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1/learning_units/1/activities/1
  # DELETE /courses/1/learning_units/1/activities/1.json
  def destroy
    @activity.destroy
    respond_to do |format|
      format.html { redirect_to [@course, @learning_unit], notice: 'Activity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_activity
    @activity = Activity.find(params[:id])
  end

  def set_learning_unit
    @learning_unit = LearningUnit.find(params[:learning_unit_id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def activity_params
    params.require(:activity).permit(:title).merge learning_unit_id: params[:learning_unit_id]
  end
end
