class CreateShifts < ActiveRecord::Migration[6.1]
  def change
    create_table :shifts do |t|
      t.string :Employee_name
      t.date :Shift_date
      t.time :Start_time
      t.time :Finish_time
      t.decimal :Break_length
      t.string :Shift_cost

      t.timestamps
    end
  end
end
