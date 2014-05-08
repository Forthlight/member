module Member
  class Member::ApplicationController < ::ApplicationController
    before_filter :authenticate_user!
    
    # Include helpers from common domain engine
    helper CommonDomain::Engine.helpers
  end
end
