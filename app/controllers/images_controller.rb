class ImagesController < ApplicationController
  def bin
    @image_bin = Dir.glob("public/uploads/#{current_user.email}/bin_img/*.png").last.remove('public')
    render json: @image_bin
  end

  def classify
    @image_class = Dir.glob("public/uploads/#{current_user.email}/class_img/*.png").last.remove('public')
  end
end