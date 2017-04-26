class CreateJokes < ActiveRecord::Migration[5.0]
  def change
    create_table :jokes do |t|
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
