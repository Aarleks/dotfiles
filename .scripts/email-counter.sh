#!/bin/bash

# This file counts the number of email files in a folder with a certain date value.

# for each file in ~/.mail/work/**
# get the line with "Date: "
# convert the line to YYYYMMDD
# create variable with today's date -7days
# if file date is greater than or equal to variable
    # add +1 to $foldername
# for each variable print variable name = value
    # for i in {var1, var2, var3}; do echo "$i = ${!i}"; done

# things
Teaching=~/.mail/work/Teaching/cur/*
Research=~/.mail/work/Research/cur/*
Service=~/.mail/work/Service/cur/*
Professional=~/.mail/work/Professional/cur/*

weekago=`date -d "today -7 days" +"%Y%m%d"`

for i in $Teaching $Research $Service $Professional;
do
	count=0
	for j in $i;
	do
		dateLine=`cat "$j" | grep "Date: " | sed 's/.*: //g' | xargs -0 date +"%Y%m%d" -d`

		if [ $dateLine -ge $weekago ];
		then
			count+=1
		fi

	done

	echo "${!i@} = $count"
done
