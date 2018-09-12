#
# Cookbook:: bioelite_cronlock
# Recipe:: default
#
# Copyright:: 2018, Nghiem Ba Hieu
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

cookbook_file '/usr/bin/cronlock' do
  source 'cronlock'
  owner 'root'
  group 'root'
  mode 0o755
end

template '/etc/cronlock.conf' do
  source node['bioelite_cronlock']['template_cronlock_conf']
  owner 'root'
  group 'root'
  mode 0o644
  cookbook node['bioelite_cronlock']['template_cookbook']
  variables(
    host: node['bioelite_cronlock']['host'],
    release: node['bioelite_cronlock']['release']
  )
end
