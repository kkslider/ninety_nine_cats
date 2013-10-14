class CreateCatsTableWithUserId < ActiveRecord::Migration
  def change
    create_table :cats do |t|
      t.integer :age, null: false
      t.date :birth_date, null: false
      t.string :color, inclusion: { in: %w[red orange yellow green blue black] }, null: false
      t.string :name, null: false
      t.string :sex, inclusion: { in: %w[M F] }, null: false
      t.integer :user_id, null: false
      
      t.timestamps
    end
    
    add_index(:cats, :user_id)
  end
end
