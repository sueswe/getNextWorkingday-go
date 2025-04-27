# getNextWorkingday

README: looking for the next workingday after adding a given (positiv) offset (days)

## Topic:

This code takes a date, adds an offset and calculates if the result 
is a workingday **and** not a holiday.
If not, it hopefully returns the next available workingday.

**TODO:**

Currently it uses a holiday.csv . Future versions should use a 
holiday-API and a country-parameter, with a config-file.


## Usage:

~~~sh
getNextWorkingday YYYY-MM-DD offset
~~~

## Example:

~~~sh
getNextWorkingday 2025-08-10 5
~~~

**Results** , with austrian holiday-calendar:

~~~

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-05-26 3
Friday, 2025-05-30

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-05-26 2
Wednesday, 2025-05-28

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-05-26 1
Tuesday, 2025-05-27

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-05-26 0
Monday, 2025-05-26

 [sueswe@X1Carbon-6th:~]└2 2 $ getNextWorkingday 2025-06-01 1
Monday, 2025-06-02

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-06-01 2
Tuesday, 2025-06-03

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-06-01 3
Wednesday, 2025-06-04

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-06-01 4
Thursday, 2025-06-05

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-06-01 5
Friday, 2025-06-06

 [sueswe@X1Carbon-6th:~]└2 $ getNextWorkingday 2025-06-01 6
Tuesday, 2025-06-10

~~~


## Install

Therefor you may use *Make.sh* . It runs a go build and go install and sets the PATH to HOME/go/bin/ .

