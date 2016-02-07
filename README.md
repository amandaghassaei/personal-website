# personal-website
processing script for generating static html for my personal website:
http://www.amandaghassaei.com/

data stored in a google doc is parsed by processing to generates a folder called "mysite" with static html built from "html_templates"

compile.sh grabs latest google doc data, saves a tsv, and runs processing script
http://www.dsfcode.com/using-processing-via-the-command-line/

deploy.sh pushes to amazon s3 server
