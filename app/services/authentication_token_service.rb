class AuthenticationTokenService
    HMAC_SECRET = 'my$ecretK3y'
    ALGORITHM_TYPE = 'HS256'
    def self.call(user_id)
        payload = {user_id: user_id}

        token = JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE

    end     

    def self.decode(token)
        
        binding.pry
        
       decoded_token = JWT.decode token, HMAC_SECRET, true, {algorithm: ALGORITHM_TYPE}
       decoded_token[0]['user_id']
    end
end