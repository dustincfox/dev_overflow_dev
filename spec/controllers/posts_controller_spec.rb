require 'spec_helper'

describe PostsController do

  it "creates a new post" do
    expect {
      Post.create(:subject => "test", :body => "something")
    }.to change(Post, :count).by(1)
  end



end
