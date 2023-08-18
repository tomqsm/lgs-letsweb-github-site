package main

import (
	"github.com/gofiber/fiber/v2"
	"log"
	"os"
	"os/signal"
	"time"
)

func main() {

	app := fiber.New(fiber.Config{
		ServerHeader: "fiber",
	})

	app.Static("/", "./public", fiber.Static{
		Compress:      true,
		Browse:        false,
		Download:      false,
		CacheDuration: 10 * time.Second,
		MaxAge:        3600,
	})

	// Start the server in a separate goroutine
	go func() {
		err := app.Listen(":3000")
		if err != nil {
			log.Fatal(err)
		}
	}()

	// Create a channel to listen for OS signals
	sigChan := make(chan os.Signal, 1)
	signal.Notify(sigChan, os.Interrupt, os.Kill)

	// Block until a signal is received
	<-sigChan

	// Gracefully shutdown the server
	err := app.Shutdown()
	if err != nil {
		log.Fatal(err)
	}

	log.Println("Server gracefully shutdown")

}
