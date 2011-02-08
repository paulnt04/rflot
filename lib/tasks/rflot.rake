namespace :rflot do
  desc "Install required files into a rails application"
  task :install do
    sh "cp -R #{File.dirname(__FILE__)}/../../public/javascripts/* #{RAILS_ROOT}/public/javascripts/."
  end
end