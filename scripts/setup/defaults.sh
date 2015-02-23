#!/bin/bash

export HOME=/home/vagrant
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH

if [ -e "/usr/local/bin/virtualenvwrapper_lazy.sh" ]; then
    source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

if [ -e "/home/vagrant/.rvm/scripts/rvm" ]; then
    source /home/vagrant/.rvm/scripts/rvm
fi
