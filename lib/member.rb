# require devise before the engine, in order to override the default devise views
require 'devise'
require 'simple_roles'
require "member/engine"

module Member
end
