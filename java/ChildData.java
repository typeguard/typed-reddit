package io.quicktype;

import java.util.Map;
import com.fasterxml.jackson.annotation.*;

public class ChildData {
    private Object approvedAtUTC;
    private String subreddit;
    private String selftext;
    private Object[] userReports;
    private boolean saved;
    private Object modReasonTitle;
    private long gilded;
    private boolean clicked;
    private String title;
    private LinkFlairRichtext[] linkFlairRichtext;
    private String subredditNamePrefixed;
    private boolean hidden;
    private long pwls;
    private String linkFlairCSSClass;
    private long downs;
    private Long thumbnailHeight;
    private WhitelistStatus parentWhitelistStatus;
    private boolean hideScore;
    private String name;
    private boolean quarantine;
    private LinkFlairTextColor linkFlairTextColor;
    private String authorFlairBackgroundColor;
    private SubredditType subredditType;
    private long ups;
    private String domain;
    private MediaEmbed mediaEmbed;
    private Long thumbnailWidth;
    private Object authorFlairTemplateID;
    private boolean isOriginalContent;
    private Object secureMedia;
    private boolean isRedditMediaDomain;
    private boolean isMeta;
    private Object category;
    private MediaEmbed secureMediaEmbed;
    private String linkFlairText;
    private boolean canModPost;
    private long score;
    private Object approvedBy;
    private String thumbnail;
    private Edited edited;
    private String authorFlairCSSClass;
    private AuthorFlairRichtext[] authorFlairRichtext;
    private PostHint postHint;
    private String[] contentCategories;
    private boolean isSelf;
    private Object modNote;
    private double created;
    private FlairType linkFlairType;
    private long wls;
    private Object bannedBy;
    private FlairType authorFlairType;
    private boolean contestMode;
    private String selftextHTML;
    private Object likes;
    private String suggestedSort;
    private Object bannedAtUTC;
    private Object viewCount;
    private boolean archived;
    private boolean noFollow;
    private boolean isCrosspostable;
    private boolean pinned;
    private boolean over18;
    private Preview preview;
    private boolean mediaOnly;
    private String linkFlairTemplateID;
    private boolean canGild;
    private boolean spoiler;
    private boolean locked;
    private String authorFlairText;
    private boolean visited;
    private Object numReports;
    private Object distinguished;
    private String subredditID;
    private Object modReasonBy;
    private Object removalReason;
    private LinkFlairBackgroundColor linkFlairBackgroundColor;
    private String id;
    private Object reportReasons;
    private String author;
    private long numCrossposts;
    private long numComments;
    private boolean sendReplies;
    private Object[] modReports;
    private String authorFlairTextColor;
    private String permalink;
    private WhitelistStatus whitelistStatus;
    private boolean stickied;
    private String url;
    private long subredditSubscribers;
    private double createdUTC;
    private Object media;
    private boolean isVideo;

    @JsonProperty("approved_at_utc")
    public Object getApprovedAtUTC() { return approvedAtUTC; }
    @JsonProperty("approved_at_utc")
    public void setApprovedAtUTC(Object value) { this.approvedAtUTC = value; }

    @JsonProperty("subreddit")
    public String getSubreddit() { return subreddit; }
    @JsonProperty("subreddit")
    public void setSubreddit(String value) { this.subreddit = value; }

    @JsonProperty("selftext")
    public String getSelftext() { return selftext; }
    @JsonProperty("selftext")
    public void setSelftext(String value) { this.selftext = value; }

    @JsonProperty("user_reports")
    public Object[] getUserReports() { return userReports; }
    @JsonProperty("user_reports")
    public void setUserReports(Object[] value) { this.userReports = value; }

    @JsonProperty("saved")
    public boolean getSaved() { return saved; }
    @JsonProperty("saved")
    public void setSaved(boolean value) { this.saved = value; }

    @JsonProperty("mod_reason_title")
    public Object getModReasonTitle() { return modReasonTitle; }
    @JsonProperty("mod_reason_title")
    public void setModReasonTitle(Object value) { this.modReasonTitle = value; }

    @JsonProperty("gilded")
    public long getGilded() { return gilded; }
    @JsonProperty("gilded")
    public void setGilded(long value) { this.gilded = value; }

    @JsonProperty("clicked")
    public boolean getClicked() { return clicked; }
    @JsonProperty("clicked")
    public void setClicked(boolean value) { this.clicked = value; }

    @JsonProperty("title")
    public String getTitle() { return title; }
    @JsonProperty("title")
    public void setTitle(String value) { this.title = value; }

    @JsonProperty("link_flair_richtext")
    public LinkFlairRichtext[] getLinkFlairRichtext() { return linkFlairRichtext; }
    @JsonProperty("link_flair_richtext")
    public void setLinkFlairRichtext(LinkFlairRichtext[] value) { this.linkFlairRichtext = value; }

    @JsonProperty("subreddit_name_prefixed")
    public String getSubredditNamePrefixed() { return subredditNamePrefixed; }
    @JsonProperty("subreddit_name_prefixed")
    public void setSubredditNamePrefixed(String value) { this.subredditNamePrefixed = value; }

    @JsonProperty("hidden")
    public boolean getHidden() { return hidden; }
    @JsonProperty("hidden")
    public void setHidden(boolean value) { this.hidden = value; }

    @JsonProperty("pwls")
    public long getPwls() { return pwls; }
    @JsonProperty("pwls")
    public void setPwls(long value) { this.pwls = value; }

    @JsonProperty("link_flair_css_class")
    public String getLinkFlairCSSClass() { return linkFlairCSSClass; }
    @JsonProperty("link_flair_css_class")
    public void setLinkFlairCSSClass(String value) { this.linkFlairCSSClass = value; }

    @JsonProperty("downs")
    public long getDowns() { return downs; }
    @JsonProperty("downs")
    public void setDowns(long value) { this.downs = value; }

    @JsonProperty("thumbnail_height")
    public Long getThumbnailHeight() { return thumbnailHeight; }
    @JsonProperty("thumbnail_height")
    public void setThumbnailHeight(Long value) { this.thumbnailHeight = value; }

    @JsonProperty("parent_whitelist_status")
    public WhitelistStatus getParentWhitelistStatus() { return parentWhitelistStatus; }
    @JsonProperty("parent_whitelist_status")
    public void setParentWhitelistStatus(WhitelistStatus value) { this.parentWhitelistStatus = value; }

    @JsonProperty("hide_score")
    public boolean getHideScore() { return hideScore; }
    @JsonProperty("hide_score")
    public void setHideScore(boolean value) { this.hideScore = value; }

    @JsonProperty("name")
    public String getName() { return name; }
    @JsonProperty("name")
    public void setName(String value) { this.name = value; }

    @JsonProperty("quarantine")
    public boolean getQuarantine() { return quarantine; }
    @JsonProperty("quarantine")
    public void setQuarantine(boolean value) { this.quarantine = value; }

    @JsonProperty("link_flair_text_color")
    public LinkFlairTextColor getLinkFlairTextColor() { return linkFlairTextColor; }
    @JsonProperty("link_flair_text_color")
    public void setLinkFlairTextColor(LinkFlairTextColor value) { this.linkFlairTextColor = value; }

    @JsonProperty("author_flair_background_color")
    public String getAuthorFlairBackgroundColor() { return authorFlairBackgroundColor; }
    @JsonProperty("author_flair_background_color")
    public void setAuthorFlairBackgroundColor(String value) { this.authorFlairBackgroundColor = value; }

    @JsonProperty("subreddit_type")
    public SubredditType getSubredditType() { return subredditType; }
    @JsonProperty("subreddit_type")
    public void setSubredditType(SubredditType value) { this.subredditType = value; }

    @JsonProperty("ups")
    public long getUPS() { return ups; }
    @JsonProperty("ups")
    public void setUPS(long value) { this.ups = value; }

    @JsonProperty("domain")
    public String getDomain() { return domain; }
    @JsonProperty("domain")
    public void setDomain(String value) { this.domain = value; }

    @JsonProperty("media_embed")
    public MediaEmbed getMediaEmbed() { return mediaEmbed; }
    @JsonProperty("media_embed")
    public void setMediaEmbed(MediaEmbed value) { this.mediaEmbed = value; }

    @JsonProperty("thumbnail_width")
    public Long getThumbnailWidth() { return thumbnailWidth; }
    @JsonProperty("thumbnail_width")
    public void setThumbnailWidth(Long value) { this.thumbnailWidth = value; }

    @JsonProperty("author_flair_template_id")
    public Object getAuthorFlairTemplateID() { return authorFlairTemplateID; }
    @JsonProperty("author_flair_template_id")
    public void setAuthorFlairTemplateID(Object value) { this.authorFlairTemplateID = value; }

    @JsonProperty("is_original_content")
    public boolean getIsOriginalContent() { return isOriginalContent; }
    @JsonProperty("is_original_content")
    public void setIsOriginalContent(boolean value) { this.isOriginalContent = value; }

    @JsonProperty("secure_media")
    public Object getSecureMedia() { return secureMedia; }
    @JsonProperty("secure_media")
    public void setSecureMedia(Object value) { this.secureMedia = value; }

    @JsonProperty("is_reddit_media_domain")
    public boolean getIsRedditMediaDomain() { return isRedditMediaDomain; }
    @JsonProperty("is_reddit_media_domain")
    public void setIsRedditMediaDomain(boolean value) { this.isRedditMediaDomain = value; }

    @JsonProperty("is_meta")
    public boolean getIsMeta() { return isMeta; }
    @JsonProperty("is_meta")
    public void setIsMeta(boolean value) { this.isMeta = value; }

    @JsonProperty("category")
    public Object getCategory() { return category; }
    @JsonProperty("category")
    public void setCategory(Object value) { this.category = value; }

    @JsonProperty("secure_media_embed")
    public MediaEmbed getSecureMediaEmbed() { return secureMediaEmbed; }
    @JsonProperty("secure_media_embed")
    public void setSecureMediaEmbed(MediaEmbed value) { this.secureMediaEmbed = value; }

    @JsonProperty("link_flair_text")
    public String getLinkFlairText() { return linkFlairText; }
    @JsonProperty("link_flair_text")
    public void setLinkFlairText(String value) { this.linkFlairText = value; }

    @JsonProperty("can_mod_post")
    public boolean getCanModPost() { return canModPost; }
    @JsonProperty("can_mod_post")
    public void setCanModPost(boolean value) { this.canModPost = value; }

    @JsonProperty("score")
    public long getScore() { return score; }
    @JsonProperty("score")
    public void setScore(long value) { this.score = value; }

    @JsonProperty("approved_by")
    public Object getApprovedBy() { return approvedBy; }
    @JsonProperty("approved_by")
    public void setApprovedBy(Object value) { this.approvedBy = value; }

    @JsonProperty("thumbnail")
    public String getThumbnail() { return thumbnail; }
    @JsonProperty("thumbnail")
    public void setThumbnail(String value) { this.thumbnail = value; }

    @JsonProperty("edited")
    public Edited getEdited() { return edited; }
    @JsonProperty("edited")
    public void setEdited(Edited value) { this.edited = value; }

    @JsonProperty("author_flair_css_class")
    public String getAuthorFlairCSSClass() { return authorFlairCSSClass; }
    @JsonProperty("author_flair_css_class")
    public void setAuthorFlairCSSClass(String value) { this.authorFlairCSSClass = value; }

    @JsonProperty("author_flair_richtext")
    public AuthorFlairRichtext[] getAuthorFlairRichtext() { return authorFlairRichtext; }
    @JsonProperty("author_flair_richtext")
    public void setAuthorFlairRichtext(AuthorFlairRichtext[] value) { this.authorFlairRichtext = value; }

    @JsonProperty("post_hint")
    public PostHint getPostHint() { return postHint; }
    @JsonProperty("post_hint")
    public void setPostHint(PostHint value) { this.postHint = value; }

    @JsonProperty("content_categories")
    public String[] getContentCategories() { return contentCategories; }
    @JsonProperty("content_categories")
    public void setContentCategories(String[] value) { this.contentCategories = value; }

    @JsonProperty("is_self")
    public boolean getIsSelf() { return isSelf; }
    @JsonProperty("is_self")
    public void setIsSelf(boolean value) { this.isSelf = value; }

    @JsonProperty("mod_note")
    public Object getModNote() { return modNote; }
    @JsonProperty("mod_note")
    public void setModNote(Object value) { this.modNote = value; }

    @JsonProperty("created")
    public double getCreated() { return created; }
    @JsonProperty("created")
    public void setCreated(double value) { this.created = value; }

    @JsonProperty("link_flair_type")
    public FlairType getLinkFlairType() { return linkFlairType; }
    @JsonProperty("link_flair_type")
    public void setLinkFlairType(FlairType value) { this.linkFlairType = value; }

    @JsonProperty("wls")
    public long getWls() { return wls; }
    @JsonProperty("wls")
    public void setWls(long value) { this.wls = value; }

    @JsonProperty("banned_by")
    public Object getBannedBy() { return bannedBy; }
    @JsonProperty("banned_by")
    public void setBannedBy(Object value) { this.bannedBy = value; }

    @JsonProperty("author_flair_type")
    public FlairType getAuthorFlairType() { return authorFlairType; }
    @JsonProperty("author_flair_type")
    public void setAuthorFlairType(FlairType value) { this.authorFlairType = value; }

    @JsonProperty("contest_mode")
    public boolean getContestMode() { return contestMode; }
    @JsonProperty("contest_mode")
    public void setContestMode(boolean value) { this.contestMode = value; }

    @JsonProperty("selftext_html")
    public String getSelftextHTML() { return selftextHTML; }
    @JsonProperty("selftext_html")
    public void setSelftextHTML(String value) { this.selftextHTML = value; }

    @JsonProperty("likes")
    public Object getLikes() { return likes; }
    @JsonProperty("likes")
    public void setLikes(Object value) { this.likes = value; }

    @JsonProperty("suggested_sort")
    public String getSuggestedSort() { return suggestedSort; }
    @JsonProperty("suggested_sort")
    public void setSuggestedSort(String value) { this.suggestedSort = value; }

    @JsonProperty("banned_at_utc")
    public Object getBannedAtUTC() { return bannedAtUTC; }
    @JsonProperty("banned_at_utc")
    public void setBannedAtUTC(Object value) { this.bannedAtUTC = value; }

    @JsonProperty("view_count")
    public Object getViewCount() { return viewCount; }
    @JsonProperty("view_count")
    public void setViewCount(Object value) { this.viewCount = value; }

    @JsonProperty("archived")
    public boolean getArchived() { return archived; }
    @JsonProperty("archived")
    public void setArchived(boolean value) { this.archived = value; }

    @JsonProperty("no_follow")
    public boolean getNoFollow() { return noFollow; }
    @JsonProperty("no_follow")
    public void setNoFollow(boolean value) { this.noFollow = value; }

    @JsonProperty("is_crosspostable")
    public boolean getIsCrosspostable() { return isCrosspostable; }
    @JsonProperty("is_crosspostable")
    public void setIsCrosspostable(boolean value) { this.isCrosspostable = value; }

    @JsonProperty("pinned")
    public boolean getPinned() { return pinned; }
    @JsonProperty("pinned")
    public void setPinned(boolean value) { this.pinned = value; }

    @JsonProperty("over_18")
    public boolean getOver18() { return over18; }
    @JsonProperty("over_18")
    public void setOver18(boolean value) { this.over18 = value; }

    @JsonProperty("preview")
    public Preview getPreview() { return preview; }
    @JsonProperty("preview")
    public void setPreview(Preview value) { this.preview = value; }

    @JsonProperty("media_only")
    public boolean getMediaOnly() { return mediaOnly; }
    @JsonProperty("media_only")
    public void setMediaOnly(boolean value) { this.mediaOnly = value; }

    @JsonProperty("link_flair_template_id")
    public String getLinkFlairTemplateID() { return linkFlairTemplateID; }
    @JsonProperty("link_flair_template_id")
    public void setLinkFlairTemplateID(String value) { this.linkFlairTemplateID = value; }

    @JsonProperty("can_gild")
    public boolean getCanGild() { return canGild; }
    @JsonProperty("can_gild")
    public void setCanGild(boolean value) { this.canGild = value; }

    @JsonProperty("spoiler")
    public boolean getSpoiler() { return spoiler; }
    @JsonProperty("spoiler")
    public void setSpoiler(boolean value) { this.spoiler = value; }

    @JsonProperty("locked")
    public boolean getLocked() { return locked; }
    @JsonProperty("locked")
    public void setLocked(boolean value) { this.locked = value; }

    @JsonProperty("author_flair_text")
    public String getAuthorFlairText() { return authorFlairText; }
    @JsonProperty("author_flair_text")
    public void setAuthorFlairText(String value) { this.authorFlairText = value; }

    @JsonProperty("visited")
    public boolean getVisited() { return visited; }
    @JsonProperty("visited")
    public void setVisited(boolean value) { this.visited = value; }

    @JsonProperty("num_reports")
    public Object getNumReports() { return numReports; }
    @JsonProperty("num_reports")
    public void setNumReports(Object value) { this.numReports = value; }

    @JsonProperty("distinguished")
    public Object getDistinguished() { return distinguished; }
    @JsonProperty("distinguished")
    public void setDistinguished(Object value) { this.distinguished = value; }

    @JsonProperty("subreddit_id")
    public String getSubredditID() { return subredditID; }
    @JsonProperty("subreddit_id")
    public void setSubredditID(String value) { this.subredditID = value; }

    @JsonProperty("mod_reason_by")
    public Object getModReasonBy() { return modReasonBy; }
    @JsonProperty("mod_reason_by")
    public void setModReasonBy(Object value) { this.modReasonBy = value; }

    @JsonProperty("removal_reason")
    public Object getRemovalReason() { return removalReason; }
    @JsonProperty("removal_reason")
    public void setRemovalReason(Object value) { this.removalReason = value; }

    @JsonProperty("link_flair_background_color")
    public LinkFlairBackgroundColor getLinkFlairBackgroundColor() { return linkFlairBackgroundColor; }
    @JsonProperty("link_flair_background_color")
    public void setLinkFlairBackgroundColor(LinkFlairBackgroundColor value) { this.linkFlairBackgroundColor = value; }

    @JsonProperty("id")
    public String getID() { return id; }
    @JsonProperty("id")
    public void setID(String value) { this.id = value; }

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

    @JsonProperty("num_comments")
    public long getNumComments() { return numComments; }
    @JsonProperty("num_comments")
    public void setNumComments(long value) { this.numComments = value; }

    @JsonProperty("send_replies")
    public boolean getSendReplies() { return sendReplies; }
    @JsonProperty("send_replies")
    public void setSendReplies(boolean value) { this.sendReplies = value; }

    @JsonProperty("mod_reports")
    public Object[] getModReports() { return modReports; }
    @JsonProperty("mod_reports")
    public void setModReports(Object[] value) { this.modReports = value; }

    @JsonProperty("author_flair_text_color")
    public String getAuthorFlairTextColor() { return authorFlairTextColor; }
    @JsonProperty("author_flair_text_color")
    public void setAuthorFlairTextColor(String value) { this.authorFlairTextColor = value; }

    @JsonProperty("permalink")
    public String getPermalink() { return permalink; }
    @JsonProperty("permalink")
    public void setPermalink(String value) { this.permalink = value; }

    @JsonProperty("whitelist_status")
    public WhitelistStatus getWhitelistStatus() { return whitelistStatus; }
    @JsonProperty("whitelist_status")
    public void setWhitelistStatus(WhitelistStatus value) { this.whitelistStatus = value; }

    @JsonProperty("stickied")
    public boolean getStickied() { return stickied; }
    @JsonProperty("stickied")
    public void setStickied(boolean value) { this.stickied = value; }

    @JsonProperty("url")
    public String getURL() { return url; }
    @JsonProperty("url")
    public void setURL(String value) { this.url = value; }

    @JsonProperty("subreddit_subscribers")
    public long getSubredditSubscribers() { return subredditSubscribers; }
    @JsonProperty("subreddit_subscribers")
    public void setSubredditSubscribers(long value) { this.subredditSubscribers = value; }

    @JsonProperty("created_utc")
    public double getCreatedUTC() { return createdUTC; }
    @JsonProperty("created_utc")
    public void setCreatedUTC(double value) { this.createdUTC = value; }

    @JsonProperty("media")
    public Object getMedia() { return media; }
    @JsonProperty("media")
    public void setMedia(Object value) { this.media = value; }

    @JsonProperty("is_video")
    public boolean getIsVideo() { return isVideo; }
    @JsonProperty("is_video")
    public void setIsVideo(boolean value) { this.isVideo = value; }
}
