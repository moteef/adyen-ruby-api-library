require_relative 'lib/adyen/version'

Gem::Specification.new do |spec|
  spec.name = 'adyen-ruby-api-library'
  spec.version = AdyenOfficial::VERSION
  spec.required_ruby_version = '>= 2.1.0'
  spec.authors = ['AdyenOfficial']
  spec.email = ['support@adyen.com']

  spec.summary = 'Official AdyenOfficial  Ruby API Library'
  spec.description = 'Official AdyenOfficial API Library for Ruby. Simplifies integrating with the AdyenOfficial API, including Checkout, Marketpay, payments, recurring, and payouts.  For support please reach out to support@adyen.com.  If you would like to contribute please submit a comment or pull request at https://github.com/AdyenOfficial/adyen-ruby-api-library.'
  spec.homepage = 'https://www.adyen.com'
  spec.license = 'MIT'

  spec.metadata = {
    'documentation_uri' => 'https://docs.adyen.com/developers/development-resources/libraries',
    'homepage_uri' => 'https://www.adyen.com',
    'source_code_uri' => 'https://github.com/AdyenOfficial/adyen-ruby-api-library'
  }

  spec.files = `git ls-files`.split("\n")

  spec.add_dependency 'faraday'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'activesupport'
end
