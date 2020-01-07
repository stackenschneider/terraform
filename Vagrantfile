Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.box_version = "20191218.0.0"

#  config.ssh.private_key_path = [
#    '~/.vagrant.d/insecure_private_key',
#    '~/.ssh/id_rsa'
#  ]
  config.ssh.forward_agent = true

  config.vm.provision "shell", inline: <<-SHELL
    set -euxo pipefail
    
    apt-get update
    apt-get install --yes unzip

    URL="https://releases.hashicorp.com/terraform/0.12.18/terraform_0.12.18_linux_amd64.zip"
    FILENAME=$(basename ${URL})
    curl --silent --show-error -O ${URL}
    unzip -o ${FILENAME} -d /usr/local/bin
    rm -v ${FILENAME}
    terraform version

    cp -v /vagrant/.terraformrc ~vagrant/.terraformrc
  SHELL

end
