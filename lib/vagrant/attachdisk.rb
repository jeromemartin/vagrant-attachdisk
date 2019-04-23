begin
  require 'vagrant'
rescue LoadError
  raise 'The vagrant-attachdisk plugin must be run within vagrant.'
end


module Vagrant
  module AttachDisk
    class Plugin < Vagrant.plugin('2')

      name 'vagrant-attachdisk'

      description <<-DESC
      Provides the ability to attach a VirtualBox/Hyper-V disk at creation time.
      DESC

      config 'attachdisk' do
        require_relative 'attachdisk/config'
        Config
      end

      action_hook(:attachdisk, :machine_action_up) do |hook|
        require_relative 'attachdisk/actions'
        hook.before(VagrantPlugins::ProviderVirtualBox::Action::Boot, Action::AttachDiskVirtualBox)
        hook.before(VagrantPlugins::HyperV::Action::Configure, Action::AttachDiskHyperV)
      end
    end
  end
end
