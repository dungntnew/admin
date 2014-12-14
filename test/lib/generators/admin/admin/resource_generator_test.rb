require 'test_helper'
require 'generators/admin/resource/resource_generator'

module Admin
  class Admin::ResourceGeneratorTest < Rails::Generators::TestCase
    tests Admin::ResourceGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
