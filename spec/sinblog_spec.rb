require 'spec_helper'

describe 'Sinblog' do

  it 'should get /' do
    get '/'
    last_response.should be_ok
  end
  
end