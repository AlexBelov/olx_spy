class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :url
      t.integer :link_id
      t.timestamps
    end
  end
end
