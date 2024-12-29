class CreateListsAndTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :lists_and_tasks do |t|
      t.timestamps
    end
  end
end
