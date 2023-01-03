class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.string :mpaa
      t.integer :year
      t.integer :runtime
      t.string :synopsis
      t.boolean :availability

      t.timestamps
    end
  end
end
