class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name]
      found_student = students.filter { |student| student.to_s.downcase.include?(params[:name]) }
      render json: found_student
    else
      render json: students
    end
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
