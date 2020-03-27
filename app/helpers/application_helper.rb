module ApplicationHelper
  def list_image(image, alt: "Image")
    use_image = image ? image : "no_image.png"
    image_tag(use_image, alt: alt).html_safe
  end
end
