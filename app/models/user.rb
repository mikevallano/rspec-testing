class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  has_and_belongs_to_many :roles


  #methods for pundit calls
  def admin?
    self.roles.map(&:name).include?("admin")
  end

  def account_owner?
    self.roles.map(&:name).include?("account owner")
  end

  def manager?
    self.roles.map(&:name).include?("manager")
  end

  def counselor?
    self.roles.map(&:name).include?("counselor")
  end
end
