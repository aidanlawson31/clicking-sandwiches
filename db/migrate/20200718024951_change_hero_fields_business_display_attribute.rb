class ChangeHeroFieldsBusinessDisplayAttribute < ActiveRecord::Migration[5.2]
  def change
    remove_column :business_display_attributes, :use_hero_video, :boolean
    rename_column :business_display_attributes, :use_hero_image, :hero_image_or_video

    reversible do |change|
      change.up do
        execute "update business_display_attributes set hero_image_or_video = true"
      end
    end
  end
end
