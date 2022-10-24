xoppcompress() { #take decompressed xournal file and get out a xournalpp file
        arr=("$@")
        for ((i=0;i<${#arr[@]};i++)); #you can put all decompressed xournal file and it will compress in each specific file
                do
                        gzip "${arr[i]}"
                        mv "${arr[i]}.gz" "${arr[i]}.xopp"
                done
}

xoppdecompress() { #take xournalpp without the .xopp file and get out a decompressed file
        arr=("$@")
        for ((i=0;i<${#arr[@]};i++));
                do
                        mv "${arr[i]}" "${arr[i]%.*}.gz"
                        gzip -d "${arr[i]%.*}.gz"
                done
}

xoppmerge() {
        arr=("$@")
        sed '$d' "${arr[0]}" >> merged #remove the last line of the first file and put the content in a file named merged
        if ((${#arr[@]}>1));
        then
                for ((i=1;i<${#arr[@]};i++)); #for all .xopp file to merge in order after the first
                do
                        sed '1,4d;$d' "${arr[i]}" >> merged #remove the first 4 lines,the last line and append the content in the merged file
                done
        fi
        echo "</xournal>" >> merged #close the xopp file (the last line we removed from every file was this at the end)
}

xoppallinone() { #take a list of .xopp in order to decompress, merge, and compress in a merged.xopp
        array=("$@")
        xoppdecompress "${array[@]}"
        xoppmerge  "${array[@]}"
        xoppcompress "${array[@]}" #just to compress the "old" .xopp file and take them back
        xoppcompress  "merged"
}

xoppupdatenotes_appendpdf() { #take a .xopp to append and a .pdf where appending
        arr=("$@")
        xournalpp -p "notesxopp.pdf" "${arr[0]}"
        mv "${arr[1]}" "oldnotes.pdf"
        pdftk "oldnotes.pdf" "notesxopp.pdf" cat output "${arr[1]}" #merge pdfs in order
        rm "oldnotes.pdf" "notesxopp.pdf" "${arr[0]}"
}

xoppupdatenotes_samepdf() { #take a .xopp and a .pdf to update
        arr=("$@")
	cp "${arr[1]}" old/ #just to save the old pdf, to avoid loss of data in case of problems
        xournalpp -p "notedBook_.pdf" "${arr[0]}" #export the .xopp file in pdf
        mv "notedBook_.pdf" "${arr[1]}"
}
