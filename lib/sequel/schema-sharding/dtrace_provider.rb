require 'usdt'

module Sequel
  module SchemaSharding
    class DTraceProvider
      attr_reader :provider

      def initialize
        @provider = USDT::Provider.create(:ruby, :sequel_schema_sharding)
      end

      def read_only_shard_for
        @read_only_probe ||= provider.probe(:model, :read_only_shard_for, :string)
      end

      def self.provider
        @provider ||= new.tap do |p|
          p.read_only_shard_for
          p.provider.enable
        end
      end
    end
  end
end

