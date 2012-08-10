class AddPitchToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :pitch, :text

  end
end
