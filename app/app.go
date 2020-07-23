package main

import (
	"fmt"
	"net/http"
)

func sayHello(w http.ResponseWriter, r *http.Request) {
	message := fmt.Sprintf("Hello %s, :-) Diogo!", r.RemoteAddr)
	w.Write([]byte(message))
}

func main() {
	fmt.Println("welcome to the app")
	http.HandleFunc("/", sayHello)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}
