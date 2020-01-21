server '52.193.252.2', user: 'app', roles: %w{app db web}
set :ssh_options, keys: '/Users/yuji/.ssh/id_rsa'
