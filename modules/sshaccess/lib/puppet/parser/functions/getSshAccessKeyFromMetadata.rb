require 'rubygems'
require 'rest-client'
require 'json'

module Puppet::Parser::Functions
    newfunction(:getSshAccessKeyFromMetadata, :type => :rvalue, :docs => "\

	gets the ssh access keys from the Openstac API
	
    ") do |args|

	url = 'http://169.254.169.254/latest/meta-data/public-keys/0/openssh-key'
	accesskey = RestClient.get(url).body

    end
end
