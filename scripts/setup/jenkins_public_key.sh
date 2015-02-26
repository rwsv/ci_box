#!/bin/bash

source /vagrant/scripts/setup/defaults.sh

wget -qO - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -

touch $HOME/.jenkins_public_key_done