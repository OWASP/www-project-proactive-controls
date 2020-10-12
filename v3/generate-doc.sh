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
   # pandoc -s -f gfm   -s -f markdown_github  --reference-doc=../templates/template.docx --columns 10000 -t docx  -o "../OWASP-Top10-Proactive-Controls-V3-$1.docx" *.md
   # ensure info.md is not included in doc generation
  local pages="0x*.md c*.md  f*.md "
   pandoc  --from markdown  --reference-doc="../templates/template.docx" --columns 10000 --toc --toc-depth=1 -t docx  -o "../OWASP-Top10-Proactive-Controls-V3-$1.docx" $pages 
}



generate_html() {
    pandoc --standalone -f gfm -t html5 --metadata=title:"OWASP Top 10 Proactive Controls 2018 " -o "../OWASP-Top10-Proactive-Controls-V3-$1.html" *.md
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

