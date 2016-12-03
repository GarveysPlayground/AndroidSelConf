require 'spec_helper'

describe 'Crash Page' do
	it 'Click Crash Button' do
		find_element(:id, 'ReferenceApp').click
		text("Crash/Bug").click
		find_element(:id, 'com.amazonaws.devicefarm.android.referenceapp:id/crash_button').click
		expect(texts.last.text).to eq "Pressing this button will crash the app"
	end
end