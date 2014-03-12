require 'spec_helper'

feature "Answer" do
  let(:the_post){Post.create(subject: "ruby", body: "some body", user_id: 6)}
  context "Post show page" do
    it "should have a form for creating answers" do
      visit post_path(the_post)
      expect(page).to have_selector("form", action=new_post_answer_url(the_post), method="post")
    end

  end



end
