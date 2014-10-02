Perfect Script (ruby)
===================
a template for a clean ruby script.

## Notes
* open3 seems like the right way to execute commands and get exitcode and output
* logging is sometimes too much for a script, but decided to showcase it anyway. verbose is nice to have.
* ostruct is ugly, unless you do javascript.
* primary goal of making the meat of a script reusable achieved with wrapping list_files! in a module 
* python gains points due to being able import functions from scripts
* prefer to not use inheritance and a mixin in a simple script. because ruby.
* python style exit(main!) seemed reasonable

## Usage
* copy, paste and get on with it
* require 'script' and include ListFiles, etc
