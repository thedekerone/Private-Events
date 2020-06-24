class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.date :event_date
      t.string :name
      t.string :description
      t.belongs_to :creator
      t.timestamps
    end
  end
end
