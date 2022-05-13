# XOPP_Functions
merge,compress,decompress.

I created a bash script for who like me want to use these functions with xournalpp. 
The main "problem" was that i hadn't found a way to merge more xopp file into one so i picked up some useful command in bash and i created this script.

# Setup
You have to decide A or B:
A) If you want these command permanent in bash (presuming that you have something like git bash, wsl or bash shell in general):
  1) just edit the ~/.bashrc file and add all the script at the end of the file
  2) use the command:   source ~/.bashrc        (be sure that you are in bash, with wsl I had some problems because I had to execute bash before the                                                          execution of this command and all the functions in general)
  3) done! 

B) You want the functions just when you want to use them:
  1) leave the script in the path you want, when you want to use the functions just use:      source path/of/the/file/xoppmerging.sh
  2) done !

# Usage
Now that you have made your choice (A/B) you can run your command from that bash shell using:

# xoppdecompress listoffilesxopp
  the command take a list of xopp files (even one) and decompress the file in an xml format, because xournal file are gzip compressed and you can decompress   them in xml. VERY IMPORTANT: you have to write the name of the file without .xopp extension, just the complete name.

# xoppcompress listoffilexml
  the command take a list of xopp files (even one) and compress the file (xml decompressed before) in .xopp format, compressing with gzip.

# xoppmerge listoffilesxopptoappend
  the command take a list of file(in decompressed form so xml) but be sure to put files in the order you want to have in the final merged file, because the     fuction will append all the pages of the files into a file named merged and this will be done in order of how you passed the file in argument.
 
 # xoppallinone listoffilesxopp
  this function is a complete function that take a list of xopp files (remember without .xopp extension) and automaticcaly decompress all the files, merge     all the files following the order they were passed and compress all the files. At the end you will have all your xopp files unchanged and a merged.xopp       that contains a merge of all files.
