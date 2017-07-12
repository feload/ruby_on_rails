class CreateBook < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.belongs_to  :client, index: true
      t.string      :name
      t.string      :isbn
      t.timestamps
    end
  end
end
