include ActionView::Helpers::SanitizeHelper

module Utility
  module_function # Allows you to call methods like class methods. E.g. Util.method. 

  def sanitize_rich_text(description)
    sanitized_description = sanitize(description)
    sanitized_description = sanitized_description.gsub("\n", '') if sanitized_description
	end
end
