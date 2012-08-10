class AddRaisedToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :raised, :integer

  end
end
