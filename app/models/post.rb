class Post < ActiveRecord::Base
  require 'net/http'
  require 'json'
  
  belongs_to :company
  
  def self.new_post(company, token)
    #Grab the company info from CS in JSON format
    uri_comp = URI.parse("http://staging.cedarstack.com/api/#{company}")
    response = Net::HTTP.get_response(uri_comp)
    
    #Grab the post info from CS in JSON format
    uri_post = URI.parse("http://staging.cedarstack.com/api/#{company}/n/#{token}")
    response2 = Net::HTTP.get_response(uri_post)
    
    #Parse the data and save it into hashes
    company_data = JSON.parse(response.body)
    post_data = JSON.parse(response2.body)
    
    #Check if the company is already saved in Roqem or create a new id
    comp = Company.find_or_create_by_company_token(company)
    
    comp.name = company_data["Name"]
    comp.status = company_data["Status"]
    comp.goal = company_data["Goal"]
    comp.raised = company_data["Raised"]
    comp.pitch = company_data["Pitch"]
    comp.category = company_data["Category"]
    comp.city = company_data["City"]
    comp.state = company_data["State"]
    comp.short_url = company_data["Short URL"]
    comp.seeders = company_data["Seeders"]
    comp.save
    
    post = Post.new
    post.post_token = token
    post.company_id = comp.id
    post.author = post_data["Author"]
    post.title = post_data["Title"]
    post.body = post_data["Description"]
    post.save
  end
end
