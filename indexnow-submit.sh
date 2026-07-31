#!/bin/bash
# Submete as 4 paginas ao IndexNow de uma so vez.
# Usar SO depois de o ficheiro da chave estar publicado e acessivel em:
#   https://timelesstales.pt/09eab91226eb3a4e947cd18562a9c326.txt

curl -i -X POST https://api.indexnow.org/indexnow \
  -H "Content-Type: application/json; charset=utf-8" \
  -d '{"host": "timelesstales.pt", "key": "09eab91226eb3a4e947cd18562a9c326", "keyLocation": "https://timelesstales.pt/09eab91226eb3a4e947cd18562a9c326.txt", "urlList": ["https://timelesstales.pt/", "https://timelesstales.pt/destination-wedding-films.html", "https://timelesstales.pt/wedding-venues.html", "https://timelesstales.pt/destination-weddings.html"]}'
