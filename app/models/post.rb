class Post < ActiveRecord::Base
  belongs_to :company
  
  def self.new_post(company, token)
    comp = Company.find_or_create_by_company_token(company)
    
    post = Post.new
    post.post_token = token
    post.company_id = comp.id
    post.title = "YoMama"
    post.body = "Bo body, bo body. B. Business. Biz. Niz."
    post.save
  end
end
