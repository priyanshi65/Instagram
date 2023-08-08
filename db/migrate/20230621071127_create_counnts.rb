class CreateCounnts < ActiveRecord::Migration[7.0]
  def change
    create_table :counnts do |t|
      t.integer :total_count

      t.timestamps
    end
  end
end
