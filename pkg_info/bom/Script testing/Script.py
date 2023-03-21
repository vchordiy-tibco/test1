import subprocess as sp
import os
from datetime import datetime
from urllib.request import urlopen

#now = datetime.datetime.now()
#newDirName = now.strftime("%Y_%m_%d-%H_%M-%S")
today = datetime.now
newDirName = r"C:\Script testing\{}" .format(today().strftime('%Y_%m_%d-%H_%M-%S'))
print("Making directory " + newDirName)
os.mkdir(newDirName)
#cwd = os.getcwd()
#print(cwd)

DOWNLOAD_URL = "http://reldist.na.tibco.com/package/tibsign/2.1.0/V7-GA/tibsign.exe"

DOWNLOAD_DST = "C:\Script testing\ tibsign.exe"
username = input("Enter Username :")
password = input("Enter Password :")
#folder = input("Enter folder path :")
path = input("Enter path: ")

def download(url, dst_file):
    content = urlopen(url).read()
    outfile = open(dst_file, "wb")
    outfile.write(content)
    outfile.close()
def install():
   output=sp.check_output(['C:\Script testing\ tibsign.exe','-u','$username','-p','$password','-f','C:\ibsign'])
   print(output)
   file = open("$newDirName\sample.log", "wb")
   file.write(output)
   file.close()

def main():
    #download(DOWNLOAD_URL, DOWNLOAD_DST)
    install()
if __name__ == "__main__":
    main()