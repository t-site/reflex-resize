TEMPFILE=`mktemp --suffix=.tiff`
convert  -enhance  "$1"  "${TEMPFILE}" 
for i in ` seq 118 -1 113  `
do
	mogrify -filter triangle  -resize "${i}"% "${TEMPFILE}"
done

for j in ` seq 112 -1 101 `
do
	mogrify -filter Lanczos  -resize "${j}"% "${TEMPFILE}"
done

convert "${TEMPFILE}" "$2"
rm "${TEMPFILE}"
