class Comment < ActiveRecord::Base
  belongs_to :post,
    inverse_of: :comments

  validates_presence_of :body
  validates_presence_of :post

  validates_email_format_of :email

end
