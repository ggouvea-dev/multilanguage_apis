package service

import (
	"database/sql"
	_ "github.com/mattn/go-sqlite3"

	util "simple_go_api/util"
)

type Product struct {
	ID int `json:"id"`
	Descricao string `json:"descricao"`
	Gtin string `json:"gtin"`
	Preco *Preco `json:"preco"`
}

type Preco struct {
	ID int `json:"id"`
	Preco float32 `json:"preco"`
}

func FindAllProducts() []Product {
	db, err := sql.Open("sqlite3", "./foo.db")
	util.CheckErr(err)

	rows, err := db.Query("SELECT * FROM PRODUTO")
	util.CheckErr(err)

	ProdutoSlice := make([]Product, 0)

	var id int
	var descricao string
	var gtin string

	for rows.Next() {
		err := rows.Scan(&id, &descricao, &gtin)
		util.CheckErr(err)
		ProdutoSlice = append(ProdutoSlice, Product{ID: id, Descricao: descricao, Gtin: gtin})
	}

	rows.Close()
	db.Close()

	return ProdutoSlice
}
