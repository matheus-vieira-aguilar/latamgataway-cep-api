module Api::V1
    class ApiController < ApplicationController    
        # verifica se o token e usuário existem:
        acts_as_token_authentication_handler_for User

        # sempre verifica autenticação de todos em todos os controller que utilizam o ApiController        
        before_action :require_authentication!

        private
            # solta Exception caso não possua o current_user
            def require_authentication!
                throw(:warden, scope: :user) unless current_user.presence                    
            end
    end
end
