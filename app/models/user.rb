class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  validate :password_complexity
  
  def password_complexity
  
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*(_|[^\w])).{8,128}$/

    errors.add :password, ' must include at least: 1 upper case letter, 1 lower case letter, 1 digit and 1 symbol'
  
 end

end
