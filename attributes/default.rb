# Defaults attributes for YARD-CHEF

# Location for YARD sources
default['yard_chef']['source_dir'] = '/usr/local/src'

# Git repository for YARD
default['yard_chef']['yard']['git_repository'] = 'https://github.com/lsegal/yard.git'
# Git repo YARD version to download
default['yard_chef']['yard']['git_revision'] = 'v0.8.7.6'
# YARD source file location
default['yard_chef']['yard']['source_file'] = node['yard_chef']['source_dir'] + "/yard/yard-0.8.7.6.gem"

# Git repository for YARD-CHEF
default['yard_chef']['yard_chef']['git_repository'] = "https://github.com/aleksey-hariton/yard-chef.git"
# Git repo YARD-CHEF version to download
default['yard_chef']['yard_chef']['git_revision'] = "v1.0.0"
# YARD-CHEF source file location
default['yard_chef']['yard_chef']['source_file'] = node['yard_chef']['source_dir'] + "/yard-chef/yard-chef-1.0.0.gem"

# Location to Chef repository for creating documentation
default['yard_chef']['yard_chef']['chef_repo_location'] = "/tmp/vagrant-chef/"
# The output directory for documentation
default['yard_chef']['yard_chef']['document_root'] = "/usr/local/etc/yard" 

# Local server attributes

# Run local server
default['yard_chef']['yard_chef']['local_server'] = true
# YARD local server port number
default['yard_chef']['yard_chef']['local_server_port'] = "8808"
