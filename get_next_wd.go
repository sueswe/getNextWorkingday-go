package main

import (
	"log"
	"os"
	"strconv"
	"time"
)

func CheckErr(e error) {
	if e != nil {
		log.Fatalln(e)
	}
}

func workingDay(theDate time.Time) (string, int) {
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

func main() {
	dateStr := os.Args[1]
	plus := os.Args[2]
	p, _ := strconv.Atoi(plus)

	layout := "2006-01-02"
	d, err := time.Parse(layout, dateStr)
	CheckErr(err)

	n := d.AddDate(0, 0, p)
	log.Println(n)

	wochentag, _ := workingDay(d)
	log.Println(wochentag)
}
