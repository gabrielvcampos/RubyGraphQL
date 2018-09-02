class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :key
      t.string :content

      t.timestamps
    end
  end
end
