# getNextWorkingday

README: lookup the next workingday after adding a given (positiv) offset (days), based on an holiday-calender-file 

## Topic:

This code takes a date, adds an offset and calculates if the result 
is a workingday **and** not a holiday.
If not, it hopefully returns the next available workingday.


## CONFIG

Version >= 0.2 needs a configfile , for the location of the holiday-file:

* Name of the configfile: `$HOME/.getNextWorkingday.toml`

* Example-Content:

~~~sh
[default]
HOLIDAY_PATH = "sBATCH_GLOBALTOOLS"
HOLIDAY_FILE = "AT-holiday.dat"
~~~~

**HOLIDAY_PATH has to be an exported variable!**


## Usage:

~~~sh
getNextWorkingday YYYY-MM-DD offset
~~~

## Examples, with austrian holiday-calendar

~~~sh
getNextWorkingday 2025-08-10 5
Monday,2025-08-18
~~~


~~~
$>  getNextWorkingday 2025-10-01 10
Monday,2025-10-13

$>  getNextWorkingday 2025-05-26 3
Friday, 2025-05-30

$>  getNextWorkingday 2025-05-26 2
Wednesday, 2025-05-28

$>  getNextWorkingday 2025-05-26 1
Tuesday, 2025-05-27

$>  getNextWorkingday 2025-05-26 0
Monday, 2025-05-26

$>  getNextWorkingday 2025-06-01 6
Tuesday, 2025-06-10

$>  getNextWorkingday 2025-12-24 1
Monday,2025-12-29

$>  getNextWorkingday 2025-12-31 1
Friday,2026-01-02
~~~


## Install

Therefor you may use *Make.sh* . It runs go build, mv it to `$HOME/go/bin` and sets the PATH to HOME/go/bin/ .

