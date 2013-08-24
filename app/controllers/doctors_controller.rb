class DoctorsController < ApplicationController

  def new
    @doctor=Doctor.new
  end
  
  def create
    @doctor=Doctor.new(doctor_params)
    if @doctor.save
      redirect_to @doctor
    else
      render 'new'
    end
  end
  
  def show
  @doctor=Doctor.find(params[:id])
  #raise @doctor.patients.inspect
  @patients=@doctor.patients
  #@patients=Patient.find(:all, :conditions => ["doctor_id = ?", @doctor.id])
  #@patients=Patient.where(:doctor_id => @doctor.id)
  end
  
  def index
    @doctors=Doctor.all
  end
  
  private
  def doctor_params
    params.require(:doctor).permit(:name)
  end
end
