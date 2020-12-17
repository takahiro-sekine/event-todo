class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :title,         null:false
      t.datetime :start_at,  null:false
      t.datetime :end_at,    null:false
      t.string :body,        null:false
      t.reference :user_id,  null:false

      t.timestamps
    end
  end
end
