package main

import (
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

// returns 0 when workday
func isWorkingDay(theDate time.Time) (string, int) {
	// check date for weekend or working day
	i := 0
	dow := theDate.Weekday()
	dow_num := int(dow)

	//log.Println("DEBUG: " + strconv.Itoa(dow_num))

	if (dow_num == 6) || (dow_num == 0) {
		i = 1
	} else {
		i = 0
	}
	return dow.String(), i
}

// returns 0 when holiday, else 1
func isHoliday(theDate string, csv string) int {
	// check if date is a holoday:
	f, err := os.ReadFile(csv)
	CheckErr(err) // Splits on newlines by default.
	rtc := 1
	//log.Println("File " + csv + " opened.")
	// fmt.Println(f)
	// os.Stdout.Write(f)
	read_lines := strings.Split(string(f), "\n")
	for _, line := range read_lines {
		// fmt.Println(line) //print the content line by line
		// log.Println("Checking " + theDate + " against: " + line)
		if strings.Contains(line, theDate) {
			log.Println("Found: " + line)
			rtc = 0
		}
	}
	return rtc
}

func main() {
	if len(os.Args) <= 1 {
		log.Fatalln("Missing arguments.")
		os.Exit(1)
	}

	dateStr := os.Args[1]
	plus := os.Args[2]
	p, _ := strconv.Atoi(plus)
	dataFileName := "holiday.csv"
	layout := "2006-01-02"

	d, err := time.Parse(layout, dateStr)
	CheckErr(err)

	log.Println("Startdate: " + d.Format(layout))
	targetDate := d.AddDate(0, 0, p)
	log.Println("Calculated: " + targetDate.Format(layout))

	wochentag, _ := isWorkingDay(targetDate)
	log.Println("Is a: " + wochentag)

	checkDateStr := targetDate.Format(layout)
	isHoliday(checkDateStr, dataFileName)
}
