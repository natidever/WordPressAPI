import 'dart:convert';

class BlogPost {
  final int id;
  final String date;
  final String dateGmt;
  final Guid guid;
  final String modified;
  final String modifiedGmt;
  final String slug;
  final String status;
  final String type;
  final String link;
  final Title title;
  final Content content;
  final Excerpt excerpt;
  final int author;
  final int featuredMedia;
  final String commentStatus;
  final String pingStatus;
  final bool sticky;
  final String template;
  final String format;
  final Meta meta;
  final List<int> categories;
  final List<dynamic> tags;
  final List<String> classList;
  final String jetpackFeaturedMediaUrl;

  BlogPost({
    required this.id,
    required this.date,
    required this.dateGmt,
    required this.guid,
    required this.modified,
    required this.modifiedGmt,
    required this.slug,
    required this.status,
    required this.type,
    required this.link,
    required this.title,
    required this.content,
    required this.excerpt,
    required this.author,
    required this.featuredMedia,
    required this.commentStatus,
    required this.pingStatus,
    required this.sticky,
    required this.template,
    required this.format,
    required this.meta,
    required this.categories,
    required this.tags,
    required this.classList,
    required this.jetpackFeaturedMediaUrl,
  });

  factory BlogPost.fromJson(Map<String, dynamic> json) {
    return BlogPost(
      id: json['id'] ?? 0,
      date: json['date'] ?? '',
      dateGmt: json['date_gmt'] ?? '',
      guid: Guid.fromJson(json['guid'] ?? {}),
      modified: json['modified'] ?? '',
      modifiedGmt: json['modified_gmt'] ?? '',
      slug: json['slug'] ?? '',
      status: json['status'] ?? '',
      type: json['type'] ?? '',
      link: json['link'] ?? '',
      title: Title.fromJson(json['title'] ?? {}),
      content: Content.fromJson(json['content'] ?? {}),
      excerpt: Excerpt.fromJson(json['excerpt'] ?? {}),
      author: json['author'] ?? 0,
      featuredMedia: json['featured_media'] ?? 0,
      commentStatus: json['comment_status'] ?? '',
      pingStatus: json['ping_status'] ?? '',
      sticky: json['sticky'] ?? false,
      template: json['template'] ?? '',
      format: json['format'] ?? '',
      meta: Meta.fromJson(json['meta'] ?? {}),
      categories: List<int>.from(json['categories'] ?? []),
      tags: List<dynamic>.from(json['tags'] ?? []),
      classList: List<String>.from(json['class_list'] ?? []),
      jetpackFeaturedMediaUrl: json['jetpack_featured_media_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'date_gmt': dateGmt,
      'guid': guid.toJson(),
      'modified': modified,
      'modified_gmt': modifiedGmt,
      'slug': slug,
      'status': status,
      'type': type,
      'link': link,
      'title': title.toJson(),
      'content': content.toJson(),
      'excerpt': excerpt.toJson(),
      'author': author,
      'featured_media': featuredMedia,
      'comment_status': commentStatus,
      'ping_status': pingStatus,
      'sticky': sticky,
      'template': template,
      'format': format,
      'meta': meta.toJson(),
      'categories': categories,
      'tags': tags,
      'class_list': classList,
      'jetpack_featured_media_url': jetpackFeaturedMediaUrl,
    };
  }

  static List<BlogPost> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => BlogPost.fromJson(json)).toList();
  }
}

class Guid {
  final String rendered;

  Guid({required this.rendered});

  factory Guid.fromJson(Map<String, dynamic> json) {
    return Guid(rendered: json['rendered'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'rendered': rendered};
  }
}

class Title {
  final String rendered;

  Title({required this.rendered});

  factory Title.fromJson(Map<String, dynamic> json) {
    return Title(rendered: json['rendered'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {'rendered': rendered};
  }
}

class Content {
  final String rendered;
  final bool protected;

  Content({required this.rendered, required this.protected});

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      rendered: json['rendered'] ?? '',
      protected: json['protected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rendered': rendered,
      'protected': protected,
    };
  }
}

class Excerpt {
  final String rendered;
  final bool protected;

  Excerpt({required this.rendered, required this.protected});

  factory Excerpt.fromJson(Map<String, dynamic> json) {
    return Excerpt(
      rendered: json['rendered'] ?? '',
      protected: json['protected'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'rendered': rendered,
      'protected': protected,
    };
  }
}

class Meta {
  final String siteSidebarLayout;
  final String siteContentLayout;
  final String astSiteContentLayout;
  final BackgroundMeta astPageBackgroundMeta;
  final BackgroundMeta astContentBackgroundMeta;

  Meta({
    required this.siteSidebarLayout,
    required this.siteContentLayout,
    required this.astSiteContentLayout,
    required this.astPageBackgroundMeta,
    required this.astContentBackgroundMeta,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      siteSidebarLayout: json['site-sidebar-layout'] ?? 'default',
      siteContentLayout: json['site-content-layout'] ?? '',
      astSiteContentLayout: json['ast-site-content-layout'] ?? '',
      astPageBackgroundMeta:
          BackgroundMeta.fromJson(json['ast-page-background-meta'] ?? {}),
      astContentBackgroundMeta:
          BackgroundMeta.fromJson(json['ast-content-background-meta'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'site-sidebar-layout': siteSidebarLayout,
      'site-content-layout': siteContentLayout,
      'ast-site-content-layout': astSiteContentLayout,
      'ast-page-background-meta': astPageBackgroundMeta.toJson(),
      'ast-content-background-meta': astContentBackgroundMeta.toJson(),
    };
  }
}

class BackgroundMeta {
  final DeviceSettings desktop;
  final DeviceSettings tablet;
  final DeviceSettings mobile;

  BackgroundMeta({
    required this.desktop,
    required this.tablet,
    required this.mobile,
  });

  factory BackgroundMeta.fromJson(Map<String, dynamic> json) {
    return BackgroundMeta(
      desktop: DeviceSettings.fromJson(json['desktop'] ?? {}),
      tablet: DeviceSettings.fromJson(json['tablet'] ?? {}),
      mobile: DeviceSettings.fromJson(json['mobile'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'desktop': desktop.toJson(),
      'tablet': tablet.toJson(),
      'mobile': mobile.toJson(),
    };
  }
}

class DeviceSettings {
  final String backgroundColor;
  final String backgroundImage;
  final String backgroundRepeat;
  final String backgroundPosition;
  final String backgroundSize;
  final String backgroundAttachment;

  DeviceSettings({
    required this.backgroundColor,
    required this.backgroundImage,
    required this.backgroundRepeat,
    required this.backgroundPosition,
    required this.backgroundSize,
    required this.backgroundAttachment,
  });

  factory DeviceSettings.fromJson(Map<String, dynamic> json) {
    return DeviceSettings(
      backgroundColor: json['background-color'] ?? '',
      backgroundImage: json['background-image'] ?? '',
      backgroundRepeat: json['background-repeat'] ?? 'repeat',
      backgroundPosition: json['background-position'] ?? 'center center',
      backgroundSize: json['background-size'] ?? 'auto',
      backgroundAttachment: json['background-attachment'] ?? 'scroll',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'background-color': backgroundColor,
      'background-image': backgroundImage,
      'background-repeat': backgroundRepeat,
      'background-position': backgroundPosition,
      'background-size': backgroundSize,
      'background-attachment': backgroundAttachment,
    };
  }
}
