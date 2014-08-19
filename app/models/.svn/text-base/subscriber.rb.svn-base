class Subscriber < ActiveRecord::Base
  validates :first_name, :last_name, :email, :presence => true
  validates :email, :uniqueness => true
  validates :email, :format => { 
      :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/,
      :message => "Please input a valid email address"
    }
end
