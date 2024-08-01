msg_size=110000
for i in {1..10}
do
	let "msg_size=msg_size-10000"
	echo $msg_size
	sudo netperf -H 10.10.1.1 -p 8080 -l 60 -- -m $msg_size -M $msg_size -D | awk 'NR==7 {print $5}'
done
