class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :job_title
      t.integer :office

      t.timestamps
    end
  end
end
