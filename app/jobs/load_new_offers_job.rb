class LoadNewOffersJob < ApplicationJob
  queue_as :default

  def perform
    puts "Loading new offers...".blue
    Link.all.each do |link|
      link.load_offers
    end
    puts "Loading new offers done".green
  end
end
