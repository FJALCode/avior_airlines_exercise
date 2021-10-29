class AddColumnPhotoToOffers < ActiveRecord::Migration[6.0]
  def change
    add_column :offers, :photo_url, :string
  end
end
