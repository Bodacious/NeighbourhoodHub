# lib/generators/domain/domain_generator.rb
# Usage:
#   bin/rails g domain identity
#
# Generates (if missing):
#   app/domains/identity/domain.rb  (module Identity; end)
#   app/domains/identity/models/.keep

require "rails/generators"
require "rails/generators/base"

class DomainGenerator < Rails::Generators::Base
  argument :domain, type: :string, required: true, banner: "domain_name"

  def create_domain_scaffold
    domain_dir = domain.to_s.underscore
    domain_mod = domain.to_s.camelize

    empty_directory File.join("app/domains", domain_dir)
    empty_directory File.join("app/domains", domain_dir, "models")

    domain_rb = File.join("app/domains", "#{domain_dir}.rb")
    return if File.exist?(domain_rb)

    create_file domain_rb, <<~RUBY
      # frozen_string_literal: true

      module #{domain_mod}
        module_function

        # Add your interface methods here...
      end
    RUBY
  end
end
