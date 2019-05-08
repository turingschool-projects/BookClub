class Review < ApplicationRecord
  belongs_to :book
          
  validates_presence_of :username,
                        :title,
                        :rating,
                        :text
end
