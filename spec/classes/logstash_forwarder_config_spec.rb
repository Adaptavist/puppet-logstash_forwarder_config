require 'spec_helper'
 
describe 'logstash_forwarder_config', :type => 'class' do
    
  context "Should not install logstash_forwarder in case present is false" do
    let(:params) { {
      :present => false,
      :ssl_key => '/tmp/ssl_key',
      :ssl_ca_path => '/tmp/ssl_ca_path',
      :ssl_certificate => '/tmp/ssl_certificate',
      :use_ssl => true,
    }}
    it do
      should_not contain_class('logstashforwarder')
    end
  end
  context "Should install logstash_forwarder in case present is false, by default enables manage_repo" do
    let(:params) { {
    :ssl_key => '/tmp/ssl_key',
    :ssl_ca_path => '/tmp/ssl_ca_path',
    :ssl_certificate => '/tmp/ssl_certificate',
    :use_ssl => true
    }}
    let(:facts){{
      :kernel => "Linux",
      :osfamily=>"RedHat", 
      :operatingsystem=>"RedHat", 
      :concat_basedir=>"/tmp",
      }}
    it do
      should contain_class('logstashforwarder').with({
        :ssl_key => '/tmp/ssl_key',
        :ssl_ca => '/tmp/ssl_ca_path',
        :ssl_cert => '/tmp/ssl_certificate',  
        })
      should contain_yumrepo('logstashforwarder')
    end
  end
end
