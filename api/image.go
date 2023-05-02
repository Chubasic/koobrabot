package api

import (
	"fmt"
	"io"
	"net/http"
)

const IMAGE_API = "http://placekitten.com/500/500"

func FetchImage() ([]byte, error) {
	resp, err := http.Get(IMAGE_API)

	if err != nil {
		return nil, fmt.Errorf("Koobra couldn't fetch the image:(")
	}
	defer resp.Body.Close()
	body, err := io.ReadAll(resp.Body)
	return body, nil
}
