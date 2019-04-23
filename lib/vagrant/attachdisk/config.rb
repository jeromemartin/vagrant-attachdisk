module Vagrant
  module AttachDisk
    class Config < Vagrant.plugin('2', :config)
      attr_accessor :path

      def initialize
        @path = UNSET_VALUE
      end

      def is_set?
        @path != UNSET_VALUE
      end
    end
  end
end

