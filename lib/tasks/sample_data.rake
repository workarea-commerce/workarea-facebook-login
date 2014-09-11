namespace :weblinc do
  namespace :facebook do
    task sample_data: :environment do
      require 'weblinc/sample_data'
      Weblinc::SampleData.setup

      puts 'Adding facebook sample data...'
      # Add sample data for your plugin here
    end
  end
end
