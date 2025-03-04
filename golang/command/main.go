package main

import (
	"log"
	"os"
	"os/exec"
)

func main() {
	path, _ := exec.LookPath("ls")
	log.Println(path)

	cmd := exec.Command("sleep", "10")
	cmd.Stdout = os.Stdout
	cmd.Start()
	err := cmd.Wait()
	if err != nil {
		log.Println(err)
		panic(err)
	}
}
