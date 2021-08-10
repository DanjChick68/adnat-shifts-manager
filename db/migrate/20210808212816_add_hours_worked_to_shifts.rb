class AddHoursWorkedToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :hours_worked, :decimal
  end
end
