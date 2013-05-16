# dopis_online_client

[![Build Status](https://travis-ci.org/kraxnet/dopis_online_client.png)](https://travis-ci.org/kraxnet/dopis_online_client)

DopisOnline je služba České pošty, s.p., která "umožnuje zákazníkovi podání dokumentu v elektronické formě (formát PDF), přičemž dodáná je uskutečněno formou klasického vytištěného dopisu."

Vice informaci na https://online.postservis.cz/Download/DopisOnline/DopisOnline.pdf

## Usage:

    require 'lib/dopis_online_client'

    DopisOnlineClient.base_uri 'https://online.postservis.cz/cmdedopis'
    DopisOnlineClient.auth('jmeno','heslo')
    
    DopisOnlineClient::Request.send(
      :pdf_file_path=>"letter.pdf"
    )

## Copyright

Copyright (c) 2009-2013 Jiří Kubíček, KRAXNET s.r.o.. See LICENSE for details.
