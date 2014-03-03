require "chef/resource/lwrp_base"

unless Chef::Resource.const_defined?("RbenvRehash")
  Chef::Resource::LWRPBase.build_from_file(
    "rbenv",
    File.join(File.dirname(__FILE__), %w{.. .. .. resources rehash.rb}),
    nil
  )
end

describe Chef::Resource::RbenvRehash do

  let(:resource) { described_class.new("yabba") }

  it "sets the default attribute to name" do
    expect(resource.name).to eq("yabba")
  end

  it "attribute user defaults to nil" do
    expect(resource.user).to be_nil
  end

  it "attribute user takes a String value" do
    resource.name("jerry")
    expect(resource.name).to eq("jerry")
  end

  it "attribute root_path defaults to nil" do
    expect(resource.root_path).to be_nil
  end

  it "attribute root_path takes a String value" do
    resource.root_path("/nowhere/there")
    expect(resource.root_path).to eq("/nowhere/there")
  end

  it "action defaults to :run" do
    expect(resource.action).to eq(:run)
  end
end
