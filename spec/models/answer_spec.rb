require 'spec_helper'

describe Answer do
  # pending "add some examples to (or delete) #{__FILE__}"
  let (:some_user){ User.create(:first_name => "Name", :last_name => "Last", :email => "jbwilmoth@joe.com", :password => "password1", :password_confirmation => "password1" )}
  let (:answer) {Answer.create(user_id: some_user.id, post_id: 2, body: "some text")}
  it "should have a user id, post_id and body" do
    expect(answer.user_id).to eq(some_user.id)
    expect(answer.post_id).to eq(2)
    expect(answer.body).to eq("some text")
  end

  it "should have a user creator" do
    answer.should respond_to :user
    expect(answer.user.id).to eq(some_user.id)
  end


end
