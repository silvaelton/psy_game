class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |t|
      t.references :user, index: true
      t.string     :user_choice
      t.string     :computer_choice
      t.integer    :group_id
      t.integer    :step_id
      t.integer    :round_id
      t.timestamps null: false
    end
  end
end
