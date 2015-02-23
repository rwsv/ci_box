#!/bin/bash

source /vagrant/scripts/setup/defaults.sh

# importa chave gpg (obrigatório) para instalação
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -

# instala versão stable do rvm
\curl -sSL https://get.rvm.io | bash -s stable
source /home/vagrant/.rvm/scripts/rvm

# instala versões utilizadas pelos projetos
rvm install ruby-2.0.0-p195
rvm install ruby-2.1.5
