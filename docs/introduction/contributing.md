# How to Contribute?

Please don’t hesitate to contact the OWASP Proactive Control project with your questions, comments, and ideas, either publicly by adding issues or providing commits on [our github page](https://github.com/OWASP/www-project-proactive-controls).

When you check [our open issues on github](https://github.com/OWASP/www-project-proactive-controls/issues), you can see that some issues are tagged with `help wanted` or `good first issue`. Choose these if you want to help out the project!

## How to test the OWASP Proactive Control website locally?

If you can run python, you can locally run the OWASP Proactive Control website locally. We recommend this to test your changes before pushing them to github.

To do this, we will use `venv` to create a local python environment to install the needed `mkdocs` package.

```shell
# creates and activates a new python environment in a new `venv` directory
$ python3 -m venv venv
$ source venv/bin/activate

# install the mkdocs package
$ pip install mkdocs-material

# switch into your checked-out OWASP Proactive Controls directory
$ cd owasp-proactive-controls

# run the local webserver
$ mkdocs server

# now you can point your browser to http://localhost:8000 and check
# how your changes will look like
```