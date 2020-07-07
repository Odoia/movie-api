class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name, :direction
      t.date :release_date
      t.integer :age_censure

      t.timestamps
    end
  end
end
