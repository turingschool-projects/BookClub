class AuthorBook < ApplicationRecord
  belongs_to :author
  belongs_to :book, dependent: :destroy

  validates_presence_of :author
  validates_presence_of :book
end
