class PostsController < ApplicationController
  def index
  end
  
  def create
  end
  
  #Function that grabs the company id and title token from CedarStack and
  #creates a new company (if one doesn't already exist with the id)
  def api
    if params[:company_id]
      if !Company.find_by_company_id(params[:company_id])
        @company = Company.new_company(params[:company_id])
      end
    elsif params[:post_token]
      if !Post.find_by_post_token(params[:post_token])
        @post = Post.new_post(params[:post_token])
      end
    end
  end
end
