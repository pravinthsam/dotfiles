import glob
import os
from shutil import copyfile

fname = 'listoffiles'

with open(fname) as f:
    content = f.readlines()

content = [x.strip() for x in content]

# Phase 1: DELETE
for fstring in content:
    fglob = glob.glob(fstring[2:])
    
    for f in fglob:
        print('Deleting {} ...'.format(f))
        os.remove(f)

# Phase 2: COPY
for fstring in content:
    fglob = glob.glob(os.path.expanduser(fstring))
    
    for f in fglob:
        src = f
        dest = os.path.join(*f.split('/')[3:])
        print('Copying {} to {}'.format(src, dest))
        # Create folder if it does not exist
        if (os.path.dirname(dest)!='' and not os.path.exists(os.path.dirname(dest))):
            os.makedirs(os.path.dirname(dest))
        copyfile(src, dest)

