#!/bin/bash

echo "OWASP Top 10 Proactive Controls Markdown Conversion Tool"

function command_exists () {
    command -v $1 >/dev/null 2>&1;
}

if ! command_exists pandoc; then
    echo "
    Error: Please install pandoc. Cannot continue"
    exit;
fi




generate_docx() {
   # define pages; ensure info.md is not included in doc generation  
  #local pages=$( ls "0x0*.md c*.md f*.md " | sort -V );
 local pages=$(ls | sort -V | grep '0x0\|c\|f'.*.md);
   sed '/^---$/,/^---$/d' $pages | pandoc  --from markdown  --reference-doc="../templates/template.docx" --columns 10000 --toc --toc-depth=1 -V toc-title="TOC" -t docx  -o "../OWASP-Top10-Proactive-Controls-V3-$1.docx"  
}



generate_html() {
    local pages="0x*.md c*.md f*.md "
    sed '/^---$/,/^---$/d' $pages | pandoc --standalone -f gfm -t html5 --toc --toc-depth=1  --metadata=title:"OWASP Top 10 Proactive Controls 2018 " -o "../OWASP-Top10-Proactive-Controls-V3-$1.html" 
}

generate() {
    echo -n "Generating ($1) version ..."
    if [ -d "$1" ]; 
    then
        cd "$1"
       
        generate_docx $1
        generate_html $1
        cd ..
        echo " done."
    else
        echo " No OWASP PC found in directory $1"
    fi
}

# English
generate "en"

 
echo "Finished generating documents for OWASP Top 10 Proactive Control"

