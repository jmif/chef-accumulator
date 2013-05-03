#
# Author:: Mathieu Sauve-Frankel <msf@kisoku.net>
# Copyright:: Copyright (c) 2012 Mathieu Sauve-Frankel
# License:: Apache License, Version 2.0
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
#


require 'chef/resource'

class Chef
  class Resource
    class Accumulator < Chef::Resource
      
      def initialize(name, run_context=nil)
        super

        @resource_name = :accumulator
        @provider = Chef::Provider::Accumulator
        @action = :create
        @allowed_actions = [:create]

        def filter(arg=nil)
          set_or_return(:filter, arg, :kind_of => Proc, :required => True)
        end

        def transform(arg=nil)
          set_or_return(:transform, arg, :kind_of => Proc, :required => True)
        end

        def target(arg=nil)
          set_or_return(:target, arg, :kind_of => [String, Hash])
        end

        def variable_name(arg=nil)
          set_or_return(:variable_name, arg, :kind_of => Symbol)
        end
      end
    end
  end
end