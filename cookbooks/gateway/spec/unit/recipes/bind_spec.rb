#
# Cookbook Name:: gateway
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'gateway::bind' do
  context 'When all attributes are default, on an unspecified platform' do
    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
    	expect { chef_run }.to_not raise_error
    end
  
    it 'installs bind-chroot' do
  		expect(chef_run).to install_package 'named-chroot'
  	end

 	it 'enables the named-chroot service' do
   		expect(chef_run).to enable_service 'named-chroot'
  	end

  	it 'starts the named-chroot service' do
    	expect(chef_run).to start_service 'named-chroot'
  end

  end
end
