class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :permalink
      t.integer :site_id

      t.timestamps
    end
  end
end
