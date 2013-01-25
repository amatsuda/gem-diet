require 'gem/diet/version'

module Gem
  module Diet
    def self.execute!
      Gem.loaded_specs.each do |name, s|
        s.author = s.date = s.description = s.email = s.homepage = s.rubyforge_project = s.summary = s.files = s.extra_rdoc_files = s.licenses = s.rdoc_options = nil
      end
    end
  end
end

puts [*caller]

if defined? Bundler
  class Bundler::Runtime
    def require_with_diet(*groups)
      require(*groups)
      Get::Diet.execute!
    end
    alias_method :require_without_diet, :require
    alias_method :require, :require_with_diet
  end
end
