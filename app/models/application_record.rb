class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class String
    def initial
      self[0,1]
    end
  end

  def self.search(search)
    if search
      where(["unitname LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  def self.search(ssm_search)
    if ssm_search
      where(["unitname LIKE ?", "%#{ssm_search}%"])
    else
      all
    end
  end

end
