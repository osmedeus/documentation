#!/bin/bash

mkdocs build -d docs
echo 'docs.osmedeus.org' > docs/CNAME
git add -A 
git commit -m "Update Documentation Page $(date)" 
git push -u origin main
