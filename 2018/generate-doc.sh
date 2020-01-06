#!/bin/bash

echo "OWASP Top 10 Proactive Controls Markdown Conversion Tool"
echo ""

function command_exists () {
    command -v $1 >/dev/null 2>&1;
}

if ! command_exists pandoc; then
    echo "Error: Please install pandoc. Cannot continue"
    exit;
fi

echo ""



generate_docx() {
    pandoc -s -f gfm --reference-doc=../templates/template.docx --toc  --columns 10000 -t docx  -o "../OWASP-Top10-Proactive-Controls-2018-$1.docx" *.md
}

generate_html() {
    pandoc -s -f gfm -t html5 --metadata=title:"OWASP Top 10 Proactive Controls 2018 " -o "../OWASP-Top10-Proactive-Controls-2018-$1.html" *.md
}

generate() {
    echo -n "Generating OWASP Top 10 Proactive Controls ($1)..."
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

 
echo "Generated OWASP Top 10 Proactive Control"

