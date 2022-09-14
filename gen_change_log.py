from difflib import Differ
import os.path
import sys

args = sys.argv

if (args) and (len(args) < 3):
    print ("Missing input files")
    sys.exit(2) 

res = os.path.exists(args[1])
if (res == False):
    print("Old file not found")
    sys.exit(2) 

res = os.path.exists(args[2])
if (res == False):
    print("New file not found")
    sys.exit(2) 

# print("Processing diff log, old file: `{}` and new file `{}`".format(args[1], args[2]))

with open(args[1]) as file_1, open(args[2]) as file_2:
    differ = Differ()
    difflist = differ.compare(file_1.readlines(), file_2.readlines())

    diff = []
    difflog = []
    for line in difflist:
        # line = line.strip()
        if (line[0] == '+') or (line[0] == '-'):
            diff.append(line)

    if diff:
        idx = 0
        max = len(diff)
        while idx < max :
            parts1 = diff[idx].split()
            if (parts1[0] == '-'):
                parts2 = diff[idx+1].split()
                if (parts1[1] == parts2[1]):
                    line = "- `{}` changed from {} to {}".format(parts1[1], parts1[2], parts2[2])
                    difflog.append(line)
                    idx +=1
                else:
                    line = "- `{}-{}` package removed".format(parts1[1], parts1[2])
                    difflog.append(line)                
            else:
                line = "- `{}-{}` package added".format(parts1[1], parts1[2])
                difflog.append(line)
            idx +=1
            
    if difflog:
        for line in difflog:
            print(line)
   