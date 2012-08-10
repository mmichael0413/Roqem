class AddGoalToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :goal, :integer

  end
end
