class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.integer :submission_id
      t.integer :score
    end
  end
end
