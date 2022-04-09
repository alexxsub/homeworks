package main

import (
	"fmt"
	_ "math"
	"os"
	"os/exec"
	_ "os/exec"
	"strconv"
	"strings"
	"time"
)

func main() {
	out4, err4 := exec.Command("cmd", "/C", "hostname").Output()
	if err4 != nil {
		fmt.Printf("Error. Can't get hostname.")
		os.Exit(3)
	}
	host := string(out4)
	for i := 0; i < 10; i++ {
		t := time.Now()
		nsec := t.UnixNano()
		out, err := exec.Command("cmd", "/C", "wmic ComputerSystem get TotalPhysicalMemory").Output()
		memall := string(out)
		memall = strings.Fields(memall)[1]
		out2, err := exec.Command("cmd", "/C", "wmic OS get FreePhysicalMemory").Output()
		memfree := string(out2)
		memfree = strings.Fields(memfree)[1]
		memallint, _ := strconv.Atoi(memall)
		memfreeint, _ := strconv.Atoi(memfree)
		a1 := memallint - (memfreeint * 1024)
		a2 := strconv.Itoa(a1)
		a2 = a2[0 : len(a2)-3]
		out3, err := exec.Command("cmd", "/C", "wmic cpu get loadpercentage").Output()
		if err != nil {
			i--
		}
		cpu := string(out3)
		cpu = strings.Fields(cpu)[1]
		fmt.Println("cpu&ram, "+"host="+host[:len(host)-2], "cpu_usage_percent="+cpu+" RAM_usage_Mbytes="+a2, nsec)
		pause()
	}
}

func pause() {
	time.Sleep(2 * time.Second)
}
