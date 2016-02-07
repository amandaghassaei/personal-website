cd mysite/
aws s3 sync . s3://www.amandaghassaei.com --exclude "*.DS_Store" --exclude ".git/*" --exclude ".gitignore" --exclude "*.idea/*" --acl public-read -—delete