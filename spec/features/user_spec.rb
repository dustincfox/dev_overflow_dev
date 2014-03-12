require 'spec_helper'

feature "User" do
  context 'on home page' do
    xit "can see the title of the site" do
      visit root_path

      expect(page).to have_content "RecomMemeDo"

    end
  end
end
