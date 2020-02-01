class Accommodation < ApplicationRecord
  belongs_to :type
  belongs_to :rating
end
