# parser-las-cpp
NAME
----
parselas - LAS parser in C++

SYNOPSIS
--------

Usage: parseLas -f <las_filename> [-p <sections_to_print>]    
     
Sections to print:    
Specify which sections to display by listing the letters following '-p'    

|Letter  | Section  |
|--------|----------|
|v       | Version Information Section  |
|w       | Well Information Section  |
|p       | Log Parameter Section  |
|d       | Log Definition Section  |
|e       | Drilling Definition Section  |
|a       | Drilling Data Section  |


EXAMPLES
--------

* Display help   
`parseLas -h`

* Display all sections of a given LAS file    
`parseLas -f example.las`

* Display only the well information section of a given LAS file    
`parseLas -f example.las -p w`

* Display the version and well information sections of a given LAS file    
`parseLas -f example.las -p vw`

DESCRIPTION
-----------
Caution: This is beta software!

basic LAS (Log Ascii Standard) well-log parser in c++

LAS file format versions are written and maintained by   
the Canadian Well Logging Society at    
http://www.cwls.org/las/


`parseLas` partially reads a las formatted file. 

The parser currently parses and displays the following sections:
- Version
- Well-Information
- Log-Parameter

Todo:
- Additional sections to be added in future iterations.
- Re-organize code to remove functional duplication.
- Save to a database.
- Add JSON output.


OPTIONS
-------

`-f`
  LAS file to parse

COMPILE AND RUN
---------------

```bash
cd parse-las-cpp/src  
make clean
make  
./parseLas -f example.las  
```

BUGS
----

- Functionality is very basic. 


COPYRIGHT
------

Copyright (c) 2019 DC Slagel

