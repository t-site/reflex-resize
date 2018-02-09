TEMPFILE=`mktemp --suffix=.tiff`
convert  -enhance  "$1"  "${TEMPFILE}" 
for i in ` seq 111 118 | tac `
do
	mogrify -filter Mitchell -resize "${i}"% "${TEMPFILE}"
done

for j in ` seq 101 112 | tac `
do
	mogrify -filter Parzen -resize "${j}"% "${TEMPFILE}"
done

convert "${TEMPFILE}" "$2"
rm "${TEMPFILE}"
