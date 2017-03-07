class AttachmentUploader < CarrierWave::Uploader::Base
include CarrierWave
  #process resize_to_limit: [400, 400]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(pdf doc htm html docx rtf)
  end
end


