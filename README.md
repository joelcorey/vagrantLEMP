# README #

### What is this repository for? ###

A Vagrant box, Ubuntu 16.04 with a LEMP stack. Creates a local web server.

### How do I get set up? ###
* Assumes you are working in Linux/Unix, you will need this directory structure: /home/<username>/project/www
* Install Virtualbox and Vagrant
* From within the www folder, enter: "vagrant up"
* Edit /etc/hosts file by inserting the following: "192.168.10.10 project.local"
* Enter "project.local" in your web browser