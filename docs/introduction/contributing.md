# How to Contribute?

Please don’t hesitate to contact the OWASP Proactive Control project with your questions, comments, and ideas.

You can contact maintainers directly, use our [project-top10-proactive-controls OWASP slack channel](https://owasp.slack.com/archives/C07KNHZAN1H), or visit [our github page](https://github.com/OWASP/www-project-proactive-controls).

You find the source code of the current version of the OWASP Top 10 Proactive Controls in the `docs/` directory within the git repository. Please focus upon contributions for the current version, not archived versions within `docs/archive`.

When you check [our open issues on github](https://github.com/OWASP/www-project-proactive-controls/issues), you can see that some issues are tagged with `help wanted` or `good first issue`. Choose these if you want to help out the project!

## Translations

Starting with version `v4` in 2024, we don't accept inclusion of translations into the OWASP Top 10 Proactive Controls directly and are only providing the English version.

We do encourage translators to create translated versions and host them themselves and will link to those external sites/documents if notified about them.

## How to test the OWASP Proactive Control website locally?

If you can run python, you can locally run the OWASP Proactive Control website locally. We recommend this to test your changes before pushing them to github.

To do this, we will use `venv` to create a local python environment to install the needed `mkdocs` package.

```shell
# creates and activates a new python environment in a new `venv` directory
$ python3 -m venv venv
$ source venv/bin/activate

# install the mkdocs package
$ pip install mkdocs-material mkdocs-redirects

# switch into your checked-out OWASP Proactive Controls directory
$ cd owasp-proactive-controls

# run the local webserver
$ mkdocs serve

# now you can point your browser to http://localhost:8000 and check
# how your changes will look like
```

## A Big Thank you to our Contributors!

This document would not have been possible without our contributors for which we are grateful. The 2024 Version makes listing all contributors hard as we were using an untracked google shared doc in the beginning. We hope that we haven't missed someone and are very gracious for:

[Andreas Happe](https://github.com/andreashappe), [Jim Manico](https://github.com/jmanico), [Katy Anton](https://github.com/katyanton), Chris Romeo, Jasmin Mair, Abdessamad Temmar, Carl Sampson, Eyal Estrin, [Israel Chorzevski](https://github.com/sro-co-il), [Zoe Braiterman](https://github.com/zbraiterman), [Timo Pagel](https://github.com/wurstbrot), [ThreeHoolagins](https://github.com/ThreeHoolagins), [Wallace Soares](https://github.com/soareswallace), [Aref Shaheed](https://github.com/aref2008), [ThunderSon](https://github.com/ThunderSon), [Marcus Fenstrom](https://github.com/MFernstrom), [Datz](https://github.com/DatzAtWork), [Josh Grossman](https://github.com/tghosth), [Tomas Coiro](https://github.com/CoiroTomas), [Dr. Pi3ch](https://github.com/pi3ch), [Ishaq Mohammed](https://github.com/security-prince), [Richard Tweed](https://github.com/RichardoC), [Derek Gary](https://github.com/DerekGary), [Starr Brown](https://github.com/mamicidal), [Thomas](https://github.com/tthn0), [Christian Capellan](https://github.com/ccapellan), [Adriaan Joubert](https://github.com/adriaanjoubert), [Kenneth Kron](https://github.com/biofool), [Jaskirat Singh](https://github.com/Jassi2004), [Lukas Weichselbaum](https://github.com/lweichselbaum), [joonakokkola](https://github.com/joonakokkola), [cowsecurity](https://github.com/cowsecurity)

### Contributors to previous Top 10 Proactive Control versions

Another round of applause to all the contributors of previous OWASP Top 10 Proactive Controls lists:

Massimiliano Graziani, [Taras Ivashchenko](mailto:taras.ivaschenko@owasp.org), Jay Zudilin, [Danny Harris](mailto:danny.harris@owasp.org), Hiroaki Kuramochi, Hiroshi Fujimoto, Hidenori Nagai, [Riotaro OKADA](mailto:riotaro@owasp.org), Robert Dracea, Koichiro Watanabe, Tony Hsu Hsiang Chih, [Cyrille Grandval](mailto:cyrille.grandval@owasp.org), [Frédéric Baillon](mailto:fbaillon@darkmira.com), [Danny Harris](mailto:danny.harris@owasp.org), Stephen de Vries, Andrew Van Der Stock, Gaz Heyes, Colin Watson, Jason Coleman, Cassio Goldschmidt, Dan Anderson, David Cybuck, Dave Ferguson, Osama Elnaggar, Rick Mitchell
