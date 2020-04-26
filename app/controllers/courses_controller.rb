class CoursesController < ApplicationController
  before_action :authenticate_account!
  before_action :find_course, only:[:show, :edit, :update,:destroy]

  def index
    @courses = Course.all
  end

  def show
  
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to root_path, notice: '課程已新增'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to edit_course_path(@course), notice: '課程已更新'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to root_path, notice: '課程已刪除'
  end

  private
  def find_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:title, :price, :currency, :course_type, :on_sell, :course_url, :description, :valid_period)
  end
end
