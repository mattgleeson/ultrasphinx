if defined?(Rails::Railtie)
  # rails 3
  module Ultrasphinx
    class Railtie < Rails::Railtie
      initializer "ultrasphinx.active_record" do
        ActiveSupport.on_load :active_record do
          Ultrasphinx::Configure.load_constants
        end
      end
    end
  end
else
  # rails 2.3
  Rails.configuration.after_initialize do
    Ultrasphinx::Configure.load_constants
  end
end
