class CreateArcs < ActiveRecord::Migration[6.1]
  def change
    create_table :arcs do |t|
      t.string   :arcs_name

      t.timestamps
    end
  end
end
