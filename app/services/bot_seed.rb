# frozen_string_literal: true

class BotSeed
  def call
    Base64.urlsafe_encode64([Rails.application.secrets[:interval],
                             Rails.application.secrets[:lot_size],
                             Rails.application.secrets[:profit]].map(&:to_f).join('+'))
  end
end
