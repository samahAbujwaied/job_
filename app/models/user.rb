class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :jobs
  has_many :resumes

  def applied_job?(job_id)
    resumes.find_by job_id: job_id
  end

end
