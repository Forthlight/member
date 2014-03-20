SimpleRoles.configure do |config|
  config.valid_roles = [:regular, :business, :research] #these are the available roles
  config.strategy = :one # Default is :one (this means one role per user)
end