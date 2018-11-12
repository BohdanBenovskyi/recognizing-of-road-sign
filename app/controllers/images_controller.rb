class ImagesController < ApplicationController
  def bin
    image_bin = `ls -tr /home/bohdan/Desktop/recognazing/Recognizing/public/uploads/#{current_user.email}/bin_img | tail -n 1`
    render json: "/uploads/#{current_user.email}/bin_img/" + image_bin.delete!("\n")
  end

  def classify
    image_class = `ls -tr /home/bohdan/Desktop/recognazing/Recognizing/public/uploads/#{current_user.email}/class_img | tail -n 1`
    render json: "/uploads/#{current_user.email}/class_img/" + image_class.delete!("\n")
  end
end