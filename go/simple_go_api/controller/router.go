package controller

import (
	"github.com/gorilla/mux"
)

func BuildRouter() *mux.Router {
	Router := mux.NewRouter()
	Router.HandleFunc("/", GetAllProducts).Methods("GET")
	return Router
}
