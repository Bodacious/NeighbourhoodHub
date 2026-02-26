require "test_helper"
require "generators/domain_model/domain_model_generator"

class DomainModelGeneratorTest < Rails::Generators::TestCase
  tests DomainModelGenerator
  destination Rails.root.join("tmp/generators")
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
