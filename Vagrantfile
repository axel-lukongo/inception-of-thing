K3S_TOKEN="my_super_secret_token"

Vagrant.configure("2") do |config|
  # Configuration de la première machine (alukongoS)
  config.vm.define "alukongoS" do |server|
    server.vm.box = "ubuntu/bionic64"  # Utilisez une distribution Ubuntu stable
    server.vm.hostname = "alukongoS"
    server.vm.network "private_network", ip: "192.168.56.110"
    server.vm.provider "virtualbox" do |vb|
      vb.name = "alukongoS"
      vb.memory = "1024"  # Limiter la RAM à 512 MB
      vb.cpus = 1        # Limiter à 1 CPU
    end
    server.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y curl
      # Installation de K3s en mode serveur
      curl -sfL https://get.k3s.io | K3S_TOKEN=#{K3S_TOKEN} sh -
    SHELL
  end

  # Configuration de la deuxième machine (alukongoSW)
  config.vm.define "alukongoSW" do |worker|
    worker.vm.box = "ubuntu/bionic64"
    worker.vm.hostname = "alukongoSW"
    worker.vm.network "private_network", ip: "192.168.56.111"
    worker.vm.provider "virtualbox" do |vb|
      vb.name = "alukongoSW"
      vb.memory = "1024"
      vb.cpus = 1
    end
    worker.vm.provision "shell", inline: <<-SHELL
      sudo apt-get update
      sudo apt-get install -y curl
      # Installation de K3s en mode agent et connexion au serveur
      curl -sfL https://get.k3s.io | K3S_URL=https://192.168.56.110:6443 K3S_TOKEN=#{K3S_TOKEN} sh -
    SHELL
  end
end
