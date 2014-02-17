class Survey < ActiveRecord::Base

  # relations
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions,
    :reject_if => ->(q) { q[:text].blank? },
    :allow_destroy => true

  # scopes
  scope :active,   -> { where(:active => true) }
  scope :inactive, -> { where(:active => false) }

  # validations
  validates :description, :name, :presence => true, :allow_blank => false
  validate  :check_active_requirements

  private

  # a surveys only can be activated if has one or more questions
  def check_active_requirements
    errors.add(:active, "Survey without questions cannot be activated") if self.active && self.questions.empty?
  end
end
