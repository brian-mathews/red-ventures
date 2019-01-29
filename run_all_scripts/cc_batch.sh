SCRIPTPATH=`dirname $PWD`
FILES="$SCRIPTPATH/test_suite/*.rb"

for f in $FILES
do
	echo "Processing $f file..."
	ruby $f $address $browser
	sleep 5
	echo "FINISHED\n\n"
done