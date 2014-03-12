require 'spec_helper'

describe Post do
  # pending "add some examples to (or delete) #{__FILE__}"


  context "attributes" do
    let(:post) {Post.create(:subject => "test", :body => "something")}#, :open => true, :votes => 0, :favorite_answer => nil)

    it "should have a subject" do
      expect(post.subject).to eq "test"
    end

    it "should have a body" do
      expect(post.body).to eq "something"
    end

    it "should be initialized as open" do
      expect(post.open).to be_true
    end
  end

end
