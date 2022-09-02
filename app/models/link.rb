require 'open-uri'

class Link < ApplicationRecord
  has_many :offers
  belongs_to :user

  def load_offers
    doc = Nokogiri::HTML(URI.open(url))
    offer_links = doc.css("div[data-cy=l-card] a").map { |link| link['href'] }
    first_time = !offers.present?
    offer_links.each do |offer_url|
      offer = Offer.where(link_id: id, url: offer_url).first
      next if offer.present?
      new_offer = Offer.create(link_id: id, url: offer_url)
      message = offer_url.include?('otodom') ? offer_url : "https://olx.pl#{offer_url}"
      Telegram.bot.send_message(chat_id: user.telegram_id, text: message) unless first_time
    end
  end
end
