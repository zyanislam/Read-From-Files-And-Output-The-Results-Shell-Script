#!/bin/bash

file="courses.txt"
n=0

readarray -t lines < "$file"

echo "Course,Min,Max,Average" > stats.csv

# Print each line
# for line in "${lines[@]}"; do
#   echo "$line"
# done

for csv in marks/*; do

  count=0
  mark=0
  max=0
  min=100
  sum=0

  name=${csv:6:7}
  # echo "$csv"

  # Read each csv file
  readarray -t csvc < "$csv"

  # Length of araay csvc
  len=${#csvc[@]}
  # echo "$len"

  # Print each line in the csv file
  # for line in "${csvc[@]}"; do
  #   mark=${line:6:3}
  #   echo $mark
  #   #   if (( $mark>$max )); then
  #   #     max=$mark
  #   #   fi

  #   #   if (( $mark -lt $min )); then
  #   #     min=$mark
  #   #   fi

  #   #   sum=$[sum+mark] 
  # done

  # Loop n times
  for ((i=1; i<len; i++)); do
    # Use the last command on the array
    # last_element=${my_array[-1]}
    mark=${csvc[-1]}
    mark=${mark:6:3}
    echo $mark

    if (( $mark>$max )); then
      max=$mark
    fi

    if (( $mark<$min )); then
      min=$mark
    fi

    # Total marks in this course
    sum=$[sum+mark]
    ((count+=1))
    echo $count

    # Remove the last element from the array
    unset csvc[-1]
  done
  # echo $count
  # echo $sum

  let avg=$sum/$count

  echo "Course ID:" $name
  echo "Average marks:" $avg
  echo "This is the highest marks:" $max
  echo "This is the lowest marks:" $min

  echo "$name,$min,$max,$avg" >> stats.csv
  echo "Course data added"

done

echo "Done"

