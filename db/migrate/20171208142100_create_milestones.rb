class CreateMilestones < ActiveRecord::Migration[5.0]
  def change
    create_table :milestones do |t|
      t.string :title
      t.boolean :done

      t.timestamps
    end
  end
end
