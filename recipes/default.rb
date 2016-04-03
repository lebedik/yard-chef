# install required OS packages
%w{git gcc}.each do |pkg|
  package pkg do
    action :install
  end
end

#git "#{node['yard_chef']['source_dir']}/yard" do
#  repository node['yard_chef']['yard']['git_repository']
#  action :sync
#end

# Download source for gem from fork
git "#{node['yard_chef']['source_dir']}/yard-chef" do
  repository node['yard_chef']['yard_chef']['git_repository']
  action :sync
end


#execute 'gem build yard.gemspec' do
#  cwd "#{node['yard_chef']['source_dir']}/yard"
#end

# Buid gem from source
execute 'gem build yard-chef.gemspec' do
  cwd "#{node['yard_chef']['source_dir']}/yard-chef"
end



#gem_package 'yard' do
#  source node['yard_chef']['yard']['source_file']
#  clear_sources true
#  action :upgrade
#end

# Install gem package
gem_package 'yard-chef' do
  source node['yard_chef']['yard_chef']['source_file']
  action :upgrade
end

directory "#{node['yard_chef']['yard_chef']['document_root']}/" do
  mode '0755'
  action :create
end

execute "yardoc #{node['yard_chef']['yard_chef']['chef_repo_location']}**/*.rb --output-dir #{node['yard_chef']['yard_chef']['document_root']} --db #{node['yard_chef']['yard_chef']['document_root']}/.yardoc --plugin yard-chef" do
  cwd "#{node['yard_chef']['yard_chef']['document_root']}/"
end

if node['yard_chef']['yard_chef']['local_server'] == true
  execute "yard server -p #{node['yard_chef']['yard_chef']['local_server_port']} -r -d #{node['yard_chef']['yard_chef']['document_root']} --db #{node['yard_chef']['yard_chef']['document_root']}/.yardoc --plugin yard-chef" do
    cwd "#{node['yard_chef']['yard_chef']['document_root']}/"
  end
end
