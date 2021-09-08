class StudentsController < ApplicationController
  def index
    students = if params[:name]
                 Student.where(["lower(first_name) = ? or lower(last_name) = ?", params[:name].to_s,
                                params[:name].to_s])
               else
                 Student.all
               end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end
end
