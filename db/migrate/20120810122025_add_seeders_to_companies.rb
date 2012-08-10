class AddSeedersToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :seeders, :integer

  end
end
