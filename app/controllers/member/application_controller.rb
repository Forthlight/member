module Member
  class Member::ApplicationController < ::ApplicationController
    before_filter :authenticate_user!
    
  end
end
