package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"regexp"
)

func main() {
	fmt.Println("Server is listening...")

	// Bind any incoming connections to call the function HandleRequest.
	http.HandleFunc("/", HandleRequest)

	// Start listening for traffic on port 9050.
	err := http.ListenAndServe(":9050", nil)
	if err != nil {
		log.Panicln("Server failed starting. Error: %s", err)
	}

}

func HandleRequest(w http.ResponseWriter, r *http.Request) {
	log.Println("Incoming Request:", r.Method)

	// Read the body of the request.
	byteData, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Println("There was an error: " + err.Error())
	}

	// Convert the incoming bytes into a string.
	stringData := string(byteData)
	log.Println("Data is: " + stringData)

	// Replace all spaces with lines using regex.
	var re = regexp.MustCompile(`[ ]`)
	s := re.ReplaceAllString(stringData, `|`)

	log.Println("Output Data is: " + s)

	// Write the result using a ResponseWriter.
	writer := w
	marshalled, _ := json.Marshal(s)
	writer.Header().Add("Content-Type", "application/json")
	writer.WriteHeader(200)
	writer.Write(marshalled)
}
