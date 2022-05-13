#xopp merge/decompress/compress functions
xoppcompress() {
        arr=("$@")
        for ((i=0;i<${#arr[@]};i++));
                do
                        gzip "${arr[i]}"
                        mv "${arr[i]}.gz" "${arr[i]}.xopp"
                done
}

xoppmerge() {
        arr=("$@")
        sed '$d' "${arr[0]}" >> merged
        if ((${#arr[@]}>1));
        then
                for ((i=1;i<${#arr[@]};i++));
                do
                        sed '1,4d;$d' "${arr[i]}" >> merged
                done
        fi
        echo "</xournal>" >> merged
}

xoppdecompress() {
        arr=("$@")
        for ((i=0;i<${#arr[@]};i++));
                do
                        mv "${arr[i]}.xopp" "${arr[i]}.gz"
                        gzip -d "${arr[i]}.gz"
                done
}

xoppallinone() {
        array=("$@")
        xoppdecompress "${array[@]}"
        xoppmerge  "${array[@]}"
        xoppcompress "${array[@]}"
        xoppcompress  "merged"
}
#end
