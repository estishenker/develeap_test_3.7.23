# develeap_test_3.7.23
test before DevOps studies in develeap company

in this test have 10 questions that coming in pairs: answer + script

Questions:
1.Paste a script that will return the first line of the file
2.Each log line has a log level indication. For errors, this is always ERROR. How many lines with log level ERROR are there in the file?
3.In the log file there are consistent messages for every transaction start and end. How many transactions are in the logfile
  Paste a script that will return the number of transactions in the logfile
4.You can find out the time a transaction took by subtracting it's end time from it's start time.
  The following questions expect time to be in milliseconds (ms) , e.g. if a transaction started at 07:15:10.100 and ended at 07:15:11.050 then is took 950 ms
  What is the ID of the fastest transaction, the one that took the least time?
  Paste a script that will return the id of the fastest transaction
5.Paste a script that will return the average transaction time in ms

Answers:
1.
head -n 1 exam.log 
A: 19-3-2020 07:00:02.768	INFO	11	192	Log 535 - user 5256007 at realtime 2023-07-02 20:44:15.455682

2.
-> summary "ERROR" in info column
awk '{print $3}' exam.log| grep -w -o "ERROR" |wc -l 
A: 23

-> if required to summary all the lines that contains ERROR ignores duplicates
grep -c <"pattern"> <path> 

3.
grep -c -w "begun" exam.log
A: 105  

4.
bash question4.sh
A: 17316   

5.
bash question5.sh
A: 155

