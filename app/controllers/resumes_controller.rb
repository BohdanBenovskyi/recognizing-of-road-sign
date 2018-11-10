require 'filewatcher'

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
      Thread.new do
        att_name = @resume.attachment_url.split('/').last
        system("python3 lib/assets/background/main.py --file_name=public/uploads/#{current_user.email}/#{att_name} --file_txt_output=public/uploads/#{current_user.email}/Output.txt --file_video_output=public/uploads/#{current_user.email}/Output.avi --bin_img_path=public/uploads/#{current_user.email}/bin_img --class_img_path=public/uploads/#{current_user.email}/class_img")
      end
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
