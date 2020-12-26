# -*- coding: utf-8 -*-
import requests, json, sys
# License: GPL
# Usage: python dexonlineAPI.py <word> <responsetype>.
# The argument order is binding, the second argument is not imperative, if missing will default to "html".
# Example: python dexonlineAPI.py "casă" text
# Example: python dexonlineAPI.py "casă" html
# Example without second optional argument: python dexonlineAPI.py "casă"
word = sys.argv[1]
responsetype = sys.argv[2] # plain text or html formatted

try: # if responsetype is not entered, response type defaults to html
    responsetype = sys.argv[2] # "text" or "html"
except:
    # print('No response type entered, will default to "html."\r\n')
    responsetype = 'html'
    pass
if not word:
  print('Please enter a word to search for!')
  sys.exit('No word entered')
responsetext = json.loads(requests.get('https://dexonline.ro/definitie/' + word + '/expandat/json').text)
if len(str(responsetext['definitions'])) <= 2:
  print('\"' + word + '\"'+ " not found!")
else:
  if responsetype == 'html':
    for defs in responsetext['definitions']:
      print(defs['htmlRep'])
    print('<br>Results fetched successfully courtesy of <a href="http://www.dexonline.ro">www.dexonline.ro</a>')
  elif responsetype == 'text':
    for defs in responsetext['definitions']:
      print(defs['internalRep'])
    print('\r\nResults fetched courtesy of dexonline.ro')
  else:
    print('Second argument must be "html" or "text"')
sys.exit('A big thanks to all contributors to the dexonline.ro project!')
