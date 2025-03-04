package main

import (
	"sync"
	"time"
)

var m = sync.Map{}
var lock = sync.RWMutex{}

func main() {
	go read()
	time.Sleep(1 * time.Second)
	go write()
	time.Sleep(1 * time.Minute)
}

func Read() {
	for {
		read()
	}
}

func Write() {
	for {
		write()
	}
}

func read() {
	// lock.RLock()
	// defer lock.RUnlock()
	_, _ = m.Load("a")
}

func write() {
	// lock.Lock()
	// defer lock.Unlock()
	m.Store("b", 2)
}
