# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AdyenOfficial::AdyenOfficialError do
  describe '#to_s' do
    it 'describes using the error properties' do
      expect(AdyenOfficial::AdyenOfficialError.new('request', 'response', 'message', 'code').to_s).to eq('AdyenOfficial::AdyenOfficialError code:code, request:request, response:response, msg:message')
    end
    it 'skips the null properties' do
      expect(AdyenOfficial::AdyenOfficialError.new('request', nil, nil, 'code').to_s).to eq('AdyenOfficial::AdyenOfficialError code:code, request:request')
    end
    it 'uses the proper error class name' do
      expect(AdyenOfficial::PermissionError.new('a message', 'a request').to_s).to eq('AdyenOfficial::PermissionError code:403, request:a request, msg:a message')
    end
  end
end
