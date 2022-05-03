package main

import (
	"fmt"
	"net/http"

	"github.com/spf13/cobra"
)

func main() {
	cmd := NewDefaultCommand()
	err := cmd.Execute()
	if err != nil {
		fmt.Errorf("command failed %v\n", err)
	}
}

func NewDefaultCommand() *cobra.Command {
	return &cobra.Command{
		Use: "helloword",
		Run: func(cmd *cobra.Command, args []string) {
			http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
				w.Write([]byte("Hello World"))
			})

			fmt.Printf("listen ::5000")
			http.ListenAndServe(":5000", nil)
		},
	}
}
