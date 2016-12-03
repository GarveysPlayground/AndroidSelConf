require 'rubygems'
require 'appium_lib'
capabilities = {
	'platformName': 'Android',
	'deviceName': 'android',
	'app': 'C:\GitRepos\appium-workshop\playground\app-debug.apk',
}

server_url = "http://0.0.0.0:4723/wd/hub"

Appium::Driver.new(caps: capabilities).start_driver
Appium.promote_appium_methods Object #This loads the appium_lib helper methods. e.g. text, testfields, buttons etc...

find_element(:id, "ReferenceApp").click
text("Alerts").click
find_element(:id, "com.amazonaws.devicefarm.android.referenceapp:id/notifications_alert_button").click
find_element(:id, "android:id/button1").click
find_element(:id, "ReferenceApp").click
text("Home").click
driver_quit
