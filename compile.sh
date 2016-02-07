curl -o "Web Database - Projects.tsv" "https://docs.google.com/spreadsheets/d/1cKONmB73XmNSwEEO_sI6anuuvdajTbAEYwTEgsvyQtg/export?gid=0&format=tsv"
curl -o "Web Database - Project Images.tsv" "https://docs.google.com/spreadsheets/d/1cKONmB73XmNSwEEO_sI6anuuvdajTbAEYwTEgsvyQtg/export?gid=845485&format=tsv"
processing-java --sketch=`pwd`  --run

