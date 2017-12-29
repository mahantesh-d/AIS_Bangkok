package main

import (
	"fmt"
	"database/sql"
	"log"
	_ "github.com/lib/pq"
	"time"
)

const (
	host = "10.138.32.212"
	user = "serveradm"
	password = "R3dh@t!@#"
	port = 30001
	dbname = "testschema2"

)


func main()  {

	dbinfo := fmt.Sprintf("host=%s port=%d user=%s password=%s dbname=%s sslmode=disable", host, port, user, password, dbname)
	db, err := sql.Open("postgres", dbinfo)
	if err != nil {
		log.Println("Not connected to the server")
	}
	defer db.Close()

	err = db.Ping()
	if err != nil{
		panic(err)
	}

	fmt.Print("Sucessfully Connected")

	fmt.Println("\nGetting Data")
	//var lastInsertId int
	rows, err := db.Query("SELECT * FROM menu")//.Scan(&lastInsertId)
	if err != nil{
		log.Println("Values not inserted")
	}
	fmt.Println("programCode | MainMenu | MenuName | LinkData | ActiveFlag | CreateBy | CreateDateTime | UpdateBy | UpdateDateTime ")
	for rows.Next()  {
		var program_code_key0 string
		var main_menu_data string
		var menu_name_data string
		var link_data string
		var active_flag_data string
		var create_by_data string
		var create_datetime_data time.Time
		var update_by_data string
		var update_datetime_key1 time.Time
		err = rows.Scan(&program_code_key0,
			&main_menu_data,
			&menu_name_data,
			&link_data,
			&active_flag_data,
			&create_by_data,
			&create_datetime_data,
			&update_by_data,
			&update_datetime_key1)
		if err != nil{
			log.Println("failed query")
		}
		fmt.Printf("%3v | %8v | %6v | %3v | %3v | %3v | %3v | %3v | %3v | \n", program_code_key0,
			main_menu_data,
			menu_name_data,
			link_data,
			active_flag_data,
			create_by_data,
			create_datetime_data,
			update_by_data,
			update_datetime_key1)

	}
	//fmt.Println("Last inserted id: ", lastInsertId)
}
