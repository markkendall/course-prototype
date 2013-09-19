class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :completed_challenges
    end
  end
end
