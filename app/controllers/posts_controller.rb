class PostsController < ApplicationController
  def index
  end
  
  def create
  end
  
  #Function that grabs the company id and title token from CedarStack and
  #creates a new company (if one doesn't already exist with the id)
  def api
    if params[:company_id, :post_token]
      Post.new_post(params[:company_id, :post_token])
    end
  end
end
