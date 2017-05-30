# Git Scripts
By [Jason Yao](https://github.com/JasonYao/)

## Description
This directory contains automated scripts
to be run pre/post git commands.

## Setup
### Automatic formatting before every commit:
```sh
# Run from the root of the source code directory
ln -s $(pwd)/git/pre-commit.sh $(pwd)/.git/hooks/pre-commit
```

### Automatic test running before every push:
```sh
# Run from the root of the source code directory
ln -s $(pwd)/git/pre-push.sh $(pwd)/.git/hooks/pre-push
```
