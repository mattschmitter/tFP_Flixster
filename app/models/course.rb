class Course < ActiveRecord::Base
	belongs_to :user
	has_many :sections
	has_many :enrollments

	mount_uploader :image, ImageUploader

	validates :title, :presence => {:message => "Title is required"}
	validates :description, :presence => {:message => "Description is required"}
	validates :cost, :presence => {:message => "Cost is required"}, :numericality => {:greater_than_or_equal_to => 0}

	def free?
		cost.zero?
	end

	def premium?
		! free?
	end

end
