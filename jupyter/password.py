from notebook.auth import passwd
import os

PASSWORD=os.environ['PASSWORD']

with open('/tmp/sha1-psswd', 'w') as f:
    f.write(passwd(PASSWORD))