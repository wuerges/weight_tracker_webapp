class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.decimal :weight, precision: 5, scale: 1

      t.timestamps
    end
  end
end
