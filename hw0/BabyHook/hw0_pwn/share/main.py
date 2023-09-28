import base64
import os
import subprocess
import tempfile

def main():
    print('Give me your share object:')
    so = base64.b64decode(input())
    tmp = tempfile.NamedTemporaryFile(delete=False)
    tmp.write(so)
    os.popen(f'chmod +x {tmp.name}')
    p = subprocess.Popen(f'LD_PRELOAD={tmp.name} ./chall', shell=True)
    p.wait()
    tmp.close()
    os.unlink(tmp.name)

if __name__ == "__main__":
    main()