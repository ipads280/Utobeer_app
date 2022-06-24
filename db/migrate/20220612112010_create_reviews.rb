class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer  :item_id
      t.integer  :user_id
      t.string   :title
      t.text     :text
      t.integer  :star
 
      t.timestamps
    end
  end
end
