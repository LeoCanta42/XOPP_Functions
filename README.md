# XOPP_Functions
merge,compress,decompress.

I created a bash script for who like me want to use these functions with xournalpp. 
The main "problem" was that i hadn't found a way to merge more xopp file into one so i picked up some useful command in bash and i created these function.
I also created some function to work with pdfs, because if you are taking notes in a book, you may want to use some function to update automatically your notes in book or appending the notes of some slides (i will explain in the particular function).

# Setup
You have to decide A or B:

A) If you want these command permanent in bash (presuming that you have something like git bash, wsl or bash shell in general):
  1) just edit the ~/.bashrc file and add all the script at the end of the file
  2) use the command:   source ~/.bashrc        (be sure to execute in bash)
  3) done! 

B) You want the functions just when you want to use them:
  1) leave the script in the path you want, when you want to use the functions just use:      source path/of/the/file/xoppmerging.bash (be sure to execute in bash)
  2) done !

# Usage
Now that you have made your choice (A/B) you can run your command from that bash shell using:

# xoppdecompress listoffilesxopp
  the command take a list of .xopp files (even one) and decompress the file in an "xml format", because xournal file are gzip compressed and you can decompress them in xml.
ex:     xoppdecompress file1.xopp file2.xopp file3.xopp   --- output: file1 file2 file3  (xml format)

# xoppcompress listoffilexml
  the command take a list of decompressed xopp files (even one) and compress the file in .xopp format, compressing with gzip.

ex:     xoppcompress file1 file2 file3      --- output: file1.xopp file2.xopp file3.xopp
# xoppmerge listoffilesxopptoappend
  the command take a list of file(in decompressed form) but be sure to put files in the order you want to have in the final merged file, because the fuction will append all the pages of the files into a file named merged and this will be done in order of how you passed the file as argument.

ex:   xoppmerge file1 file3 file2         --- output: merged   (a file that concatenate file1 file3 file2 in order)
# xoppallinone listoffilesxopp
  this function is a complete function that take a list of .xopp files and automaticcaly decompress all the files, merge the files following the order they were passed and compress all. At the end you will have all your xopp files unchanged and a merged.xopp that contains a merge of all files.

ex: xoppallinone file3.xopp file1.xopp file2.xopp    --- output: previous file not modified and merged.xopp (in order file3,1,2 in merge)
# xoppupdatenotes_appendpdf
  

# xoppupdatenotes_samepdf
  
