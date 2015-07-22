# encoding: utf-8
require 'chefspec'
require 'spec_helper'
require 'chefspec/berkshelf'

describe 'mapr-impala-state::default' do
  let(:chef_run) do
    ChefSpec::SoloRunner.new do |node|
    end.converge(described_recipe)
  end

  it 'installs package mapr-impala-catalog' do
    expect(chef_run).to install_package('mapr-impala-catalog')
  end
  
  it 'installs package mapr-impala-statestore' do
    expect(chef_run).to install_package('mapr-impala-statestore')
  end
  
  it 'run configure.sh -R' do
  expect(chef_run).to run_bash('/opt/mapr/server/configure.sh -R')
  end
  
   it 'chef should change env file' do
  expect(chef_run).to run_ruby_block('Set Impala parameters')
  end
end
