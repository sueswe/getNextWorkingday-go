# README: looking for the next workingday after adding a given (positiv) offset (days)

## Topic:

This code takes a date, adds an offset and calculates if the result 
is a workingday **and** not a holiday.
If not, it hopefully returns the next available workingday.

## Usage:

~~~sh
getNextWorkingday YYYY-MM-DD offset
~~~

## Example:

~~~sh
getNextWorkingday 2025-08-10 5
~~~

