class AddHeroBooleansToBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    add_column :business_display_attributes, :use_hero_image, :boolean 
    add_column :business_display_attributes, :use_hero_video, :boolean
  end
end
