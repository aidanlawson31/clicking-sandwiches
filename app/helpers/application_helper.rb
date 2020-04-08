module ApplicationHelper
  def list_image(image, alt: "Image")
    use_image = image ? image : "no_image.png"
    image_tag(use_image, alt: alt).html_safe
  end

  	def tooltip_label(label, tooltip, position: 'bottom')
		raise ArgumentError, 'invalid position' unless ['top', 'bottom', 'left', 'right'].include?(position)

		"#{label}<span data-toggle='tooltip' title='#{tooltip}' data-placement='#{position}' class='fa fa-info-circle text-muted tooltip-icon'></span></abbr>".html_safe
	end
end
