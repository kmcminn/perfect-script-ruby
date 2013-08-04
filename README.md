Perfect Script (ruby)
===================
a template for the perfect ruby script.

## Usage
This template is intended to stand alone as a single file that can be required and included as well as copy'pasted. Use it to make whatever magic you will. In case you aren't copy pasting the pattern for a ruby way to reuse/extend this is:

1. Make a module with the good reuseable parts of your script broken up into methods in the module
2. Make a class the inherits from Script
3. include your new module
4. Add your optparse options inside your class constructor
5. Setup the main! function however you want to do the magic

```ruby
$:.unshift SCRIPT_DIR
module ListFiles
  def list_files!(dir)
    out = `ls -al #{dir}`
    out
  end
end

class MyScript < Script
  include ListFiles

  def initialize
    super
    @optparse.define('-l LIST', '--list LIST', 'List some files') do |list|
      @options.list = list
    end
  end
end

script = MyScript.new
script.optparse.parse! ARGV
script.list_files!(script.options.list) if script.options.list

```

## About
My hunt for the perfect script. See the [commentary](https://github.com/kmcminn/perfect-script-ruby/blob/master/COMMENTARY.md) if you're interetsed in my (verbose) notes. enjoy!

Please open an issue if you have any ideas on how to improve it! 

Goals:

* self documenting
* no obtuse dependencies
* easily reusable:
   * via copy/paste
   * via modules/inheritance/etc
* idiomatic 
* usuable as a single file
* usable by a junior sysadmin and senior software engineer
