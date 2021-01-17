# Flycheck-pony

Flycheck-pony is an Emacs mode that supports on the fly syntax checking of
[Pony](http://www.ponylang.org/) files. If you are an Emacs user and aren't
familiar with [Flycheck](http://www.flycheck.org/en/latest/), we strongly
suggest you check it out as it will change your development experience.

## Installation

This package can be obtain from
[MELPA](http://melpa.org/#/flycheck-pony) or
[MELPA Stable](http://stable.melpa.org/#/flycheck-pony). The `master`
branch is continuously deployed to MELPA, and released versions are
deployed to MELPA Stable.

```emacs
M-x package-install [RET] flycheck-pony [RET]
```

Then somewhere in your Emacs configuration, call:

```elisp
(use-package flycheck-pony)
```

## Configuration

At the moment, Emacs lockfiles cause errors with the Pony compiler, until this
is fixed, be sure to add the following to your configuration:

```elisp
;; turn off lockfiles as it causes errors with ponyc at the moment
(setq create-lockfiles nil)
```

### Pick your syntax checker

Flycheck-pony supports 2 different syntax checkers. Most people will probably
want to use the default `pony` syntax checker. It works by calling
`ponyc -rexpr` on your source.

If you are using [pony-stable](https://github.com/jemc/pony-stable) to do
dependency management, then the `pony` syntax checker won't work for you as it
won't be able to find all your dependencies. For this eventuality, we provide a
`pony-stable` syntax checker that works by running `stable env ponyc -rexpr`.
Note that the `pony-stable` syntax checker won't update your dependencies for
you as they change. For this, you will need to use the actual `pony-stable`
command `stable fetch`. The `pony-stable` syntax checker is merely to allow you
to do syntax checking for users of the `pony-stable` dependency tool.

You can use the `flycheck-select-checker` function to switch between the two
different Pony syntax checkers. By default, `pony-stable` will be used if the
corresponding `stable` command is installed on your machine.

## Attribution

Big thanks to Richard M. Loveland who did the first version of flycheck-pony.
We wouldn't be where we are now without your initial work Richard!
