package main

import (
	"fmt"
	"os"
	"os/exec"
	"strconv"
	"strings"
	"time"
)

func main() {
	outn, err := exec.Command("hostname").Output()
	if err != nil {
		fmt.Printf("can't get hostname")
		os.Exit(3)
	}
	for i := 0; i < 15; i++ {
		host := string(outn)
		out, err := exec.Command("free").Output()
		ram := string(out)
		ram = strings.Fields(ram)[8]
		out2, err := exec.Command("uptime").Output()

		cpu := string(out2)
		cpul := strings.Split(cpu, " ")
		cpu = cpul[12]
		cpu = cpu[0 : len(cpu)-4]
		t := time.Now()
		nsec := t.UnixNano()
		nsec2 := strconv.Itoa(int(nsec))
		if err != nil {
			i--
		}
		fmt.Println("cpu&ram, "+"host="+host[:len(host)-1], "cpu_usage_percent="+cpu+" RAM_usage_Mbytes="+ram, nsec2+"0")
		pause()
	}
}

func pause() {
	time.Sleep(2 * time.Second)
}

