class CreateMakers < ActiveRecord::Migration[6.1]
  def change
    create_table :makers do |t|
      
      t.string    :makers_name
      t.timestamps
    end
  end
end
