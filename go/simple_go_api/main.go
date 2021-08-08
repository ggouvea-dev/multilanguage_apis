package main

import (
	"log"
	"net/http"
	"simple_go_api/controller"

	_ "github.com/mattn/go-sqlite3"
)

func main() {
	log.Fatal(http.ListenAndServe(":8000", controller.BuildRouter()))
}