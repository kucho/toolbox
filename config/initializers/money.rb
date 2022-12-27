MoneyRails.configure do |config|
  config.default_currency = -> do
    MultiTenantSupport.current_tenant&.default_currency&.downcase&.to_sym ||
      :usd
  end
  config.rounding_mode = BigDecimal::ROUND_HALF_UP
  config.locale_backend = :i18n
  config.raise_error_on_money_parsing = false
end
