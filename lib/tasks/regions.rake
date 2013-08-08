namespace :regions do
  
  desc "Create regions to match already existing Twilio phone numbers"
  task :create_regions => :environment do
    southeast = Region.new(name: "Southeast", phone_number: "(828) 633-4830")
    northeast = Region.new(name: "Northeast", phone_number: "(802) 746-4779")
    southeast.save
    northeast.save
    # by default, since northeast was the first region, assign all previous reports to northeast
    Report.all.each do |r|
      r.region = northeast
      r.save
    end
  end

end