class Answer < ActiveRecord::Base

  # associations
  belongs_to :user
  has_one :question
  has_many :option

  # validations
  validates :option_id, :user_id, :question_id, :presence => true

  # callbacks

end
