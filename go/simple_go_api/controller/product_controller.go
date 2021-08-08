package controller

import (
	"encoding/json"
	"net/http"
	"simple_go_api/service"
)


func GetAllProducts(w http.ResponseWriter, r *http.Request) {
	Products := service.FindAllProducts()
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(Products)
}
