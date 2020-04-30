module ApiV0
  module Helpers

    def authenticate!
      current_account or raise AuthorizationError
    end

    def current_user
      @current_account ||= env["api_v0.account"]
    end
  end
end