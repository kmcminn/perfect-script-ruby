Perfect Script Notes
===================

## Intro
I'm not quite sure what to say if you're reading this page. Comforting to know that I might not be the only person obsessed with perfect and right in the software and systems world. It might seem like a better place to document in the script, but if the script were Tomdoc'd it would break one of my rules and clutter the repo, so this readme will have to do.

## Line by Line
1. This is the corect shebang for dynamic languages usually. If you try to pin a ruby version or full path you'll break some of your tools and whatnot.
2. Ruby 1.9 general practice to use utf8 on all source files
3. 
4. Short scriptname and description for people not looking at this in a git repo
5. 
6. Lead off with constants. Decided to cache the name and directory of the script as sometimes this can change during runtime
7. ""
8. 
9. prepend the scripts directory to the $LOAD_PATH if its not there, ruby 1.9+
10. 
11. standard argument parsing library for ruby
12. standard logging library for ruby
13. promiscous hash library for options hash. decided that a javascript style object hash was a good implementation. taken from OptionParser API doc
14. 
15. module layout for base methods seems about right
16. setup basic optparse options that everyone sees in almost all command line tools
17. 
18. 
19. help option
20. 
21. 
22. verbose option
23. 
24. 
25. 
26. 
27. 
28. return the optionparser object
29. 
30. 
31. method for simple logging setup
32. 
33. 
34. 
35. return the logging object
36. 
37. 
38. usage method to display the help and exit. if someone really needs a custom one, they can just override it
39. 
40. puts @optparse dumps usage, this instance var gets set from the MyScript constructor
41. 
42. 
43. 
44. 
45. an opionated script class that we can inherit from using reasonable logging, optparse and options attributes
46. 
47. make these attributes freely available
48. 
49. 
50. setup the logging
51. our options hash which will contain the booleans for switches or whatever we pass to a option that stores something
52. invoke setup_basic_options from ScriptBase
53. 
54. 
55. 
56. 
57. our examle module and example method to list some files. Spent alot of time thinking about the right way to do this in ruby and using class inheritance seemed too clunky for scripts, but you could contend that ruby modules aren't the same as python modules and thus more confusing. I think most ruby hackers would agree that this way of sharing methods is straight forward enough to be reusable if you want to get this method into a script with require and include, or just to copy paste it.
58. 
59. 
60. 
61. 
62. 
63. 
64. This script's class. inherit from Script, include the modules that have the methods you've written and go.
65. get the list_files! method into this scope
66. 
67. constructor
68. invoke the constructor on the superclass
69. add an option so that we can run the list_files! method via an external argument
70. set the passed in path to the options hash
71. 
72. 
73. 
74. 
75. 
76. see alot of rubyists use run! but in examining this I think this is wrong. we've been using main() as an entry point for several languages and its a fairly common practice at this point. As I'm writing this I realize the ruby way would be to make this method main! brb. done.
77. instantiate MyScript
78. 
79. show something friendly if theres no arguments (needed in python scripts as well)
80. invoke parse! on arguments
81. 
82. sample log.debug
83. sample log.debug
84. 
85. invoke our method if an argument isn't nil
86. 
87. 
88. this could be more readable with PROGRAM_NAME but everyone is used to $0 by now. also everyone is used to scripts getting their entry point invoked at the bottom thanks to python and probably some other languages.
89. 
90. 
91. 
92. 
93. 
94. 
95. 
96. 
97. 
98. 
99. 
