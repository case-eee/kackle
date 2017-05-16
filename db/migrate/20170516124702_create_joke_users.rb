class CreateJokeUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :joke_users do |t|
      t.references :joke, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
