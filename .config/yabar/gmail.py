"""
Shows basic usage of the Gmail API.

Lists the user's Gmail labels.
"""
from __future__ import print_function
from apiclient.discovery import build
from httplib2 import Http
from oauth2client import file, client, tools
import sys

# Setup the Gmail API
SCOPES = 'https://www.googleapis.com/auth/gmail.readonly'
store = file.Storage('token.json')
creds = store.get()
if not creds or creds.invalid:
    flow = client.flow_from_clientsecrets('credentials.json', SCOPES)
    creds = tools.run_flow(flow, store)
    print('here')
service = build('gmail', 'v1', http=creds.authorize(Http()))

if sys.argv[1] == 'unread':
    inbox_results = service.users().labels().get(userId='me', id='INBOX').execute()
    print(inbox_results['threadsUnread'])

if sys.argv[1] == 'inbox':
    inbox_mails = service.users().threads().list(userId='me', labelIds='INBOX').execute()
    for thread in inbox_mails['threads']:
        t = service.users().threads().get(userId='me', id=thread['id'], format='full').execute()
        _from = ''
        _snippet = ''
        for header in t['messages'][0]['payload']['headers']:
            if header['name'] == 'From':
                _from = header['value']
                break
        _snippet = t['messages'][0]['snippet']
        _snippet_chars = 100 - len(_from)
        print(_from, '||', _snippet[:_snippet_chars])
