class Entry < ActiveRecord::Base
	validates :food, presence: true
end
