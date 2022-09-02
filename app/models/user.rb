class User < ApplicationRecord
  has_many :links

  def self.handle_user(from)
    return true unless from.present?
    User.where(telegram_id: from['id']).first_or_create(first_name: from['first_name'], last_name: from['last_name'], username: from['username'])
  end
end
