require_relative '../test_helper'

class FrontPageTest < FeatureTest

  def test_user_sees_welcome_message
    visit '/'
    #save_and_open_page
    within("#greeting") do
      assert page.has_content?("What mad skills do you have?")
    end
  end
end
