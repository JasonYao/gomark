# GoMark | A Github Markdown (Common Mark) Parser &amp; Renderer
By [Jason Yao](https://github.com/JasonYao/), [Github](https://github.com/JasonYao/gomark)

## Intro
This is a fully compliant [common mark](http://commonmark.org/) parser and
renderer written in golang.

More than that, this project allows for the local rendering
of markdown files using Github's styling, even when there is
no internet connection.

This allows for the viewing of markdown files before
committing and pushing to Github.

## Examples
TODO insert gif examples of the parser in action.

## Compliance
This current renderer is compliant with the latest
common mark [spec](http://spec.commonmark.org/), which
is currently:

[**0.27** (2016-11-18)](http://spec.commonmark.org/0.27/)

This library will be updated when common mark updates formally
to its `1.0` release, which should be later this year (2017).

## Features
- Will exactly render markdown files in Github's styling
- Has an offline rendering based on prior cached responses.
Default styles are provided as a fallback, and are updated
every `x.1.0` minor release (e.g. `0.1.0`, `0.2.0`)
- Server application that will re-render file automatically as
it changes, all without needing a page refresh
- Built in idiomatic [Golang](https://golang.org/)
- Allows for `HTML` file output generation
- Allows for `stdin` and `stdout` reading/writing
(enables command chaining)

## Installation
### MacOS
```sh
brew install gomark
```

### All Other Platforms
```sh
go get -u github.com/JasonYao/gomark
```

## Usage

### Rendering a Markdown file
```sh
gomark SOME_MARKDOWN_FILE.md
```

### Rendering All Markdown Files in a Directory
```sh
gomark SOME_DIRECTORY_WITH_MARKDOWN_FILES
```

### Generate HTML Output
#### Single File Output
```sh
gomark SOME_MARKDOWN_FILE.md -o OUTPUTFILE.html
```
#### Directory Output
```sh
gomark SOME_DIRECTORY_WITH_MARKDOWN_FILES -o OUTPUT_DIRECTORY
```

### Command Chaining with `stdin` & `stdout`
```sh
cat SOME_MARKDOWN_FILE.md | grender -
```

```sh
gomark SOME_MARKDOWN_FILE.md -o - | cat
```

### Seeing the Help Menu
```sh
gomark -h
```

## License
This code is licensed under GNU's GPL v3 license, a copy of which
may be found [here](LICENSE).

