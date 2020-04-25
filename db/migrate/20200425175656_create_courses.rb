class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.decimal :price
      t.string :currency
      t.string :course_type
      t.boolean :on_sell
      t.text :course_url
      t.text :description
      t.integer :valid_period

      t.timestamps
    end
  end
end
