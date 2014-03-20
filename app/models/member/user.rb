module Member
  class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable

    #add roles to users with the simple roles gem, configured in config/initializers/simple_roles.rb
    simple_roles
  end
end
