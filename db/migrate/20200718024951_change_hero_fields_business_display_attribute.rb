class ChangeHeroFieldsBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    remove_column :business_display_attributes, :use_hero_video
    rename_column :business_display_attributes, :use_hero_image, :hero_image_or_video
  end
end
