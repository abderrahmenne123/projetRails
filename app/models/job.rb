class Job < ActiveRecord::Base
  validates :name, presence: true , uniqueness: true


  def self.recherche_job(recherche_job)
    if recherche_job
      where(["name LIKE ?","%#{recherche_job}%"])
    else
      all
    end

  end
  paginates_per 5
end
