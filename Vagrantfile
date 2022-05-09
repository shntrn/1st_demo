# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

    servers=[
        {
        :hostname => "sql-node1",
        :box => "generic/oracle8",
        :ip => "192.168.56.111",
        :ssh_port => '2200',
        :memory => '1024',
        #:add_guest_port => '8080',
        #:add_host_port => '8080'
        #:sync_folder => './web-app-folder'
        },
        {
        :hostname => "sql-node2",
        :box => "generic/oracle8",
        :ip => "192.168.56.112",
        :ssh_port => '2201',
        :memory => '1024',
        #:add_guest_port => '5432',
        #:add_host_port => '65432'
        #:sync_folder => './date-base-folder'
        },
        {
        :hostname => "sql-balancer",
        :box => "generic/oracle8",
        :ip => "192.168.56.113",
        :ssh_port => '2202',
        :memory => '1024',
        #:add_guest_port => '5432',
        #:add_host_port => '65432'
        #:sync_folder => './date-base-folder'
        }
        ]

    servers.each do |machine|
        config.vm.define machine[:hostname] do |node|
                node.vm.box = machine[:box]
                node.vm.hostname = machine[:hostname]
                node.vm.network :private_network, ip: machine[:ip]
                node.vm.network "forwarded_port", guest: 22, host: machine[:ssh_port], id:"ssh"
                #node.vm.network "forwarded_port", guest: machine[:add_guest_port], host: machine[:add_host_port], id:"add"
                #node.vm.synced_folder machine[:sync_folder], "/sync_folder"
                
                node.vm.provider :virtualbox do |vb|
                   vb.customize ["modifyvm", :id, "--memory", machine[:memory]]
                end
        end
    end
    
    
end


