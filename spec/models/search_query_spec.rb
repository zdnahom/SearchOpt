require 'rails_helper'

RSpec.describe SearchQuery, type: :model do
  before(:each) do
    @query = SearchQuery.new(query: 'how', ip: '192.168.1.18')
  end
  
  describe 'Validations' do
    it 'query should be present' do
      @query.query = ''
      expect(@query).to_not be_valid
    end
    it 'ip should be present' do
      @query.ip = ''
      expect(@query).to_not be_valid
    end
  end
end
