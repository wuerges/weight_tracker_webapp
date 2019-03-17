class Record < ApplicationRecord
  validates_presence_of :weight
  validates_format_of :weight, :with => /\A\d{0,3}(\.\d)?\z/
end
