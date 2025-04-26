# README: looking for the next working after add a given (positiv) offset

## Topic:

This code takes a date, adds an offset and calculates if the result 
is a workingday **and** not a holiday.
If not, it hopefully returns the next available workingday.

## Usage:

~~~sh
get_next_wd YYYY-MM-DD offset
~~~

## Example:

~~~sh
get_next_wd 2025-08-10 5
~~~

