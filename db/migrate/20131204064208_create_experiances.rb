class CreateExperiances < ActiveRecord::Migration
  def change
    create_table :experiances do |t|
      t.string :country
      t.integer :user_id
      t.string :company
      t.string :postal_code
      t.integer :status
      t.string :job_title
      t.string :company
      t.string :most_recent_job_tile
      t.string :most_recent_company
      t.integer :jsyear
      t.integer :jeyear
      t.string :school_university
      t.integer :dsyear
      t.integer :deyear

      t.timestamps
    end
  end
end
