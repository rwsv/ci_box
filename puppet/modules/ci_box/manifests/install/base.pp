class ci_box::install::base ($setup_path = $ci_box::setup_path, $home = $ci_box::home) inherits ci_box {
  file { '/etc/apt/sources.list':
    owner  => 'root',
    group  => 'root',
    source => "${setup_path}/files/sources.list"
  }

  exec { 'apt-update':
    command => 'apt-get -q -y update',
  }

  exec { 'apt-upgrade':
    command => 'apt-get -q -y upgrade',
  }

  $required_packages = [
    'build-essential',
    'sudo',
    'sysv-rc-conf',
    'tzdata',

    'python-dev',
    'python-pip',
    'python-imaging',
    'python-setuptools',
    'python2.7',
    'python2.7-dev',

    'maven',
    'openjdk-7-jdk',

    'flex',
    'libmysqlclient-dev',
    'libcurl4-gnutls-dev',
    'libxml2-dev',
    'libxslt-dev',
    'libjpeg-dev',
    'libgeos-dev',
    'liblcms2-dev',
    'libwebp-dev',
    'libgcrypt11-dev',
    'libldap2-dev',
    'libidn11-dev',
    'librtmp-dev',
    'libssh2-1-dev',
    'comerr-dev',
    'libkrb5-dev',

    'git',
    'curl',
    'most',
    'htop',
    'vim',
    'ack-grep',

    'supervisor',
    'redis-server',
    'rabbitmq-server',
    'amqp-tools',
    'jetty8',
  ]

  package { $required_packages:
    ensure => 'installed',
  }

  file { '/etc/localtime':
    ensure  => 'link',
    target  => '/usr/share/zoneinfo/America/Sao_Paulo',
    require => Package['tzdata'],
  }

  exec { 'python-imaging-build-deps':
    command => 'apt-get build-dep python-imaging -q -y',
  }

  package { 'virtualenvwrapper':
    ensure   => 'latest',
    provider => pip,
  }

  class { 'mysql::client': }

  class { '::mysql::server':
    root_password    => 'g1',
    override_options => {
      'mysqld' => {
        'bind-address' => '0.0.0.0'
      }
    },
  }

  mysql_grant { 'root@%/*.*':
    ensure     => 'present',
    options    => ['GRANT'],
    privileges => ['ALL'],
    table      => '*.*',
    user       => 'root@%',
  }

  # RVM
  exec { 'rvm-install':
    user    => 'vagrant',
    command => "${setup_path}/rvm.sh",
    creates => "${home}/.rvm"
  } 
}


