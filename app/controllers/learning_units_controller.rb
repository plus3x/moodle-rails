class LearningUnitsController < ApplicationController
  before_action :set_learning_unit, only: %i(show edit update destroy)
  before_action :set_course

  # GET /courses/1/learning_units
  # GET /courses/1/learning_units.json
  def index
    @learning_units = @course.learning_units
  end

  # GET /courses/1/learning_units/1
  # GET /courses/1/learning_units/1.json
  def show
  end

  # GET /courses/1/learning_units/new
  def new
    @learning_unit = LearningUnit.new course: @course
  end

  # GET /courses/1/learning_units/1/edit
  def edit
  end

  # POST /courses/1/learning_units
  # POST /courses/1/learning_units.json
  def create
    @learning_unit = LearningUnit.new(learning_unit_params)

    respond_to do |format|
      if @learning_unit.save
        format.html { redirect_to [@course, @learning_unit], notice: 'Learning unit was successfully created.' }
        format.json { render :show, status: :created, location: @learning_unit }
      else
        format.html { render :new }
        format.json { render json: @learning_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1/learning_units/1
  # PATCH/PUT /courses/1/learning_units/1.json
  def update
    respond_to do |format|
      if @learning_unit.update(learning_unit_params)
        format.html { redirect_to [@course, @learning_unit], notice: 'Learning unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @learning_unit }
      else
        format.html { render :edit }
        format.json { render json: @learning_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1/learning_units/1
  # DELETE /courses/1/learning_units/1.json
  def destroy
    @learning_unit.destroy
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Learning unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_learning_unit
    @learning_unit = LearningUnit.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def learning_unit_params
    params.require(:learning_unit).permit(:title).merge course_id: params[:course_id]
  end
end
