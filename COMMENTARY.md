Perfect Script Notes
===================

## Intro
I'm not quite sure what to say if you're reading this page. Comforting to know there are others obsessed with perfect or right in the software and systems world. I think. It might seem like a better place to document in the script or to use Tomdoc but then it wouldn't be the perfect template that someone could make their own imo. 

## Line by Line
1. This is the corect shebang for dynamic languages usually. If you try to pin a ruby version or full path you'll break some of your tools and whatnot.
2. Ruby 1.9 general practice to use utf8 on all source files
4. Short scriptname and description for people not looking at this in a git repo
6. Lead off with constants. Decided to cache the name and directory of the script as sometimes this can change during runtime
7. ""
9. prepend the scripts directory to the $LOAD_PATH if its not there, ruby 1.9+
11. standard argument parsing library for ruby
12. standard logging library for ruby
13. promiscous hash library for options hash. decided that a javascript style object hash was a good implementation. taken from OptionParser API doc
15. module layout for base methods seems about right
16. setup basic optparse options that everyone sees in almost all command line tools
19. help option
22. verbose option
23. ah promiscuous ruby hashes
27. return the optionparser object
30. method for simple logging setup
34. return the logging object
37. usage method to display the help and exit. if someone really needs a custom one, they can just override it
39. puts @optparse dumps usage, this instance var gets set from the MyScript constructor
44. an opionated script class that we can inherit from using reasonable logging, optparse and options attributes
47. make these attributes freely available
50. setup the logging
51. our options hash which will contain the values and booleans after parsing used as the backbone for the logic used in main!()
52. invoke setup_basic_options from ScriptBase
56. our examle module and example method to list some files. Spent alot of time thinking about the right way to do this in ruby and using class inheritance seemed too clunky for scripts, but you could contend that ruby modules aren't the same as python modules and thus more confusing esp considering the intended audience is broad. I think most ruby hackers would agree that this way of sharing methods is straight forward enough to be reusable if you want to get your custom methods into a script with require and include but is simple enough to grok if you just to copy paste into something simpler.
63. This script's class. inherit from Script, include the modules that have the methods you've written and go.
64. get the ListFiles module, thusly the list_files! method into this scope
66. constructor
67. invoke the constructor on the superclass
68. add an optparse option so that we can run the list_files! method via an external argument
69. set the passed in path on the options hash
74. see rubyists use run! before but in examining this I've come to the conclustion that main! is the right choice. We've been using main() as a program entry point convention for several languages for quite a while now. I don't see an idiomatic ruby convention for main! wins.
75. instantiate MyScript
77. show something friendly if theres no arguments (needed in python scripts as well)
78. invoke parse! on arguments
80. sample log.debug
81. sample log.debug
83. invoke our method if an argument isn't nil
86. this could be more readable with PROGRAM_NAME but everyone is used to $0 by now. also everyone is used to scripts getting their entry point invoked at the bottom due to the python convention. Most everyone in operations has $0 memorized. 
