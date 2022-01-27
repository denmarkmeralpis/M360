require_relative '../../spec_helper'
require 'webmock/rspec'

module M360
  module SMS
    RSpec.describe Globelabs do
      let(:client) { described_class.new(options) }
      let(:host) { 'https://api.m360.com.ph/v3/api/globelabs/mt/passphrase' }
      let(:options) do
        {
          passphrase: 'passphrase',
          correlator: '123',
          sender: 'Masking',
          address: '9123456789',
          message: 'Hello, World!'
        }
      end

      describe '#call' do
        context 'when response code is 201' do
          before do
            stub_request(:post, host).to_return(
              body: { outboundSMSMessageRequest: {} }.to_json,
              status: 201,
              headers: { 'Content-Type' => 'application/json' }
            )
          end

          it 'returns truthy value' do
            expect(client.call).to be_truthy
          end
        end

        context 'when response code is 400' do
          before do
            stub_request(:post, host).to_return(
              body: {
                code: 400,
                name: 'Bad Request',
                message: [
                  'The msisdn must be a number'
                ]
              }.to_json,
              status: 400,
              headers: { 'Content-Type' => 'application/json' }
            )
          end

          it 'returns response body with code 400' do
            expect(client.call['code']).to eq(400)
          end
        end
      end

      describe '#success?' do
        context 'when true' do
          before do
            stub_request(:post, host).to_return(
              body: { outboundSMSMessageRequest: {} }.to_json,
              status: 201,
              headers: { 'Content-Type' => 'application/json' }
            )

            client.call
          end

          it { expect(client.success?).to be_truthy }
        end

        context 'when false' do
          before do
            stub_request(:post, host).to_return(
              body: { code: 400 }.to_json,
              status: 400,
              headers: { 'Content-Type' => 'application/json' }
            )

            client.call
          end

          it { expect(client.success?).to be_falsey }
        end
      end
    end
  end
end
