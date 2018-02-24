// To parse and unparse this JSON data, add this code to your project and do:
//
//    reddit, err := UnmarshalReddit(bytes)
//    bytes, err = reddit.Marshal()

package main

import "encoding/json"

func UnmarshalReddit(data []byte) (Reddit, error) {
	var r Reddit
	err := json.Unmarshal(data, &r)
	return r, err
}

func (r *Reddit) Marshal() ([]byte, error) {
	return json.Marshal(r)
}

type Reddit struct {
	Message string `json:"message"`
	Error   int64  `json:"error"`  
}
