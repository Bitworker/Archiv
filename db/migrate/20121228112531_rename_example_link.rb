class RenameExampleLink < ActiveRecord::Migration
  def up
    rename_column :archivs, :exampleLink, :example_link
  end

  def down
    rename_column :archivs, :example_link, :exampleLink
  end
end
