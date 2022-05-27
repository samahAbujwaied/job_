class ResumesController < ApplicationController

   before_action :authenticate_user! 
   authorize_resource

    def index
      @resumes = Resume.all.where(job_id: params[:job_id])
    end
  
    def show
      @resume = Resume.find params[:id]
      @resume.update_attribute(:is_seen, true) unless @resume.is_seen
      @resume
      # @job = Job.find(params[:job_id])
      # @resume = Resume.find(params[:id])
      # @resume.update_attribute : is_seen,true
    end
  
    def create
      @job = Job.find(params[:job_id])
      @resume  = @job.resumes.build(resume_params)
      @resume.user_id = current_user.id
      
      if @resume.save
        redirect_to jobs_path
      else
        redirect_to job_path params[:job_id]
      end
    end

    def destroy
      @resume = Resume.find(params[:id])
      @resume.destroy
      redirect_to job_path(params[:job_id])
    end
  
    private
  
    def resume_params
      params.require(:resume).permit(:cover_letter, :attachment)
    end
  
end
  