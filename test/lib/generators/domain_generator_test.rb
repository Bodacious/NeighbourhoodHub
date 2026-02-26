require "test_helper"
require "generators/domain/domain_generator"

class DomainGeneratorTest < Rails::Generators::TestCase
  tests DomainGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
