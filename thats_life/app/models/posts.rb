class Post < ActiveRecord::Base
    belongs_to :user
    validates :post, presence: true
end