class JobsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, ]
    # before_action :set_post, only: [:show, :edit, :update, :destory]
    load_and_authorize_resource
    # before_action :authenticate_user!, except: [:index, :show ]

    def index
      @job = Job.all.order(created_at: :desc)
    end
    
  
    def show; end
  
    def new
      @job = Job.new
    end
  
    def create
      
      @job = current_user.jobs.new(job_params)
      # authorize! :create, @job
      if @job.save
        redirect_to jobs_path, success: 'Job was successfully created.'
      else
        render :new
      end
    end
  
    def edit; end
  
    def update
      if @job.update(job_params)
        redirect_to jobs_path
      else
        render :edit
      end
    end
  
    def destroy
      @job.destroy
      redirect_to jobs_path
    end
  
    private

    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:title, :description, :status)
    end
  end
  