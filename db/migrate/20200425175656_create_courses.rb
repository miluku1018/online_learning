class CreateCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :courses do |t|
      t.string :title
      t.decimal :price
      t.integer :currency
      t.string :course_type
      t.boolean :on_sell, default: true
      t.string :course_url
      t.text :description
      t.integer :valid_period

      t.timestamps
    end
    
    add_index :courses, :course_url, unique: true
  end
end
