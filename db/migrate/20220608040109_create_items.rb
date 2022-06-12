class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer    :user_id
      t.string     :item_name
      t.string     :item_image
      t.text       :item_text
      t.integer    :genre_id
      t.integer    :maker_id
      t.integer    :item_price
      t.integer    :arc_id
      t.string     :release_date

      t.timestamps
    end
  end
end
