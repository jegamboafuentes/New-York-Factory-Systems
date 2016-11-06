--- 
customlog: 
  - 
    format: combined
    target: /usr/local/apache/domlogs/nyfactorysystems.com
  - 
    format: "\"%{%s}t %I .\\n%{%s}t %O .\""
    target: /usr/local/apache/domlogs/nyfactorysystems.com-bytes_log
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
owner: gdresell
phpopenbasedirprotect: 1
port: 80
scriptalias: 
  - 
    path: /home/jegamboafuentes/public_html/cgi-bin
    url: /cgi-bin/
  - 
    path: /home/jegamboafuentes/public_html/cgi-bin/
    url: /cgi-bin/
serveradmin: webmaster@nyfactorysystems.com
serveralias: www.nyfactorysystems.com
servername: nyfactorysystems.com
usecanonicalname: 'Off'
user: jegamboafuentes
userdirprotect: ''
