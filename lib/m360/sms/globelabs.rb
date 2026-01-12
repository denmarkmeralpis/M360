# frozen_string_literal: true

require 'json'
require 'securerandom'

module M360
  module SMS
    class Globelabs
      include HTTParty
      base_uri 'https://api.m360.com.ph/'

      attr_reader :response, :response_body

      def initialize(options = {})
        @passphrase = options.fetch(:passphrase, ENV['M360_GLABS_PASSPHRASE'])
        @sender = options.fetch(:sender, ENV['M360_GLABS_SENDER'])
        @correlator = options[:correlator]
        @address = options.fetch(:address)
        @message = options.fetch(:message)
      end

      def self.call(options = {})
        new(options).call
      end

      def call
        @response = perform_request
        @response_body = JSON.parse(@response.body)
      end

      def success?
        response.code == 201
      end

      private

      def perform_request
        @perform_request ||= self.class.post(
          "/v3/api/globelabs/mt/#{@passphrase}",
          body: outbound_message_payload,
          headers: { 'Content-Type' => 'application/json' },
          verify: false
        )
      end

      def outbound_message_payload
        {
          outboundSMSMessageRequest: {
            clientCorrelator: (@correlator || SecureRandom.uuid),
            senderAddress: @sender,
            address: @address,
            outboundSMSTextMessage: {
              message: @message
            }
          }
        }.to_json
      end
    end
  end
end
