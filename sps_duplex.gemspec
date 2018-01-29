Gem::Specification.new do |s|
  s.name = 'sps_duplex'
  s.version = '0.1.0'
  s.summary = 'A gem to allow 2 way communication using a SimplePubSub broker.'
  s.authors = ['James Robertson']
  s.files = Dir['lib/sps_duplex.rb']
  s.add_runtime_dependency('sps-sub', '~> 0.3', '>=0.3.6')
  s.add_runtime_dependency('sps-pub', '~> 0.5', '>=0.5.5')
  s.signing_key = '../privatekeys/sps_duplex.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'james@jamesrobertson.eu'
  s.homepage = 'https://github.com/jrobertson/sps_duplex'
end
