#!/bin/bash

# filter all the lines of transactions "begun" and additional command to find all the lines of transactions "done"

grep -w "begun" /home/devops/Downloads/exam1.log | sort -n >/home/devops/Downloads/transaction_begun.log
grep -w "done" /home/devops/Downloads/exam1.log | sort -n >/home/devops/Downloads/transaction_done.log

#file with all id of transactions
awk '{print $7}' /home/devops/Downloads/transaction_begun.log >/home/devops/Downloads/transaction.log

fastest_transaction=1000000000
avg=0

#loop to find the id of faster transaction
for id in $(cat transaction.log); do
    # cut the column that contains the time from file with id of transaction begun file and cast it to numeric
    begun=$(grep $id /home/devops/Downloads/transaction_begun.log | awk '{print $2}')
    begun_seconds=$(date -u -d "$begun" +%s%3N)

    #same as the previous two commands in transaction done file
    done_time=$(grep $id /home/devops/Downloads/transaction_done.log | awk '{print $2}')
    #  %3N 3 numbers after the point
    done_seconds=$(date -u -d "$done_time" +%s%3N)

    #calculating time "end-start" transaction to find the faster transaction
    # 10# mong 0 leads
    ((duration = $((10#$done_seconds)) - $((10#$begun_seconds))))
    ((avg = avg + duration))
    if (( duration < fastest_transaction )); then
         #keep value of minimum time
         fastest_transaction=$duration
         #keep id of minimum time
         fastest_id=$id
    fi

done
# calculate how many transactions have
sum_transaction=$(grep -w -c "begun" /home/devops/Downloads/exam1.log)
let result_avg=$avg/$sum_transaction
echo "avg = $result_avg"

rm transaction.log
