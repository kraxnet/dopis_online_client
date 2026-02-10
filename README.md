# dopis_online_client

![CI](https://github.com/kraxnet/dopis_online_client/workflows/CI/badge.svg)

DopisOnline je služba České pošty, s.p., která "umožnuje zákazníkovi podání dokumentu v elektronické formě (formát PDF), přičemž dodáná je uskutečněno formou klasického vytištěného dopisu."

Vice informaci na https://online.postservis.cz/Download/DopisOnline/DopisOnlineUzivatelskaPrirucka.pdf

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dopis_online_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install dopis_online_client

## Usage

```ruby
require 'dopis_online_client'

DopisOnlineClient.base_uri 'https://online.postservis.cz/cmdedopis'
DopisOnlineClient.auth('jmeno','heslo')

DopisOnlineClient::Request.send("letter.pdf")
```

## Requirements

- Ruby >= 2.7.0
- Modern Ruby versions (3.0, 3.1, 3.2, 3.3) are fully supported

## Development

After checking out the repo, run `bundle install` to install dependencies. Then, run `rake test` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kraxnet/dopis_online_client.

## Copyright

Copyright (c) 2009-2026 Jiří Kubíček, KRAXNET s.r.o.. See LICENSE for details.
