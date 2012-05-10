#
# Cookbook Name:: collectd
# Recipe:: _server_plugins
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

%w(collectd thresholds).each do |file|
  template "#{node['collectd']['sysconf_dir']}/#{file}.conf" do
    source "#{file}.conf.erb"
    owner "root"
    group "root"
    mode 0644
    notifies :restart, resources(:service => "collectd")
  end
end