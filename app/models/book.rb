class Book < ApplicationRecord
	validates :title, presence: true, length: {maximum: 50} #uniqueness: { case_sensitive: false }, length: {maximum: 50}, #format: { with: ConstantData::VALID_EMAIL_REGEX }, if: :method_name?
	
	belongs_to :author #, class_name: "author #", foreign_key: "author #_id"
	
end
