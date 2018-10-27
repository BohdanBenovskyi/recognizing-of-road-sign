class DropResumesTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :resumes
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
