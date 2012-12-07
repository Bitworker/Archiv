class CreateArchivs < ActiveRecord::Migration
  def change
    create_table :archivs do |t|
      t.string :name
      t.string :category
      t.string :terms
      t.string :exampleLink
      t.integer :points

      t.timestamps
    end
  end
end
