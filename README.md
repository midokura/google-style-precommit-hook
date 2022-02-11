A handy [pre-commit](http://pre-commit.com/) hook which will run Google's java
code style formatter for you on your code!

Grab the latest Google Autoformatter version here: [Google Autoformatter](https://github.com/google/google-java-format/releases)

Usage:

```
repos:
  - repo: https://github.com/midokura/google-style-precommit-hook
    rev: v2.0.0
    hooks:
        - id: google-style-java
        args: [-v 1.14.0]
```

*Note*: this file stores Google's code style formatter jar in a `.cache/`
directory so that it doesn't need to be re-downloaded each time.  You will
probably want to add `.cache/` to the `.gitignore` file of the project which
uses this hook.
