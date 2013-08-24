class PatientsController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @patient=Patient.new
  end
  
  def create
    @patient=Patient.new(patient_params)
    if @patient.save
      ids = params['patient']['doctor_ids']
      ids.each do |id|
        doct = Doctor.find(id)
        @patient.doctors << doct 
      end
      redirect_to @patient
    else
      render 'new'
    end
  end
  
  def show
    #Doctor.find(params['patient']['doctor_ids'][0]).patients << Patient.find(params[:id])
    @patient=Patient.find(params[:id])
    @doctors=@patient.doctors
  end
  
  def index
    @patients=Patient.all
  end
  
  
  def edit
    raise params.inspect
    @patient = Patient.find(params[:id])
  end
  
  def update
    @patient = Patient.find(params[:id])
    if @patient.update(params[:patient].permit(:name))
      ids = params['patient']['doctor_ids']
      ids.each do |id|
        doct = Doctor.find(id)
        if !@patient.doctors.exists?(id)
          @patient.doctors << doct 
        end
        (1.. Doctor.find(:all).length).each do |doctor|
          if !ids.include?(doctor.to_s)
            if @patient.doctors.exists?(doctor)
              @patient.doctors.destroy(doctor)
            end
          end
        end
      end
      redirect_to @patient
    else
      render 'edit'
    end
  end
  
  
  private
    def patient_params
      params.require(:patient).permit(:name)
    end    
end
