require 'rails_helper'

RSpec.describe UpdateSkuJob, type: :job do

  let(:books_name) {'eloquent ruby'}
  before do
    allow(Net::HTTP).to receive(:start).and_return(true)
  end
  
  # it "calls sku serrvice with  correct parrams" do

  #   # this test is failing becaue we are not calling any sku application ..its dummy url so nothing is returning .....written only to remember syntax if needed later.
  #   expect_any_instance_of(Net::HTTP::Post).to receive(:body).with({sku: '123',name: books_name}.to_json)

  #   described_class.perform_now(books_name)
  # end
  
end
