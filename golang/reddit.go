// To parse and unparse this JSON data, add this code to your project and do:
//
//    reddit, err := UnmarshalReddit(bytes)
//    bytes, err = reddit.Marshal()

package main

import "bytes"
import "errors"
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
	Kind string     `json:"kind"`
	Data RedditData `json:"data"`
}

type RedditData struct {
	Modhash  string      `json:"modhash"` 
	Dist     int64       `json:"dist"`    
	Children []Child     `json:"children"`
	After    string      `json:"after"`   
	Before   interface{} `json:"before"`  
}

type Child struct {
	Kind Kind      `json:"kind"`
	Data ChildData `json:"data"`
}

type ChildData struct {
	ApprovedAtUTC              interface{}              `json:"approved_at_utc"`              
	Subreddit                  string                   `json:"subreddit"`                    
	Selftext                   string                   `json:"selftext"`                     
	UserReports                []interface{}            `json:"user_reports"`                 
	Saved                      bool                     `json:"saved"`                        
	ModReasonTitle             interface{}              `json:"mod_reason_title"`             
	Gilded                     int64                    `json:"gilded"`                       
	Clicked                    bool                     `json:"clicked"`                      
	Title                      string                   `json:"title"`                        
	LinkFlairRichtext          []LinkFlairRichtext      `json:"link_flair_richtext"`          
	SubredditNamePrefixed      string                   `json:"subreddit_name_prefixed"`      
	Hidden                     bool                     `json:"hidden"`                       
	Pwls                       int64                    `json:"pwls"`                         
	LinkFlairCSSClass          *string                  `json:"link_flair_css_class"`         
	Downs                      int64                    `json:"downs"`                        
	ThumbnailHeight            *int64                   `json:"thumbnail_height"`             
	ParentWhitelistStatus      WhitelistStatus          `json:"parent_whitelist_status"`      
	HideScore                  bool                     `json:"hide_score"`                   
	Name                       string                   `json:"name"`                         
	Quarantine                 bool                     `json:"quarantine"`                   
	LinkFlairTextColor         LinkFlairTextColor       `json:"link_flair_text_color"`        
	AuthorFlairBackgroundColor *string                  `json:"author_flair_background_color"`
	SubredditType              SubredditType            `json:"subreddit_type"`               
	UPS                        int64                    `json:"ups"`                          
	Domain                     string                   `json:"domain"`                       
	MediaEmbed                 MediaEmbed               `json:"media_embed"`                  
	ThumbnailWidth             *int64                   `json:"thumbnail_width"`              
	AuthorFlairTemplateID      interface{}              `json:"author_flair_template_id"`     
	IsOriginalContent          bool                     `json:"is_original_content"`          
	SecureMedia                interface{}              `json:"secure_media"`                 
	IsRedditMediaDomain        bool                     `json:"is_reddit_media_domain"`       
	IsMeta                     bool                     `json:"is_meta"`                      
	Category                   interface{}              `json:"category"`                     
	SecureMediaEmbed           MediaEmbed               `json:"secure_media_embed"`           
	LinkFlairText              *string                  `json:"link_flair_text"`              
	CanModPost                 bool                     `json:"can_mod_post"`                 
	Score                      int64                    `json:"score"`                        
	ApprovedBy                 interface{}              `json:"approved_by"`                  
	Thumbnail                  string                   `json:"thumbnail"`                    
	Edited                     *Edited                  `json:"edited"`                       
	AuthorFlairCSSClass        *string                  `json:"author_flair_css_class"`       
	AuthorFlairRichtext        []AuthorFlairRichtext    `json:"author_flair_richtext"`        
	PostHint                   *PostHint                `json:"post_hint,omitempty"`          
	ContentCategories          []string                 `json:"content_categories"`           
	IsSelf                     bool                     `json:"is_self"`                      
	ModNote                    interface{}              `json:"mod_note"`                     
	Created                    float64                  `json:"created"`                      
	LinkFlairType              FlairType                `json:"link_flair_type"`              
	Wls                        int64                    `json:"wls"`                          
	BannedBy                   interface{}              `json:"banned_by"`                    
	AuthorFlairType            FlairType                `json:"author_flair_type"`            
	ContestMode                bool                     `json:"contest_mode"`                 
	SelftextHTML               *string                  `json:"selftext_html"`                
	Likes                      interface{}              `json:"likes"`                        
	SuggestedSort              *string                  `json:"suggested_sort"`               
	BannedAtUTC                interface{}              `json:"banned_at_utc"`                
	ViewCount                  interface{}              `json:"view_count"`                   
	Archived                   bool                     `json:"archived"`                     
	NoFollow                   bool                     `json:"no_follow"`                    
	IsCrosspostable            bool                     `json:"is_crosspostable"`             
	Pinned                     bool                     `json:"pinned"`                       
	Over18                     bool                     `json:"over_18"`                      
	Preview                    *Preview                 `json:"preview,omitempty"`            
	MediaOnly                  bool                     `json:"media_only"`                   
	LinkFlairTemplateID        *string                  `json:"link_flair_template_id"`       
	CanGild                    bool                     `json:"can_gild"`                     
	Spoiler                    bool                     `json:"spoiler"`                      
	Locked                     bool                     `json:"locked"`                       
	AuthorFlairText            *string                  `json:"author_flair_text"`            
	Visited                    bool                     `json:"visited"`                      
	NumReports                 interface{}              `json:"num_reports"`                  
	Distinguished              interface{}              `json:"distinguished"`                
	SubredditID                string                   `json:"subreddit_id"`                 
	ModReasonBy                interface{}              `json:"mod_reason_by"`                
	RemovalReason              interface{}              `json:"removal_reason"`               
	LinkFlairBackgroundColor   LinkFlairBackgroundColor `json:"link_flair_background_color"`  
	ID                         string                   `json:"id"`                           
	ReportReasons              interface{}              `json:"report_reasons"`               
	Author                     string                   `json:"author"`                       
	NumCrossposts              int64                    `json:"num_crossposts"`               
	NumComments                int64                    `json:"num_comments"`                 
	SendReplies                bool                     `json:"send_replies"`                 
	ModReports                 []interface{}            `json:"mod_reports"`                  
	AuthorFlairTextColor       *string                  `json:"author_flair_text_color"`      
	Permalink                  string                   `json:"permalink"`                    
	WhitelistStatus            WhitelistStatus          `json:"whitelist_status"`             
	Stickied                   bool                     `json:"stickied"`                     
	URL                        string                   `json:"url"`                          
	SubredditSubscribers       int64                    `json:"subreddit_subscribers"`        
	CreatedUTC                 float64                  `json:"created_utc"`                  
	Media                      interface{}              `json:"media"`                        
	IsVideo                    bool                     `json:"is_video"`                     
}

type AuthorFlairRichtext struct {
	E string `json:"e"`
	T string `json:"t"`
}

type LinkFlairRichtext struct {
	E string  `json:"e"`          
	T *string `json:"t,omitempty"`
	A *string `json:"a,omitempty"`
	U *string `json:"u,omitempty"`
}

type MediaEmbed struct {
}

type Preview struct {
	Images             []ImageElement      `json:"images"`                        
	Enabled            bool                `json:"enabled"`                       
	RedditVideoPreview *RedditVideoPreview `json:"reddit_video_preview,omitempty"`
}

type ImageElement struct {
	Source      Source   `json:"source"`     
	Resolutions []Source `json:"resolutions"`
	Variants    Variants `json:"variants"`   
	ID          string   `json:"id"`         
}

type Source struct {
	URL    string `json:"url"`   
	Width  int64  `json:"width"` 
	Height int64  `json:"height"`
}

type Variants struct {
	GIF *GIF `json:"gif,omitempty"`
	Mp4 *GIF `json:"mp4,omitempty"`
}

type GIF struct {
	Source      Source   `json:"source"`     
	Resolutions []Source `json:"resolutions"`
}

type RedditVideoPreview struct {
	FallbackURL       string `json:"fallback_url"`      
	Height            int64  `json:"height"`            
	Width             int64  `json:"width"`             
	ScrubberMediaURL  string `json:"scrubber_media_url"`
	DashURL           string `json:"dash_url"`          
	Duration          int64  `json:"duration"`          
	HLSURL            string `json:"hls_url"`           
	IsGIF             bool   `json:"is_gif"`            
	TranscodingStatus string `json:"transcoding_status"`
}

type FlairType string
const (
	Richtext FlairType = "richtext"
	Text FlairType = "text"
)

type LinkFlairBackgroundColor string
const (
	Empty LinkFlairBackgroundColor = ""
	Ff4500 LinkFlairBackgroundColor = "#ff4500"
	The6289D1 LinkFlairBackgroundColor = "#6289d1"
)

type LinkFlairTextColor string
const (
	Dark LinkFlairTextColor = "dark"
	Light LinkFlairTextColor = "light"
)

type WhitelistStatus string
const (
	AllAds WhitelistStatus = "all_ads"
	HouseOnly WhitelistStatus = "house_only"
	PromoAll WhitelistStatus = "promo_all"
)

type PostHint string
const (
	Image PostHint = "image"
	Link PostHint = "link"
	Self PostHint = "self"
)

type SubredditType string
const (
	Public SubredditType = "public"
)

type Kind string
const (
	T3 Kind = "t3"
)

type Edited struct {
	Bool   *bool
	Double *float64
}

func (x *Edited) UnmarshalJSON(data []byte) error {
	object, err := unmarshalUnion(data, nil, &x.Double, &x.Bool, nil, false, nil, false, nil, false, nil, false, nil, false)
	if err != nil {
		return err
	}
	if object {
	}
	return nil
}

func (x *Edited) MarshalJSON() ([]byte, error) {
	return marshalUnion(nil, x.Double, x.Bool, nil, false, nil, false, nil, false, nil, false, nil, false)
}

func unmarshalUnion(data []byte, pi **int64, pf **float64, pb **bool, ps **string, haveArray bool, pa interface{}, haveObject bool, pc interface{}, haveMap bool, pm interface{}, haveEnum bool, pe interface{}, nullable bool) (bool, error) {
	if pi != nil {
		*pi = nil
	}
	if pf != nil {
		*pf = nil
	}
	if pb != nil {
		*pb = nil
	}
	if ps != nil {
		*ps = nil
	}

	dec := json.NewDecoder(bytes.NewReader(data))
	dec.UseNumber()
	tok, err := dec.Token()
	if err != nil {
		return false, err
	}

	switch v := tok.(type) {
	case json.Number:
		if pi != nil {
			i, err := v.Int64()
			if err == nil {
				*pi = &i
				return false, nil
			}
		}
		if pf != nil {
			f, err := v.Float64()
			if err == nil {
				*pf = &f
				return false, nil
			}
			return false, errors.New("Unparsable number")
		}
		return false, errors.New("Union does not contain number")
	case float64:
		return false, errors.New("Decoder should not return float64")
	case bool:
		if pb != nil {
			*pb = &v
			return false, nil
		}
		return false, errors.New("Union does not contain bool")
	case string:
		if haveEnum {
			return false, json.Unmarshal(data, pe)
		}
		if ps != nil {
			*ps = &v
			return false, nil
		}
		return false, errors.New("Union does not contain string")
	case nil:
		if nullable {
			return false, nil
		}
		return false, errors.New("Union does not contain null")
	case json.Delim:
		if v == '{' {
			if haveObject {
				return true, json.Unmarshal(data, pc)
			}
			if haveMap {
				return false, json.Unmarshal(data, pm)
			}
			return false, errors.New("Union does not contain object")
		}
		if v == '[' {
			if haveArray {
				return false, json.Unmarshal(data, pa)
			}
			return false, errors.New("Union does not contain array")
		}
		return false, errors.New("Cannot handle delimiter")
	}
	return false, errors.New("Cannot unmarshal union")

}

func marshalUnion(pi *int64, pf *float64, pb *bool, ps *string, haveArray bool, pa interface{}, haveObject bool, pc interface{}, haveMap bool, pm interface{}, haveEnum bool, pe interface{}, nullable bool) ([]byte, error) {
	if pi != nil {
		return json.Marshal(*pi)
	}
	if pf != nil {
		return json.Marshal(*pf)
	}
	if pb != nil {
		return json.Marshal(*pb)
	}
	if ps != nil {
		return json.Marshal(*ps)
	}
	if haveArray {
		return json.Marshal(pa)
	}
	if haveObject {
		return json.Marshal(pc)
	}
	if haveMap {
		return json.Marshal(pm)
	}
	if haveEnum {
		return json.Marshal(pe)
	}
	if nullable {
		return json.Marshal(nil)
	}
	return nil, errors.New("Union must not be null")
}
