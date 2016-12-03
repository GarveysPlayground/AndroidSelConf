require 'spec_helper'

describe 'Home Page' do

	it 'Should Display Correct Text' do
		home_page_text = find_element(:id, 'com.amazonaws.devicefarm.android.referenceapp:id/toolbar_title').text
		expect(home_page_text).to eq "Homepage"
	end
end