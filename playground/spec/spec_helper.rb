require 'appium_lib'
require 'rspec'
require 'pathname'
require 'allure-rspec'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation

  config.before :all do
end

config.before :each do |e|
  caps = Appium.load_appium_txt file: 'appium.txt'
  Appium::Driver.new(caps).start_driver
  Appium.promote_appium_methods Object
  test = e.description.gsub(" ","_")
  start_logcat test
end

config.after :each do |e|
  test = e.description.gsub(" ","_")
  screenshot "./output/#{test}.png"
  stop_logcat
  files = Dir.entries("./output/").grep(/#{test}/)
  files.each { |file| e.attach_file("File:", File.new("./output/#{file}")) } unless files.empty?
  driver_quit
end

config.after :all do
end
end

def start_logcat test
  pid = spawn("adb logcat -v long", :out=>"./output/logcat-#{test}.log")
  ENV["LOGCAT"] = pid.to_s
end

def stop_logcat
system("taskkill /f /pid #{ENV["LOGCAT"]} > NUL")
end

AllureRSpec.configure do |config|
config.include AllureRSpec::Adaptor
config.output_dir = "./output/allure"
config.clean_dir = true
end