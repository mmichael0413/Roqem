class AddShortUrlToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :short_url, :string

  end
end
