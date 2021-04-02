require 'rails_helper'

describe "Authentication", type: :request do
    describe "POST authenticate" do
        it "authenticate the client" do
            post '/api/v1/authenticate', params: { username: "BookeSeller99", password: 'password'}
            expect(response).to have_http_status(:created)
            expect(response_body).to eq({
                'token' => '123'
            })   
        end
 
        it "return error when username is missing" do
            post '/api/v1/authenticate', params: { password: 'password'}
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response_body).to eq({
                'error' => 'param is missing or the value is empty: username'
            })  
        end

        it "returns error when password is missing" do
            post '/api/v1/authenticate', params: { username: "BookeSeller99" }
            expect(response).to have_http_status(:unprocessable_entity)
            expect(response_body).to eq({
                'error' => 'param is missing or the value is empty: password'
            })  
        end
        
        
        
    end
    
end
