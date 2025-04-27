package main

import (
	"fmt"
	"log"
	"os"
	"strconv"
	"strings"
	"time"
)

func CheckErr(e error) {
	if e != nil {
		log.Fatalln(e)
	}
}

var REV = "DEV"

func usage() {
	fmt.Println("Version: " + REV)
	fmt.Println("\nUsage: \n  ./getNextWorkingday Date(YYYY-MM-DD) Offset(N)")
	fmt.Println("")
}

// returns DayOfWeek and zero(is a wd) or one(is not a wd)
func isWorkingDay(theDate string) (string, int) {
	d, err := time.Parse(time.DateOnly, theDate)
	CheckErr(err)
	i := 0
	dow := d.Weekday()
	dow_num := int(dow)

	if (dow_num == 6) || (dow_num == 0) {
		i = 1
	} else {
		i = 0
	}
	return dow.String(), i
}

// returns 0 when holiday, else 1
func isHoliday(theDate string, csv string) int {
	f, err := os.ReadFile(csv)
	CheckErr(err)
	rtc := 1
	read_lines := strings.Split(string(f), "\n")
	for _, line := range read_lines {
		if strings.Contains(line, theDate) {
			rtc = 0
		}
	}
	return rtc
}

// returns the next working day(string)
func nextWorkingDay(csv string, datum string) {
	// fmt.Println("")
	// log.Println("Calling recursion with: " + datum)
	dow, is_wd := isWorkingDay(datum)
	is_h := isHoliday(datum, csv)

	if (is_wd == 0) && (is_h == 1) {
		// log.Println("Workday and not holiday: " + datum)
		fmt.Println(dow + ", " + datum)
		// FIXME: /get_next_wd.go:80:1: missing return
		// return datum
	} else {
		// log.Print("ELSE: iterating ...")
		// parse:
		p_d, err := time.Parse(time.DateOnly, datum)
		CheckErr(err)
		// add:
		pplus := p_d.AddDate(0, 0, 1)
		// format+string
		new_date := pplus.Format(time.DateOnly)
		nextWorkingDay(csv, new_date)
	}
	//return datum
}

func main() {
	if len(os.Args) <= 1 {
		usage()
		log.Fatalln("Missing arguments.")
		os.Exit(1)
	}

	dateStr := os.Args[1]
	plus := os.Args[2]
	p, _ := strconv.Atoi(plus)
	dataFileName := "holiday.csv"

	// make a time-thingy and parse it:
	d, err := time.Parse(time.DateOnly, dateStr)
	CheckErr(err)

	// adding offset:
	targetDate := d.AddDate(0, 0, p)
	// log.Println("Startdate: " + d.Format(time.DateOnly) + ", Offset: " + strconv.Itoa(p) + " = " + targetDate.Format(time.DateOnly))

	checkDateStr := targetDate.Format(time.DateOnly)

	// wochentag, _ := isWorkingDay(checkDateStr)
	// log.Println("Is a: " + wochentag)
	// erg := isHoliday(checkDateStr, dataFileName)
	// log.Println(erg)

	//erg := nextWorkingDay(dataFileName, checkDateStr)
	//log.Println("RETURNED_MAIN: " + erg)

	nextWorkingDay(dataFileName, checkDateStr)
}
