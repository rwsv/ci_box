#!/bin/sh

mkdir -p /etc/puppet/modules
MODULE_LIST=`puppet module list`

(echo $MODULE_LIST | grep puppetlabs-vcsrepo) ||
    puppet module install puppetlabs/vcsrepo

(echo $MODULE_LIST | grep puppetlabs-mongodb) ||
    puppet module install puppetlabs-mongodb

(echo $MODULE_LIST | grep puppetlabs-mysql) ||
    puppet module install puppetlabs-mysql
