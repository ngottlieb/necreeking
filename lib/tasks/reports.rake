namespace :reports do

  desc "Back-update reports to match them to user accounts"
  task :back_match_reports => :environment do
    puts "Updating reports..."
    Report.find_each do |report|
      report.assign_to_user
    end
  end

end