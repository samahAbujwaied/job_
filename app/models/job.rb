class Job < ApplicationRecord
    enum status: %i[draft published completed]
    has_many :resumes
    belongs_to :user
end
  