require "spec_helper"

RSpec.describe AdyenOfficial do
  before(:all) do
    @shared_values = {
      client: nil
    }
  end

  it "creates AdyenOfficial client" do
    @shared_values[:client] = AdyenOfficial::Client.new
    expect(@shared_values[:client]).is_a? AdyenOfficial::Client
  end

  it "sets env to :mock" do
    @shared_values[:client].env = :test
    expect(@shared_values[:client].env).
      to eq(:test)
  end

  it "sets the version number" do
    @shared_values[:client].checkout.version = @shared_values[:version]
    expect(@shared_values[:client].checkout.version).
      to eq(@shared_values[:version])
  end

  it "fails payments call without WS user and password" do
    expect{ @shared_values[:client].payments.authorise("{}") }.
      to raise_error(AdyenOfficial::AuthenticationError)
    @shared_values[:client].ws_user = @shared_values[:ws_user]
    expect{ @shared_values[:client].payments.authorise("{}") }.
      to raise_error(AdyenOfficial::AuthenticationError)
  end

  it "fails a checkout call without api key" do
    expect{ @shared_values[:client].checkout.payment_methods("{}") }.
      to raise_error(AdyenOfficial::AuthenticationError)
    @shared_values[:client].api_key = "api_key"
  end
end
