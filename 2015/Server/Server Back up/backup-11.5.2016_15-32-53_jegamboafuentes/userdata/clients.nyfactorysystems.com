--- 
documentroot: /home/jegamboafuentes/public_html
group: jegamboafuentes
hascgi: 1
homedir: /home/jegamboafuentes
ifmodulealiasmodule: 
  scriptalias: 
    - 
      path: /home/jegamboafuentes/public_html/cgi-bin/
      url: /cgi-bin/
ifmoduleincludemodule: 
  directoryhomejegamboafuentespublichtml: 
    ssilegacyexprparser: 
      - 
        value: " On"
ifmoduleitkc: {}

ifmodulemodincludec: 
  directoryhomejegamboafuentespublichtml: 
    ssilegacyexprparser: 
      - 
        value: " On"
ifmoduleuserdirmodule: 
  ifmodulempmitkc: 
    ifmoduleruidmodule: {}

ip: 107.180.50.224
ipv6: ~
no_cache_update: 0
owner: gdresell
phpopenbasedirprotect: 1
port: 80
scriptalias: 
  - 
    path: /home/jegamboafuentes/public_html/cgi-bin/
    url: /cgi-bin/
serveradmin: webmaster@clients.nyfactorysystems.com
serveralias: www.clients.nyfactorysystems.com
servername: clients.nyfactorysystems.com
usecanonicalname: 'Off'
user: jegamboafuentes
userdirprotect: ''
