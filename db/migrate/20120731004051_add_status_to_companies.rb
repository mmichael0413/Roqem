class AddStatusToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :status, :string

  end
end
