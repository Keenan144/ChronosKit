class Barcode < ActiveRecord::Base
  validates :soss_number, presence: true, uniqueness: true
end
