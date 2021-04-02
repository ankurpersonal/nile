require 'rails_helper'

RSpec.describe UpdateSkuJob, type: :job do
  it "calls sku serrvice with  correct parrams" do
    describe_class.perform_now('eloquent ruby')
  end
  
end
