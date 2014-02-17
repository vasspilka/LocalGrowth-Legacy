class Option < ActiveRecord::Base

  #relations
  belongs_to :question
  has_many :answers

  # validations
  validates :text, :presence => true, :allow_blank => false

  def to_s
    return self.text
  end


end
