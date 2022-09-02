class TelegramController < Telegram::Bot::UpdatesController
  def start!(word = nil, *other_words)
    user = User.handle_user(from)
    response = "Use `/link olx_url` to add a link for monitoring"
    respond_with :message, text: response
  end

  def link!(data = nil, *)
    user = User.handle_user(from)
    Link.where(url: data, user: user).first_or_create
    respond_with :message, text: "Link was added and will be monitored from now on"
  end
end
