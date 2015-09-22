class Cat < ActiveRecord::Base
  validates_presence_of :name

  def name_and_desc
    "#{self.name}, #{self.description}"
  end

end
