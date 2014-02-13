module Shanty
  class Provider < Thor
    include Thor::Actions

    no_commands do
      def self.source_root
        File.dirname(__FILE__)
      end

      def self.supported_providers
        @@supported_providers ||= []
      end

      def self.inherited(subclass)
        self.supported_providers << subclass.to_s.split('::').last.downcase
      end

      def generate_provider_vagrantfile
        raise ::Shanty::PureVirtualMethod, "'generate_provider_vagrantfile' must be implemented on Shanty::Provider classes"
      end

      def requires_plugin?
        raise ::Shanty::PureVirtualMethod, "'requires_plugin?' must be implemented on Shanty::Provider classes"
      end

      def plugin
        raise ::Shanty::PureVirtualMethod, "'plugin' must be implemented on Shanty::Provider classes"
      end

      def dummy_box_url
        raise ::Shanty::PureVirtualMethod, "'plugin' must be implemented on Shanty::Provider classes"
      end
    end
  end
end
