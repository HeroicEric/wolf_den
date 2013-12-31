class Post < ActiveRecord::Base
  belongs_to :user,
    inverse_of: :posts

  has_many :comments,
    inverse_of: :post,
    dependent: :destroy

  validates_presence_of :title
  validates_presence_of :content

  validate :john_approves_of_title

  def john_approves_of_title
    if title.present? && title.length < 4
      errors.add(:title, "is not approved by John")
    end
  end
end
