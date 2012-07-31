class Company < ActiveRecord::Base
  has_many :posts
  
  def self.new_company(company_id)
    company = Company.new
    company_token = Company.company_id
  end
end
