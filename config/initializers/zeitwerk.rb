# Adds support for a new domains directory within our app. This is where we will start
# to move code to, as we begin to restructure and modularise our codebase more explicitly.
#
# @example
#   The following directory structure...
#
#     app/domains
#     └── subscriptions
#         └── controllers
#         └── models
#             └── foo
#                 └── bar.rb
#         └── views
#
#   Will mean the following class name is expected (and autoloaded)
#
#     Subscriptions::Foo::Bar
#
# @see app/domains/README.md

# We should only need to change the first autoloader (Rails's primary autoloader)
Rails.autoloaders.first.tap do |autoloader|
  # These are the directories we expect to find in a domain directory
  directory_names = [ "controllers", "helpers", "models", "views", "mailers", "services", "ambassadors", "workers", "serializers" ]
  # These are the directories we expect to have a concerns directory
  concernable_directory_names = [ "controllers", "models" ]

  ##
  # Collapsing a directory tells Zeitwerk not to create a module with that dir name. Allows
  # us to create more directories for organisation.
  #
  # Don't attempt to create a named module for "domains"
  autoloader.collapse(Rails.root.join("app/domains"))

  # Don't attempt to create a named module for "domains/subscriptions/controllers"
  autoloader.collapse(Rails.root.join("app/domains/*/{#{directory_names.join(",")}}"))

  # Don't attempt to create a named module for "domains/subscriptions/controllers/concerns"
  autoloader.collapse(Rails.root.join("app/domains/*/{#{concernable_directory_names.join(",")}}/concerns"))
end
