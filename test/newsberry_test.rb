require File.join(File.dirname(__FILE__), 'test_helper')
require 'yaml'

class NewsberryTest < Test::Unit::TestCase

  context "Newsberry" do
    setup do
      c = YAML::load_file("test/credentials.yml")
      @api_key = c[:api_key]
      Newsberry.configure do |config|
        config.api_key = c[:api_key]
        config.host = c[:host]
        config.auth = {:username => c[:username], :password => c[:password]}
      end
    end

    should "allow to be configured" do
      assert_equal @api_key, Newsberry.api_key
    end

    context "List" do
      setup do
        @list = Newsberry::List.new('my-list')
        @list.custom_fields = [ [:name, 'First Name'], [:nick, 'Nick'] ]
        @list.data = [stub(:email => 'petyo@wildbit.com', :name => 'Petyo Ivanov', :nick => 'underlog')]
      end

      should "build the post data correctly" do
        assert_equal "petyo@wildbit.com,Petyo Ivanov,underlog\n", @list.build_data
        assert_equal "Email,First Name,Nick\n", @list.columns
      end

      should "post to newsberry" do
        Net::HTTP.any_instance.expects(:request).returns(Net::HTTPOK.new(nil, '200', 'OK'))
        @list.sync!
      end

    end

  end
  
end
