/*
Copyright © 2023 NAME HERE <EMAIL ADDRESS>
*/
package cmd

import (
	"bytes"
	"fmt"
	"os"
	"time"

	"github.com/Chubasic/koobrabot/api"
	"github.com/Chubasic/koobrabot/utils"
	"github.com/spf13/cobra"
	"gopkg.in/telebot.v3"
)

// koobrabotCmd represents the koobrabot command

var TELE_TOKEN,
	TOKEN_VALID = os.LookupEnv("API_TOKEN")

// Init bot
var koobrabotCmd = &cobra.Command{
	Use:     "koobrabot",
	Aliases: []string{"start"},
	Short:   "A brief description of your command",
	Long: `A longer description that spans multiple lines and likely contains examples
and usage of using your command. For example:

Cobra is a CLI library for Go that empowers applications.
This application is a tool to generate the needed files
to quickly create a Cobra application.`,
	Run: func(cmd *cobra.Command, args []string) {

		if TOKEN_VALID {
			//Telegram API connection settings
			conf := telebot.Settings{
				Token:  TELE_TOKEN,
				Poller: &telebot.LongPoller{Timeout: 10 * time.Second},
			}
			koob, err := telebot.NewBot(conf)

			if err != nil {
				utils.ErrorPrint(err.Error())
				return
			}

			koob.Handle("/start", func(c telebot.Context) error {
				return c.Send(fmt.Sprintf("Koobrabot version %s initialized", app_version))
			})
			koob.Handle("/hello", func(c telebot.Context) error {
				return c.Send(fmt.Sprintf("Hello! My name is Koobrabot version %s", app_version))
			})
			koob.Handle("/kitty", func(c telebot.Context) error {
				imageButes, err := api.FetchImage()
				if err != nil {
					return c.Send(err)
				}
				image := &telebot.Photo{File: telebot.FromReader(bytes.NewReader(imageButes))}
				return c.SendAlbum(telebot.Album{image})
			})

			fmt.Printf("Koobrabot %s started", app_version)

			koob.Start()
		} else {
			utils.ErrorPrint("Please check API_TOKEN variable")
		}

	},
}

func init() {
	rootCmd.AddCommand(koobrabotCmd)

	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// koobrabotCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// koobrabotCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}
