class ResumesController < ApplicationController
  def index
    @resumes = current_user.resumes.all
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = Resume.new(resume_params.merge(user_id: current_user.id))

    if @resume.save
      redirect_to resumes_path, notice: "The resume #{@resume.name} has been uploaded."
    else
      render "new"
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path, notice:  "The resume #{@resume.name} has been deleted."
  end

  private
    def resume_params
      params.require(:resume).permit(:name, :attachment)
    end
end
