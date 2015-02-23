# Classe base do CiBox. Define defaults para o provisionamento.
# TODO mover vars para hiera
class ci_box {
  # Variables
  $home = '/home/vagrant'
  $path = [
    '/usr/local/bin',
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin',
    '/usr/local/games',
    '/usr/games'
  ]
  $virtualenv_path = "${home}/.virtualenvs"
  $setup_path = '/vagrant/scripts/setup'

  # Defaults for exec
  Exec {
    path      => $path,
    logoutput => true,
    timeout   => 0
  }

  # Defaults for vcsrepo
  Vcsrepo {
    owner    => 'vagrant',
    group    => 'vagrant',
    provider => git,
    ensure   => present,
    revision => 'master'
  }
}

