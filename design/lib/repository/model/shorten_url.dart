class ShortenUrl {
  String code;
  String shortLink;
  String fullShortLink;
  String shortLink2;
  String fullShortLink2;
  String shareLink;
  String fullShareLink;
  String originalLink;

  ShortenUrl(
      {this.code,
        this.shortLink,
        this.fullShortLink,
        this.shortLink2,
        this.fullShortLink2,
        this.shareLink,
        this.fullShareLink,
        this.originalLink});

  ShortenUrl.fromJson(Map<String, dynamic> json) {
    code = json.putIfAbsent('code', () => null);
    shortLink = json.putIfAbsent('short_link', () => null);
    fullShortLink = json.putIfAbsent('full_short_link', () => null);
    shortLink2 = json.putIfAbsent('short_link2', () => null);
    fullShortLink2 = json.putIfAbsent('full_short_link2', () => null);
    shareLink = json.putIfAbsent('share_link', () => null);
    fullShareLink = json.putIfAbsent('full_share_link', () => null);
    originalLink = json.putIfAbsent('original_link', () => null);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['short_link'] = this.shortLink;
    data['full_short_link'] = this.fullShortLink;
    data['short_link2'] = this.shortLink2;
    data['full_short_link2'] = this.fullShortLink2;
    data['share_link'] = this.shareLink;
    data['full_share_link'] = this.fullShareLink;
    data['original_link'] = this.originalLink;
    return data;
  }
}