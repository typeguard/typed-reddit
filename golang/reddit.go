// To parse and unparse this JSON data, add this code to your project and do:
//
//    r, err := UnmarshalReddit(bytes)
//    bytes, err = r.Marshal()

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
	Kind string     `json:"kind"`
	Data RedditData `json:"data"`
}

type RedditData struct {
	After           string      `json:"after"`
	Dist            int64       `json:"dist"`
	Modhash         string      `json:"modhash"`
	WhitelistStatus string      `json:"whitelist_status"`
	Children        []Child     `json:"children"`
	Before          interface{} `json:"before"`
}

type Child struct {
	Kind Kind      `json:"kind"`
	Data ChildData `json:"data"`
}

type ChildData struct {
	Domain                string          `json:"domain"`
	ApprovedAtUTC         interface{}     `json:"approved_at_utc"`
	ModReasonBy           interface{}     `json:"mod_reason_by"`
	BannedBy              interface{}     `json:"banned_by"`
	NumReports            interface{}     `json:"num_reports"`
	SubredditID           string          `json:"subreddit_id"`
	ThumbnailWidth        *int64          `json:"thumbnail_width"`
	Subreddit             string          `json:"subreddit"`
	SelftextHTML          *string         `json:"selftext_html"`
	Selftext              string          `json:"selftext"`
	Likes                 interface{}     `json:"likes"`
	SuggestedSort         *string         `json:"suggested_sort"`
	UserReports           []interface{}   `json:"user_reports"`
	SecureMedia           *Media          `json:"secure_media"`
	IsRedditMediaDomain   bool            `json:"is_reddit_media_domain"`
	LinkFlairText         *string         `json:"link_flair_text"`
	ID                    string          `json:"id"`
	BannedAtUTC           interface{}     `json:"banned_at_utc"`
	ModReasonTitle        interface{}     `json:"mod_reason_title"`
	ViewCount             interface{}     `json:"view_count"`
	Archived              bool            `json:"archived"`
	Clicked               bool            `json:"clicked"`
	MediaEmbed            MediaEmbed      `json:"media_embed"`
	ReportReasons         interface{}     `json:"report_reasons"`
	Author                string          `json:"author"`
	NumCrossposts         int64           `json:"num_crossposts"`
	Saved                 bool            `json:"saved"`
	ModReports            []interface{}   `json:"mod_reports"`
	CanModPost            bool            `json:"can_mod_post"`
	IsCrosspostable       bool            `json:"is_crosspostable"`
	Pinned                bool            `json:"pinned"`
	Score                 int64           `json:"score"`
	ApprovedBy            interface{}     `json:"approved_by"`
	Over18                bool            `json:"over_18"`
	Hidden                bool            `json:"hidden"`
	Preview               Preview         `json:"preview"`
	Thumbnail             string          `json:"thumbnail"`
	Edited                bool            `json:"edited"`
	LinkFlairCSSClass     *string         `json:"link_flair_css_class"`
	AuthorFlairCSSClass   *string         `json:"author_flair_css_class"`
	ContestMode           bool            `json:"contest_mode"`
	Gilded                int64           `json:"gilded"`
	Downs                 int64           `json:"downs"`
	BrandSafe             bool            `json:"brand_safe"`
	SecureMediaEmbed      MediaEmbed      `json:"secure_media_embed"`
	RemovalReason         interface{}     `json:"removal_reason"`
	PostHint              PostHint        `json:"post_hint"`
	AuthorFlairText       *string         `json:"author_flair_text"`
	Stickied              bool            `json:"stickied"`
	CanGild               bool            `json:"can_gild"`
	ThumbnailHeight       *int64          `json:"thumbnail_height"`
	ParentWhitelistStatus WhitelistStatus `json:"parent_whitelist_status"`
	Name                  string          `json:"name"`
	Spoiler               bool            `json:"spoiler"`
	Permalink             string          `json:"permalink"`
	SubredditType         SubredditType   `json:"subreddit_type"`
	Locked                bool            `json:"locked"`
	HideScore             bool            `json:"hide_score"`
	Created               float64         `json:"created"`
	URL                   string          `json:"url"`
	WhitelistStatus       WhitelistStatus `json:"whitelist_status"`
	Quarantine            bool            `json:"quarantine"`
	Title                 string          `json:"title"`
	CreatedUTC            float64         `json:"created_utc"`
	SubredditNamePrefixed string          `json:"subreddit_name_prefixed"`
	UPS                   int64           `json:"ups"`
	Media                 *Media          `json:"media"`
	NumComments           int64           `json:"num_comments"`
	IsSelf                bool            `json:"is_self"`
	Visited               bool            `json:"visited"`
	ModNote               interface{}     `json:"mod_note"`
	IsVideo               bool            `json:"is_video"`
	Distinguished         interface{}     `json:"distinguished"`
}

type Media struct {
	Type   MediaType `json:"type"`
	Oembed Oembed    `json:"oembed"`
}

type Oembed struct {
	ProviderURL     ProviderURL  `json:"provider_url"`
	Description     *string      `json:"description"`
	Title           string       `json:"title"`
	ThumbnailWidth  int64        `json:"thumbnail_width"`
	Height          int64        `json:"height"`
	Width           int64        `json:"width"`
	HTML            string       `json:"html"`
	Version         Version      `json:"version"`
	ProviderName    ProviderName `json:"provider_name"`
	ThumbnailURL    string       `json:"thumbnail_url"`
	Type            OembedType   `json:"type"`
	ThumbnailHeight int64        `json:"thumbnail_height"`
	AuthorName      *string      `json:"author_name"`
	AuthorURL       *string      `json:"author_url"`
}

type MediaEmbed struct {
	Content        *string `json:"content"`
	Width          *int64  `json:"width"`
	Scrolling      *bool   `json:"scrolling"`
	Height         *int64  `json:"height"`
	MediaDomainURL *string `json:"media_domain_url"`
}

type Preview struct {
	Images  []PreviewImage `json:"images"`
	Enabled bool           `json:"enabled"`
}

type PreviewImage struct {
	Source      Resolution   `json:"source"`
	Resolutions []Resolution `json:"resolutions"`
	Variants    Variants     `json:"variants"`
	ID          string       `json:"id"`
}

type Resolution struct {
	URL    string `json:"url"`
	Width  int64  `json:"width"`
	Height int64  `json:"height"`
}

type Variants struct {
	GIF *GIF `json:"gif"`
	Mp4 *GIF `json:"mp4"`
}

type GIF struct {
	Source      Resolution   `json:"source"`
	Resolutions []Resolution `json:"resolutions"`
}

type ProviderName string
const (
	Clippit ProviderName = "Clippit"
	Gfycat ProviderName = "gfycat"
	YouTube ProviderName = "YouTube"
)

type ProviderURL string
const (
	HTTPClippitTv ProviderURL = "http://clippit.tv"
	HTTPGfycatCOM ProviderURL = "http://gfycat.com"
	HTTPSWWWYoutubeCOM ProviderURL = "https://www.youtube.com/"
)

type OembedType string
const (
	Video OembedType = "video"
)

type Version string
const (
	The10 Version = "1.0"
)

type MediaType string
const (
	ClippituserTv MediaType = "clippituser.tv"
	GfycatCOM MediaType = "gfycat.com"
	YoutubeCOM MediaType = "youtube.com"
)

type WhitelistStatus string
const (
	AllAds WhitelistStatus = "all_ads"
	PromoAll WhitelistStatus = "promo_all"
	PromoSpecified WhitelistStatus = "promo_specified"
)

type PostHint string
const (
	Link PostHint = "link"
	PostHintImage PostHint = "image"
	RichVideo PostHint = "rich:video"
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
