# lib/generators/domain_model/domain_model_generator.rb
# Usage:
#   bin/rails g domain_model User --domain identity
#
# Generates:
#   app/domains/identity/domain.rb          (if missing)
#   app/domains/identity/models/user.rb     (module Identity; class User < ApplicationRecord; end; end)

require "rails/generators"
require "rails/generators/active_record/model/model_generator"

class DomainModelGenerator < ActiveRecord::Generators::ModelGenerator
  source_root ActiveRecord::Generators::ModelGenerator.source_root

  class_option :domain,
               type: :string,
               desc: "Domain namespace (e.g. identity) to place the model under app/domains/<domain>/models"

  def ensure_domain_exists
    return unless options[:domain].present?

    Rails::Generators.invoke(
      "domain",
      [ options[:domain] ],
      behavior: behavior,
      destination_root: destination_root
    )
  end

  def create_model_file
    return super unless options[:domain].present?

    domain_dir = options[:domain].to_s.underscore
    file_path  = File.join("app/domains", domain_dir, "models", "#{file_name}.rb")

    template "model.rb.erb", file_path
  end

  def create_migration_file
    super
  end

  private

  # Drives module wrapping in the stock ActiveRecord model template via `module_namespacing`.
  def class_path
    return super unless options[:domain].present?
    [ options[:domain].to_s.underscore ] + super
  end
end
