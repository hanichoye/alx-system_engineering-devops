# Increase open file limit

exec {'replace':
  provider => shell,
  command  => 'sudo sed -i "s/ULIMIT=\"-n 15\"/ULIMIT=\"-n 4096\"/" /etc/default/nginx',
  before   => Exec['restart'],
}
# Restart Nginx
exec {'restart':
  provider => shell,
  command  => 'sudo service nginx restart',
}
