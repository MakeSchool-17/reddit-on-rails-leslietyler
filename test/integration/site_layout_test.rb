require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
    test "layout links" do
      get root_path
      assert_template 'subreddits/new'
      assert_select "a[href=?]", root_url, count: 2
      assert_select "a[href=?]", subreddits_url
    end
end
