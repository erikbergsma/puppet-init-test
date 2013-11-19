require 'rubygems'
require 'rest-client'
require 'json'

module Puppet::Parser::Functions
    newfunction(:getHostnameFromMetadata, :type => :rvalue, :docs => "\

	gets the hostname from the Openstack API
	
    ") do |args|
	
	url = 'http://169.254.169.254/openstack/latest/meta_data.json'
	response = RestClient.get(url)

	hostname_raw = JSON.parse(response.body)['hostname']
	hostname_raw.split(".")[0];
    end
end
