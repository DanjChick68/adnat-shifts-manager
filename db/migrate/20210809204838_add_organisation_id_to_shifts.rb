class AddOrganisationIdToShifts < ActiveRecord::Migration[6.1]
  def change
    add_column :shifts, :organisation_id, :integer
    add_index :shifts, :organisation_id
  end
end
