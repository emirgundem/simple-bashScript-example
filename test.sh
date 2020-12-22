#! /bin/bash

#Display the menu

while true
do

echo "Please select action : "
echo "*************************"
echo "1. Enroll new student"
echo "2. View the file"
echo "3. Search within the file"
echo "4. Send the file by mail"
echo "5. Open the file libreoffice "
echo "6. Search file in directory"
echo "7. Delete all student information"

echo "8. Press Q to exit"

echo "************************"
echo -n "Choose any number [1-6]" 

read choose 

if [ $choose == 1 ] 
then 
echo "Student name and surname" 
read name
echo "student email adress"
read mailadress
echo "Student department"
read department
echo "City"
read city
echo "Student score information  "
read score
registerDate=`date +"%Y-%m-%d-%H-%M"`
echo "$name $mailadress $department $city "score : $score" "date : ${registerDate}" "  >> students.txt
echo "Student information saved."
echo "*****************************"


#VİEW FİLE
elif [ $choose == 2 ] 
then
echo "Enrolled students file is displayed..."
filename="students.txt"
while IFS= read -r line 
do 
  echo "$line"
done <"$filename"


#searchFile
elif [ $choose == 3 ]
then
echo "Enter the name of student"
read studentname
filename="students.txt"
while IFS= read -r 
do 
grep -i $studentname students.txt
done <"$filename"


#Send Email
elif [ $choose == 4 ]
then 
echo "Sending Email"
echo "Enter your email adress : " 
read emailadress
echo "Enter your email subject : "
read subject
mail -s "$subject" "$emailadress" < students.txt
echo "The file has been sent. Please check your email box."

#OPENİNG THE FİLE WİTH LİBREOFFİCE
elif [ $choose == 5 ]
then
echo "1.Open the file in EXCEL"
echo "2.Open the file in WORD"
read option
if [ $option == 1 ]
then
echo "Transfer the file to excel"
echo "Opening the student file..."
libreoffice --calc students.txt
else
libreoffice --writer students.txt
echo "Opening the student file with word"
fi

#EXİT APP
elif [ $choose == "Q" ]
then
exit 0
echo "The application has been exited."

#Search file in directory
elif [ $choose == 6 ]
then
echo "Search file "
echo "Please entry file name : "
read file_name
find -name "$file_name"
echo "$file_name found"


#DELETE All student İnformation 
elif [ $choose == 7 ]
then 
echo "Attention!! ****This option deletes all student information.*****"
echo -n "Type (Yes) or (No) to delete :  "
read remove
if [ $remove == "Yes" ] 
then
filename='students.txt'
rm $filename
echo "File removed."
else 
echo "File does not removed."
fi

else 
echo "Something went wrong please try again.."
fi
done