include ActionView::Helpers::SanitizeHelper

module Utility
  module_function # Allows you to call methods like class methods. E.g. Util.method. 

  def sanitize_rich_text(description)
    sanitized_description = sanitize(description)
    sanitized_description = sanitized_description.gsub("\n", '') if sanitized_description
  end

  # Copy an image from assets to an ActiveStorage field
	def attach_asset_image(asset_image, to_image, type: 'png')
		to_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', asset_image)), filename: asset_image, content_type: "image/#{type}")
	end
end
