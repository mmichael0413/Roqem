class AddPostTokenToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :post_token, :string

  end
end
