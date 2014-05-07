module Member
  class User < ActiveRecord::Base
    # Virtual attribute for email or username while signing in
    attr_accessor :login

    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

    # Add roles to users with the simple roles gem, configured in config/initializers/simple_roles.rb
    simple_roles

    # Non-devise, non-persisted, terms must be accepted
    validates_acceptance_of :terms, on: :create

    # Non-devise field validations
    validates :first_name, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\Z/ }
    validates :last_name, presence: true, length: { maximum: 20 }, format: { with: /\A[a-zA-Z]+\Z/ }
    validates :username, presence: true, length: { maximum: 20 }, uniqueness: {case_sensitive: false}, format: { with: /\A[a-zA-Z0-9]+\Z/ }
    validates :role, presence: true, inclusion: { :in => SimpleRoles.config.valid_roles }
    validates :description, length: { maximum: 512 }, allow_blank: true, on: :update

    # Override devise method to allow username and email sign in
    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
  end
end
