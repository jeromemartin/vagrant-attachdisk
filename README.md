# vagrant-newdisk

A Vagrant plugin to attach a disk in VirtualBox or HyperV


## Installation


```shell
vagrant plugin install vagrant-attachdisk
```

## Usage

Set the path you want for your disk in your Vagrantfile. For example

```ruby
Vagrant.configure('2') do |config|
  config.vm.box = 'ubuntu/xenial64'
  config.attachdisk.path = "/tmp/your-file.vdi"
end
```
## Limitations

At present only one disk can be added to the first controller.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

