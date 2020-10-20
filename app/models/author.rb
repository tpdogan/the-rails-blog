class Author < ApplicationRecord
  authenticates_with_sorcery!
  validates_confirmation_of :password, message: "Two passwords must match", if: :password 
end
