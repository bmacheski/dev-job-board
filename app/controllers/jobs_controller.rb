class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = current_user.jobs.build
  end

  def edit
  end

  def create
    @job = current_user.jobs.build(job_params)
    if @job.save
      redirect_to @job
    else
      redirect_to root_url
    end
  end

  private
    def job_params
      params.require(:job).permit(:title, :category, :location,
        :company_name, :contact_info, :description)
    end
end
