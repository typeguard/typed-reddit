package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class ChildData {
    private String domain;
    private Object approvedAtUTC;
    private Object modReasonBy;
    private Object bannedBy;
    private Object numReports;
    private String subredditID;
    private Long thumbnailWidth;
    private String subreddit;
    private String selftextHTML;
    private String selftext;
    private Object likes;
    private String suggestedSort;
    private Object[] userReports;
    private Media secureMedia;
    private boolean isRedditMediaDomain;
    private String linkFlairText;
    private String id;
    private Object bannedAtUTC;
    private Object modReasonTitle;
    private Object viewCount;
    private boolean archived;
    private boolean clicked;
    private MediaEmbed mediaEmbed;
    private Object reportReasons;
    private String author;
    private long numCrossposts;
    private boolean saved;
    private Object[] modReports;
    private boolean canModPost;
    private boolean isCrosspostable;
    private boolean pinned;
    private long score;
    private Object approvedBy;
    private boolean over18;
    private boolean hidden;
    private Preview preview;
    private String thumbnail;
    private boolean edited;
    private String linkFlairCSSClass;
    private String authorFlairCSSClass;
    private boolean contestMode;
    private long gilded;
    private long downs;
    private boolean brandSafe;
    private MediaEmbed secureMediaEmbed;
    private Object removalReason;
    private PostHint postHint;
    private String authorFlairText;
    private boolean stickied;
    private boolean canGild;
    private Long thumbnailHeight;
    private WhitelistStatus parentWhitelistStatus;
    private String name;
    private boolean spoiler;
    private String permalink;
    private SubredditType subredditType;
    private boolean locked;
    private boolean hideScore;
    private double created;
    private String url;
    private WhitelistStatus whitelistStatus;
    private boolean quarantine;
    private String title;
    private double createdUTC;
    private String subredditNamePrefixed;
    private long ups;
    private Media media;
    private long numComments;
    private boolean isSelf;
    private boolean visited;
    private Object modNote;
    private boolean isVideo;
    private Object distinguished;

    @JsonProperty("domain")
    public String getDomain() { return domain; }
    @JsonProperty("domain")
    public void setDomain(String value) { this.domain = value; }

    @JsonProperty("approved_at_utc")
    public Object getApprovedAtUTC() { return approvedAtUTC; }
    @JsonProperty("approved_at_utc")
    public void setApprovedAtUTC(Object value) { this.approvedAtUTC = value; }

    @JsonProperty("mod_reason_by")
    public Object getModReasonBy() { return modReasonBy; }
    @JsonProperty("mod_reason_by")
    public void setModReasonBy(Object value) { this.modReasonBy = value; }

    @JsonProperty("banned_by")
    public Object getBannedBy() { return bannedBy; }
    @JsonProperty("banned_by")
    public void setBannedBy(Object value) { this.bannedBy = value; }

    @JsonProperty("num_reports")
    public Object getNumReports() { return numReports; }
    @JsonProperty("num_reports")
    public void setNumReports(Object value) { this.numReports = value; }

    @JsonProperty("subreddit_id")
    public String getSubredditID() { return subredditID; }
    @JsonProperty("subreddit_id")
    public void setSubredditID(String value) { this.subredditID = value; }

    @JsonProperty("thumbnail_width")
    public Long getThumbnailWidth() { return thumbnailWidth; }
    @JsonProperty("thumbnail_width")
    public void setThumbnailWidth(Long value) { this.thumbnailWidth = value; }

    @JsonProperty("subreddit")
    public String getSubreddit() { return subreddit; }
    @JsonProperty("subreddit")
    public void setSubreddit(String value) { this.subreddit = value; }

    @JsonProperty("selftext_html")
    public String getSelftextHTML() { return selftextHTML; }
    @JsonProperty("selftext_html")
    public void setSelftextHTML(String value) { this.selftextHTML = value; }

    @JsonProperty("selftext")
    public String getSelftext() { return selftext; }
    @JsonProperty("selftext")
    public void setSelftext(String value) { this.selftext = value; }

    @JsonProperty("likes")
    public Object getLikes() { return likes; }
    @JsonProperty("likes")
    public void setLikes(Object value) { this.likes = value; }

    @JsonProperty("suggested_sort")
    public String getSuggestedSort() { return suggestedSort; }
    @JsonProperty("suggested_sort")
    public void setSuggestedSort(String value) { this.suggestedSort = value; }

    @JsonProperty("user_reports")
    public Object[] getUserReports() { return userReports; }
    @JsonProperty("user_reports")
    public void setUserReports(Object[] value) { this.userReports = value; }

    @JsonProperty("secure_media")
    public Media getSecureMedia() { return secureMedia; }
    @JsonProperty("secure_media")
    public void setSecureMedia(Media value) { this.secureMedia = value; }

    @JsonProperty("is_reddit_media_domain")
    public boolean getIsRedditMediaDomain() { return isRedditMediaDomain; }
    @JsonProperty("is_reddit_media_domain")
    public void setIsRedditMediaDomain(boolean value) { this.isRedditMediaDomain = value; }

    @JsonProperty("link_flair_text")
    public String getLinkFlairText() { return linkFlairText; }
    @JsonProperty("link_flair_text")
    public void setLinkFlairText(String value) { this.linkFlairText = value; }

    @JsonProperty("id")
    public String getId() { return id; }
    @JsonProperty("id")
    public void setId(String value) { this.id = value; }

    @JsonProperty("banned_at_utc")
    public Object getBannedAtUTC() { return bannedAtUTC; }
    @JsonProperty("banned_at_utc")
    public void setBannedAtUTC(Object value) { this.bannedAtUTC = value; }

    @JsonProperty("mod_reason_title")
    public Object getModReasonTitle() { return modReasonTitle; }
    @JsonProperty("mod_reason_title")
    public void setModReasonTitle(Object value) { this.modReasonTitle = value; }

    @JsonProperty("view_count")
    public Object getViewCount() { return viewCount; }
    @JsonProperty("view_count")
    public void setViewCount(Object value) { this.viewCount = value; }

    @JsonProperty("archived")
    public boolean getArchived() { return archived; }
    @JsonProperty("archived")
    public void setArchived(boolean value) { this.archived = value; }

    @JsonProperty("clicked")
    public boolean getClicked() { return clicked; }
    @JsonProperty("clicked")
    public void setClicked(boolean value) { this.clicked = value; }

    @JsonProperty("media_embed")
    public MediaEmbed getMediaEmbed() { return mediaEmbed; }
    @JsonProperty("media_embed")
    public void setMediaEmbed(MediaEmbed value) { this.mediaEmbed = value; }

    @JsonProperty("report_reasons")
    public Object getReportReasons() { return reportReasons; }
    @JsonProperty("report_reasons")
    public void setReportReasons(Object value) { this.reportReasons = value; }

    @JsonProperty("author")
    public String getAuthor() { return author; }
    @JsonProperty("author")
    public void setAuthor(String value) { this.author = value; }

    @JsonProperty("num_crossposts")
    public long getNumCrossposts() { return numCrossposts; }
    @JsonProperty("num_crossposts")
    public void setNumCrossposts(long value) { this.numCrossposts = value; }

    @JsonProperty("saved")
    public boolean getSaved() { return saved; }
    @JsonProperty("saved")
    public void setSaved(boolean value) { this.saved = value; }

    @JsonProperty("mod_reports")
    public Object[] getModReports() { return modReports; }
    @JsonProperty("mod_reports")
    public void setModReports(Object[] value) { this.modReports = value; }

    @JsonProperty("can_mod_post")
    public boolean getCanModPost() { return canModPost; }
    @JsonProperty("can_mod_post")
    public void setCanModPost(boolean value) { this.canModPost = value; }

    @JsonProperty("is_crosspostable")
    public boolean getIsCrosspostable() { return isCrosspostable; }
    @JsonProperty("is_crosspostable")
    public void setIsCrosspostable(boolean value) { this.isCrosspostable = value; }

    @JsonProperty("pinned")
    public boolean getPinned() { return pinned; }
    @JsonProperty("pinned")
    public void setPinned(boolean value) { this.pinned = value; }

    @JsonProperty("score")
    public long getScore() { return score; }
    @JsonProperty("score")
    public void setScore(long value) { this.score = value; }

    @JsonProperty("approved_by")
    public Object getApprovedBy() { return approvedBy; }
    @JsonProperty("approved_by")
    public void setApprovedBy(Object value) { this.approvedBy = value; }

    @JsonProperty("over_18")
    public boolean getOver18() { return over18; }
    @JsonProperty("over_18")
    public void setOver18(boolean value) { this.over18 = value; }

    @JsonProperty("hidden")
    public boolean getHidden() { return hidden; }
    @JsonProperty("hidden")
    public void setHidden(boolean value) { this.hidden = value; }

    @JsonProperty("preview")
    public Preview getPreview() { return preview; }
    @JsonProperty("preview")
    public void setPreview(Preview value) { this.preview = value; }

    @JsonProperty("thumbnail")
    public String getThumbnail() { return thumbnail; }
    @JsonProperty("thumbnail")
    public void setThumbnail(String value) { this.thumbnail = value; }

    @JsonProperty("edited")
    public boolean getEdited() { return edited; }
    @JsonProperty("edited")
    public void setEdited(boolean value) { this.edited = value; }

    @JsonProperty("link_flair_css_class")
    public String getLinkFlairCSSClass() { return linkFlairCSSClass; }
    @JsonProperty("link_flair_css_class")
    public void setLinkFlairCSSClass(String value) { this.linkFlairCSSClass = value; }

    @JsonProperty("author_flair_css_class")
    public String getAuthorFlairCSSClass() { return authorFlairCSSClass; }
    @JsonProperty("author_flair_css_class")
    public void setAuthorFlairCSSClass(String value) { this.authorFlairCSSClass = value; }

    @JsonProperty("contest_mode")
    public boolean getContestMode() { return contestMode; }
    @JsonProperty("contest_mode")
    public void setContestMode(boolean value) { this.contestMode = value; }

    @JsonProperty("gilded")
    public long getGilded() { return gilded; }
    @JsonProperty("gilded")
    public void setGilded(long value) { this.gilded = value; }

    @JsonProperty("downs")
    public long getDowns() { return downs; }
    @JsonProperty("downs")
    public void setDowns(long value) { this.downs = value; }

    @JsonProperty("brand_safe")
    public boolean getBrandSafe() { return brandSafe; }
    @JsonProperty("brand_safe")
    public void setBrandSafe(boolean value) { this.brandSafe = value; }

    @JsonProperty("secure_media_embed")
    public MediaEmbed getSecureMediaEmbed() { return secureMediaEmbed; }
    @JsonProperty("secure_media_embed")
    public void setSecureMediaEmbed(MediaEmbed value) { this.secureMediaEmbed = value; }

    @JsonProperty("removal_reason")
    public Object getRemovalReason() { return removalReason; }
    @JsonProperty("removal_reason")
    public void setRemovalReason(Object value) { this.removalReason = value; }

    @JsonProperty("post_hint")
    public PostHint getPostHint() { return postHint; }
    @JsonProperty("post_hint")
    public void setPostHint(PostHint value) { this.postHint = value; }

    @JsonProperty("author_flair_text")
    public String getAuthorFlairText() { return authorFlairText; }
    @JsonProperty("author_flair_text")
    public void setAuthorFlairText(String value) { this.authorFlairText = value; }

    @JsonProperty("stickied")
    public boolean getStickied() { return stickied; }
    @JsonProperty("stickied")
    public void setStickied(boolean value) { this.stickied = value; }

    @JsonProperty("can_gild")
    public boolean getCanGild() { return canGild; }
    @JsonProperty("can_gild")
    public void setCanGild(boolean value) { this.canGild = value; }

    @JsonProperty("thumbnail_height")
    public Long getThumbnailHeight() { return thumbnailHeight; }
    @JsonProperty("thumbnail_height")
    public void setThumbnailHeight(Long value) { this.thumbnailHeight = value; }

    @JsonProperty("parent_whitelist_status")
    public WhitelistStatus getParentWhitelistStatus() { return parentWhitelistStatus; }
    @JsonProperty("parent_whitelist_status")
    public void setParentWhitelistStatus(WhitelistStatus value) { this.parentWhitelistStatus = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("spoiler")
    public boolean getSpoiler() { return spoiler; }
    @JsonProperty("spoiler")
    public void setSpoiler(boolean value) { this.spoiler = value; }

    @JsonProperty("permalink")
    public String getPermalink() { return permalink; }
    @JsonProperty("permalink")
    public void setPermalink(String value) { this.permalink = value; }

    @JsonProperty("subreddit_type")
    public SubredditType getSubredditType() { return subredditType; }
    @JsonProperty("subreddit_type")
    public void setSubredditType(SubredditType value) { this.subredditType = value; }

    @JsonProperty("locked")
    public boolean getLocked() { return locked; }
    @JsonProperty("locked")
    public void setLocked(boolean value) { this.locked = value; }

    @JsonProperty("hide_score")
    public boolean getHideScore() { return hideScore; }
    @JsonProperty("hide_score")
    public void setHideScore(boolean value) { this.hideScore = value; }

    @JsonProperty("created")
    public double getCreated() { return created; }
    @JsonProperty("created")
    public void setCreated(double value) { this.created = value; }

    @JsonProperty("url")
    public String getUrl() { return url; }
    @JsonProperty("url")
    public void setUrl(String value) { this.url = value; }

    @JsonProperty("whitelist_status")
    public WhitelistStatus getWhitelistStatus() { return whitelistStatus; }
    @JsonProperty("whitelist_status")
    public void setWhitelistStatus(WhitelistStatus value) { this.whitelistStatus = value; }

    @JsonProperty("quarantine")
    public boolean getQuarantine() { return quarantine; }
    @JsonProperty("quarantine")
    public void setQuarantine(boolean value) { this.quarantine = value; }

    @JsonProperty("title")
    public String getTitle() { return title; }
    @JsonProperty("title")
    public void setTitle(String value) { this.title = value; }

    @JsonProperty("created_utc")
    public double getCreatedUTC() { return createdUTC; }
    @JsonProperty("created_utc")
    public void setCreatedUTC(double value) { this.createdUTC = value; }

    @JsonProperty("subreddit_name_prefixed")
    public String getSubredditNamePrefixed() { return subredditNamePrefixed; }
    @JsonProperty("subreddit_name_prefixed")
    public void setSubredditNamePrefixed(String value) { this.subredditNamePrefixed = value; }

    @JsonProperty("ups")
    public long getUps() { return ups; }
    @JsonProperty("ups")
    public void setUps(long value) { this.ups = value; }

    @JsonProperty("media")
    public Media getMedia() { return media; }
    @JsonProperty("media")
    public void setMedia(Media value) { this.media = value; }

    @JsonProperty("num_comments")
    public long getNumComments() { return numComments; }
    @JsonProperty("num_comments")
    public void setNumComments(long value) { this.numComments = value; }

    @JsonProperty("is_self")
    public boolean getIsSelf() { return isSelf; }
    @JsonProperty("is_self")
    public void setIsSelf(boolean value) { this.isSelf = value; }

    @JsonProperty("visited")
    public boolean getVisited() { return visited; }
    @JsonProperty("visited")
    public void setVisited(boolean value) { this.visited = value; }

    @JsonProperty("mod_note")
    public Object getModNote() { return modNote; }
    @JsonProperty("mod_note")
    public void setModNote(Object value) { this.modNote = value; }

    @JsonProperty("is_video")
    public boolean getIsVideo() { return isVideo; }
    @JsonProperty("is_video")
    public void setIsVideo(boolean value) { this.isVideo = value; }

    @JsonProperty("distinguished")
    public Object getDistinguished() { return distinguished; }
    @JsonProperty("distinguished")
    public void setDistinguished(Object value) { this.distinguished = value; }
}
