require 'test_helper'
require 'generators/admin/install/install_generator'

module Admin
  class Admin::InstallGeneratorTest < Rails::Generators::TestCase
    tests Admin::InstallGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    # test "generator runs without errors" do
    #   assert_nothing_raised do
    #     run_generator ["arguments"]
    #   end
    # end
  end
end
