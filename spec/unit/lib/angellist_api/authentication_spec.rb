require 'spec_helper'

describe AngellistApi::Authentication do
  class BasicClass
    include AngellistApi::Authentication
  end

  class FullClass
    include AngellistApi::Authentication
    attr_accessor :access_token
  end

  describe "#authentication" do
    context "without auth variables defined" do
      it "returns a hash with nil values" do
        a = BasicClass.new
        a.send(:authentication).values.any?.should be false
      end
    end

    context "with auth variables defined" do
      let(:a) { FullClass.new }

      it "returns a hash with nil values if auth variables are not set" do
        a.send(:authentication).values.all?.should be false
      end

      it "returns a hash with nil values if auth variables are set" do
        a.access_token = "token"
        a.send(:authentication).values.all?.should be true
      end
    end
  end

  describe "#authenticated?" do
    let(:a) { FullClass.new }

    it "returns false if authentication has any nil values" do
      a.should_receive(:authentication).and_return({:access_token=>nil})
      a.send(:authenticated?).should be false
    end

    it "returns true if authentication has no nil values" do
      a.should_receive(:authentication).and_return({:access_token=>"1"})
      a.send(:authenticated?).should be true
    end
  end
end

