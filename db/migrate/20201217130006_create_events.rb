class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :title,         null:false
      t.datetime :start_at,  null:false
      t.datetime :end_at,    null:false
      t.string :body,        null:false
      t.references :user 
      t.timestamps
    end
  end
end
