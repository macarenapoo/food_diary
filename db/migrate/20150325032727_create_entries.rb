class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :date
      t.time :time
      t.text :food
      t.text :situation

      t.timestamps
    end
  end
end
