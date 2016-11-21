require 'spec_helper'

describe 'tripwire' do
  describe 'tripwire', :type => :class do
  let(:params) do
    {
      master_host: '10.250.144.45',
      master_port: 9898,
      master_passcode: 'fs pass',
      client_installdir: '/usr/local',
}
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts
        end

        context "tripwire class without any parameters" do
          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('tripwire::params') }
          it { is_expected.to contain_class('tripwire::install').that_comes_before('tripwire::config') }
          it { is_expected.to contain_class('tripwire::config') }
          it { is_expected.to contain_class('tripwire::service').that_subscribes_to('tripwire::config') }

          it { is_expected.to contain_service('twdaemon') }
          #it { is_expected.to contain_package('tripwire').with_ensure('present') }
        end
      end
    end
  end

#  context 'unsupported operating system' do
#    describe 'tripwire class without any parameters on Solaris/Nexenta' do
#      let(:facts) do
#        {
#          :osfamily        => 'Solaris',
#          :operatingsystem => 'Nexenta',
#        }
#      end

#      it { expect { is_expected.to contain_package('tripwire') }.to raise_error(Puppet::Error, /Nexenta not supported/) }
#    end
#  end
end
