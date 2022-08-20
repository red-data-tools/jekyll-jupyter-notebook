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

module JekyllJupyterNotebook
  module IFramable
    def output_ext
      extname + super
    end
  end

  class Generator < Jekyll::Generator
    def generate(site)
      generate_site_static_files(site)
      site.collections.each_value do |collection|
        generate_collection_filtered_entries(collection)
      end
    end

    private
    def generate_site_static_files(site)
      site.static_files.reject! do |static_file|
        next false unless static_file.extname == ".ipynb"

        base = static_file.instance_variable_get(:@base)
        dir = static_file.instance_variable_get(:@dir)
        name = static_file.name
        page = Jekyll::Page.new(site, base, dir, name)
        page.extend(IFramable)
        site.pages << page
        true
      end
    end

    def generate_collection_filtered_entries(collection)
      collection.filtered_entries.reject! do |file_path|
        full_path = collection.collection_dir(file_path)
        next false unless File.extname(file_path) == ".ipynb"
        next false if Jekyll::Utils.has_yaml_header?(full_path)

        document = Jekyll::Document.new(full_path,
                                        site: collection.site,
                                        collection: collection)
        document.extend(IFramable)
        document.read
        collection.docs << document
        true
      end
    end
  end
end
