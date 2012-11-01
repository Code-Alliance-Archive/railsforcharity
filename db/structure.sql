CREATE TABLE `actions` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parameters` longblob NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `advanced_help_index` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `topic` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`sid`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `authentications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `authmap` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `authname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `avatars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatarable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `avatarable_id` int(11) DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `backup_migrate_destinations` (
  `destination_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `backup_migrate_profiles` (
  `profile_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `append_timestamp` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp_format` varchar(14) COLLATE utf8_unicode_ci NOT NULL,
  `filters` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `backup_migrate_schedules` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'db',
  `destination_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `profile_id` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `keep` int(11) NOT NULL DEFAULT '0',
  `period` int(11) NOT NULL DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `cron` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `batch` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `batch` longblob,
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `theme` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `region` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `visibility` tinyint(4) NOT NULL DEFAULT '0',
  `pages` text COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `block_custom` (
  `bid` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8_unicode_ci,
  `info` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `block_node_type` (
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `delta` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `block_role` (
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `delta` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `rid` int(11) NOT NULL,
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `blocked_ips` (
  `iid` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`iid`),
  KEY `blocked_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_block` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_bootstrap` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_field` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_filter` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_form` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_image` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_menu` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_page` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_path` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_update` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_views` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `cache_views_data` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  `serialized` smallint(6) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ckeditor_input_format` (
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `format` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ckeditor_settings` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hostname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `thread` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mail` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `homepage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`cid`),
  KEY `comment_created` (`created`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_status_pid` (`pid`,`status`),
  KEY `comment_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text COLLATE utf8_unicode_ci,
  `commentable_id` int(11) DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `ancestry` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_comments_on_ancestry` (`ancestry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `contact` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `recipients` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reply` longtext COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `selected` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ctools_access_ruleset` (
  `rsid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_description` longtext COLLATE utf8_unicode_ci,
  `requiredcontexts` longtext COLLATE utf8_unicode_ci,
  `contexts` longtext COLLATE utf8_unicode_ci,
  `relationships` longtext COLLATE utf8_unicode_ci,
  `access` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ctools_css_cache` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `css` longtext COLLATE utf8_unicode_ci,
  `filter` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ctools_custom_content` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_description` longtext COLLATE utf8_unicode_ci,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `obj` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `updated` int(11) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci,
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `date_format_locale` (
  `format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `date_format_type` (
  `type` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`type`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `date_formats` (
  `dfid` int(11) NOT NULL AUTO_INCREMENT,
  `format` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `devise_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_devise_users_on_email` (`email`),
  UNIQUE KEY `index_devise_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_devise_users_on_slug` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `active` tinyint(4) NOT NULL DEFAULT '0',
  `storage_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `storage_module` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `data` longblob NOT NULL,
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `active` (`active`),
  KEY `deleted` (`deleted`),
  KEY `field_name` (`field_name`),
  KEY `module` (`module`),
  KEY `storage_active` (`storage_active`),
  KEY `storage_module` (`storage_module`),
  KEY `storage_type` (`storage_type`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_config_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field_id` int(11) NOT NULL,
  `field_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `entity_type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `deleted` (`deleted`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_data_body` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `body_value` longtext COLLATE utf8_unicode_ci,
  `body_summary` longtext COLLATE utf8_unicode_ci,
  `body_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `body_format` (`body_format`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_data_comment_body` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `comment_body_value` longtext COLLATE utf8_unicode_ci,
  `comment_body_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `bundle` (`bundle`),
  KEY `comment_body_format` (`comment_body_format`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_data_field_image` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `field_image_fid` int(11) DEFAULT NULL,
  `field_image_alt` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_image_title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_image_width` int(11) DEFAULT NULL,
  `field_image_height` int(11) DEFAULT NULL,
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `field_image_fid` (`field_image_fid`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_data_field_tags` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) DEFAULT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `field_tags_tid` int(11) DEFAULT NULL,
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `field_tags_tid` (`field_tags_tid`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_revision_body` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `body_value` longtext COLLATE utf8_unicode_ci,
  `body_summary` longtext COLLATE utf8_unicode_ci,
  `body_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `body_format` (`body_format`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_revision_comment_body` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `comment_body_value` longtext COLLATE utf8_unicode_ci,
  `comment_body_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `bundle` (`bundle`),
  KEY `comment_body_format` (`comment_body_format`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_revision_field_image` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `field_image_fid` int(11) DEFAULT NULL,
  `field_image_alt` varchar(512) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_image_title` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_image_width` int(11) DEFAULT NULL,
  `field_image_height` int(11) DEFAULT NULL,
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `field_image_fid` (`field_image_fid`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `field_revision_field_tags` (
  `entity_type` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  `entity_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `language` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delta` int(11) NOT NULL,
  `field_tags_tid` int(11) DEFAULT NULL,
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `entity_type` (`entity_type`),
  KEY `field_tags_tid` (`field_tags_tid`),
  KEY `language` (`language`),
  KEY `revision_id` (`revision_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `file_managed` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filemime` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filesize` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `file_usage` (
  `fid` int(11) NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `id` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`),
  KEY `type_id` (`type`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `filter` (
  `format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `settings` longblob,
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `filter_format` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cache` tinyint(4) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `event` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `expiration` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`identifier`,`timestamp`),
  KEY `purge` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `nid` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `image_effects` (
  `ieid` int(11) NOT NULL AUTO_INCREMENT,
  `isid` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  PRIMARY KEY (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `image_styles` (
  `isid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address_line1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address_line2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `postal` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locatable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locatable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `menu_custom` (
  `menu_name` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `menu_links` (
  `mlid` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plid` int(11) NOT NULL DEFAULT '0',
  `link_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `router_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `link_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` blob,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'system',
  `hidden` smallint(6) NOT NULL DEFAULT '0',
  `external` smallint(6) NOT NULL DEFAULT '0',
  `has_children` smallint(6) NOT NULL DEFAULT '0',
  `expanded` smallint(6) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `depth` smallint(6) NOT NULL DEFAULT '0',
  `customized` smallint(6) NOT NULL DEFAULT '0',
  `p1` int(11) NOT NULL DEFAULT '0',
  `p2` int(11) NOT NULL DEFAULT '0',
  `p3` int(11) NOT NULL DEFAULT '0',
  `p4` int(11) NOT NULL DEFAULT '0',
  `p5` int(11) NOT NULL DEFAULT '0',
  `p6` int(11) NOT NULL DEFAULT '0',
  `p7` int(11) NOT NULL DEFAULT '0',
  `p8` int(11) NOT NULL DEFAULT '0',
  `p9` int(11) NOT NULL DEFAULT '0',
  `updated` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `menu_router` (
  `path` int(11) NOT NULL AUTO_INCREMENT,
  `load_functions` blob NOT NULL,
  `to_arg_functions` blob NOT NULL,
  `access_callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `access_arguments` blob,
  `page_callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_arguments` blob,
  `delivery_callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fit` int(11) NOT NULL DEFAULT '0',
  `number_parts` smallint(6) NOT NULL DEFAULT '0',
  `context` int(11) NOT NULL DEFAULT '0',
  `tab_parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tab_root` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title_callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title_arguments` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme_callback` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme_arguments` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  `include_file` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`(64),`weight`,`title`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `node` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) DEFAULT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `uid` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `created` int(11) NOT NULL DEFAULT '0',
  `changed` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  `tnid` int(11) NOT NULL DEFAULT '0',
  `translate` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `node_access` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL DEFAULT '0',
  `realm` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grant_view` tinyint(4) NOT NULL DEFAULT '0',
  `grant_update` tinyint(4) NOT NULL DEFAULT '0',
  `grant_delete` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `node_comment_statistics` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL DEFAULT '0',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0',
  `last_comment_name` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_comment_uid` int(11) NOT NULL DEFAULT '0',
  `comment_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `comment_count` (`comment_count`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `node_revision` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `log` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `comment` int(11) NOT NULL DEFAULT '0',
  `promote` int(11) NOT NULL DEFAULT '0',
  `sticky` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `node_type` (
  `type` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `base` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `help` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `has_title` tinyint(4) NOT NULL,
  `title_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `custom` tinyint(4) NOT NULL DEFAULT '0',
  `modified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `orig_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `page_manager_handlers` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subtask` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handler` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) DEFAULT NULL,
  `conf` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`did`),
  UNIQUE KEY `name` (`name`),
  KEY `fulltask` (`task`,`subtask`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `page_manager_pages` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `task` varchar(64) COLLATE utf8_unicode_ci DEFAULT 'page',
  `admin_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_description` longtext COLLATE utf8_unicode_ci,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access` longtext COLLATE utf8_unicode_ci NOT NULL,
  `menu` longtext COLLATE utf8_unicode_ci NOT NULL,
  `arguments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `conf` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `name` (`name`),
  KEY `task` (`task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `page_manager_weights` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `weights` (`name`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `properties` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `profile_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `video` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `queue` (
  `item_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longblob,
  `expire` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`item_id`),
  KEY `expire` (`expire`),
  KEY `name_created` (`name`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `rdf_mapping` (
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `bundle` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `mapping` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `registry` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  KEY `hook` (`type`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `registry_file` (
  `filename` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `role` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `role_permission` (
  `rid` int(11) NOT NULL,
  `permission` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `rs_evaluations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reputation_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` float DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rs_evaluations_on_reputation_name_and_source_and_target` (`reputation_name`,`source_id`,`source_type`,`target_id`,`target_type`),
  KEY `index_rs_evaluations_on_reputation_name` (`reputation_name`),
  KEY `index_rs_evaluations_on_target_id_and_target_type` (`target_id`,`target_type`),
  KEY `index_rs_evaluations_on_source_id_and_source_type` (`source_id`,`source_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `rs_reputation_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(11) DEFAULT NULL,
  `sender_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `weight` float DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rs_reputation_messages_on_receiver_id_and_sender` (`receiver_id`,`sender_id`,`sender_type`),
  KEY `index_rs_reputation_messages_on_sender_id_and_sender_type` (`sender_id`,`sender_type`),
  KEY `index_rs_reputation_messages_on_receiver_id` (`receiver_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `rs_reputations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reputation_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` float DEFAULT '0',
  `aggregated_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `target_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_rs_reputations_on_reputation_name_and_target` (`reputation_name`,`target_id`,`target_type`),
  KEY `index_rs_reputations_on_reputation_name` (`reputation_name`),
  KEY `index_rs_reputations_on_target_id_and_target_type` (`target_id`,`target_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `search_dataset` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `reindex` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `search_index` (
  `word` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `score` float DEFAULT NULL,
  KEY `sid_type` (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `search_node_links` (
  `sid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `nid` int(11) NOT NULL DEFAULT '0',
  `caption` longtext COLLATE utf8_unicode_ci,
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `search_total` (
  `word` int(11) NOT NULL AUTO_INCREMENT,
  `count` float DEFAULT NULL,
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `semaphore` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expire` float NOT NULL,
  PRIMARY KEY (`name`),
  KEY `expire` (`expire`),
  KEY `value` (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `sequences` (
  `value` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`value`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `sessions` (
  `uid` int(11) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ssid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hostname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `cache` int(11) NOT NULL DEFAULT '0',
  `session` longblob,
  KEY `ssid` (`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `shortcut_set` (
  `set_name` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `shortcut_set_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `set_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `site_verify` (
  `svid` int(11) NOT NULL AUTO_INCREMENT,
  `engine` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `file_contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `meta` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`svid`),
  KEY `engine` (`engine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deprecated` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `stylizer` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin_description` longtext COLLATE utf8_unicode_ci,
  `settings` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `system` (
  `filename` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `owner` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT '0',
  `bootstrap` int(11) NOT NULL DEFAULT '0',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1',
  `weight` int(11) NOT NULL DEFAULT '0',
  `info` blob,
  PRIMARY KEY (`filename`),
  KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`),
  KEY `type_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `tag_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `task_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `estimated_time` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxonomy_access_default` (
  `vid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0',
  `grant_view` tinyint(4) NOT NULL DEFAULT '0',
  `grant_update` tinyint(4) NOT NULL DEFAULT '0',
  `grant_delete` tinyint(4) NOT NULL DEFAULT '0',
  `grant_create` tinyint(4) NOT NULL DEFAULT '0',
  `grant_list` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxonomy_access_term` (
  `tid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0',
  `grant_view` tinyint(4) NOT NULL DEFAULT '0',
  `grant_update` tinyint(4) NOT NULL DEFAULT '0',
  `grant_delete` tinyint(4) NOT NULL DEFAULT '0',
  `grant_create` tinyint(4) NOT NULL DEFAULT '0',
  `grant_list` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxonomy_index` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `tid` int(11) NOT NULL DEFAULT '0',
  `sticky` tinyint(4) DEFAULT '0',
  `created` int(11) NOT NULL DEFAULT '0',
  KEY `nid` (`nid`),
  KEY `term_node` (`tid`,`sticky`,`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxonomy_term_data` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `vid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`),
  KEY `name` (`name`),
  KEY `vid_name` (`vid`,`name`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxonomy_term_hierarchy` (
  `tid` int(11) NOT NULL DEFAULT '0',
  `parent` int(11) NOT NULL DEFAULT '0',
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `taxonomy_vocabulary` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `machine_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `hierarchy` tinyint(4) NOT NULL DEFAULT '0',
  `module` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `url_alias` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `entity_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `entity_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mail` varchar(254) COLLATE utf8_unicode_ci DEFAULT '',
  `theme` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `signature` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `signature_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT '0',
  `access` int(11) NOT NULL DEFAULT '0',
  `login` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `timezone` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` int(11) NOT NULL DEFAULT '0',
  `init` varchar(254) COLLATE utf8_unicode_ci DEFAULT '',
  `data` longblob,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `users_roles` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0',
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `variable` (
  `name` int(11) NOT NULL AUTO_INCREMENT,
  `value` longblob NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `views_display` (
  `vid` int(11) NOT NULL DEFAULT '0',
  `id` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_title` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_plugin` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `position` int(11) DEFAULT '0',
  `display_options` longtext COLLATE utf8_unicode_ci,
  KEY `vid` (`vid`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `views_view` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `tag` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `base_table` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `human_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `core` int(11) DEFAULT '0',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `variables` longblob NOT NULL,
  `severity` tinyint(4) NOT NULL DEFAULT '0',
  `link` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `location` text COLLATE utf8_unicode_ci NOT NULL,
  `referer` text COLLATE utf8_unicode_ci,
  `hostname` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `confirmation` text COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT '<confirmation>',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `teaser` tinyint(4) NOT NULL DEFAULT '0',
  `allow_draft` tinyint(4) NOT NULL DEFAULT '0',
  `auto_save` tinyint(4) NOT NULL DEFAULT '0',
  `submit_notice` tinyint(4) NOT NULL DEFAULT '1',
  `submit_text` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `submit_limit` tinyint(4) NOT NULL DEFAULT '-1',
  `submit_interval` int(11) NOT NULL DEFAULT '-1',
  `total_submit_limit` int(11) NOT NULL DEFAULT '-1',
  `total_submit_interval` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform_component` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `pid` smallint(6) NOT NULL DEFAULT '0',
  `form_key` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `extra` text COLLATE utf8_unicode_ci NOT NULL,
  `mandatory` tinyint(4) NOT NULL DEFAULT '0',
  `weight` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform_emails` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `eid` smallint(6) NOT NULL DEFAULT '0',
  `email` text COLLATE utf8_unicode_ci,
  `subject` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `from_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `template` text COLLATE utf8_unicode_ci,
  `excluded_components` text COLLATE utf8_unicode_ci NOT NULL,
  `html` tinyint(4) NOT NULL DEFAULT '0',
  `attachments` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform_last_download` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `requested` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform_roles` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `rid` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform_submissions` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `nid` int(11) NOT NULL DEFAULT '0',
  `uid` int(11) NOT NULL DEFAULT '0',
  `is_draft` tinyint(4) NOT NULL DEFAULT '0',
  `submitted` int(11) NOT NULL DEFAULT '0',
  `remote_addr` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_nid` (`sid`,`nid`),
  KEY `nid_sid` (`nid`,`sid`),
  KEY `nid_uid_sid` (`nid`,`uid`,`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `webform_submitted_data` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `cid` smallint(6) NOT NULL DEFAULT '0',
  `no` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `data` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `wysiwyg` (
  `format` int(11) NOT NULL AUTO_INCREMENT,
  `editor` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `settings` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `wysiwyg_user` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  KEY `format` (`format`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO schema_migrations (version) VALUES ('20120000000001');

INSERT INTO schema_migrations (version) VALUES ('20120806064945');

INSERT INTO schema_migrations (version) VALUES ('20120828234929');

INSERT INTO schema_migrations (version) VALUES ('20120902001824');

INSERT INTO schema_migrations (version) VALUES ('20120902131112');

INSERT INTO schema_migrations (version) VALUES ('20120902192055');

INSERT INTO schema_migrations (version) VALUES ('20120903061809');

INSERT INTO schema_migrations (version) VALUES ('20120906011451');

INSERT INTO schema_migrations (version) VALUES ('20120907012840');

INSERT INTO schema_migrations (version) VALUES ('20120907015507');

INSERT INTO schema_migrations (version) VALUES ('20120908031104');

INSERT INTO schema_migrations (version) VALUES ('20120908031105');

INSERT INTO schema_migrations (version) VALUES ('20120908031106');

INSERT INTO schema_migrations (version) VALUES ('20120908031107');

INSERT INTO schema_migrations (version) VALUES ('20120908031108');

INSERT INTO schema_migrations (version) VALUES ('20120908031109');

INSERT INTO schema_migrations (version) VALUES ('20120908031110');

INSERT INTO schema_migrations (version) VALUES ('20120908183537');

INSERT INTO schema_migrations (version) VALUES ('20120909055820');

INSERT INTO schema_migrations (version) VALUES ('20120909055842');

INSERT INTO schema_migrations (version) VALUES ('20120909194435');

INSERT INTO schema_migrations (version) VALUES ('20120909195624');

INSERT INTO schema_migrations (version) VALUES ('20120909200426');

INSERT INTO schema_migrations (version) VALUES ('20120914015637');

INSERT INTO schema_migrations (version) VALUES ('20120918235344');

INSERT INTO schema_migrations (version) VALUES ('20120920054343');

INSERT INTO schema_migrations (version) VALUES ('20120920073643');

INSERT INTO schema_migrations (version) VALUES ('20120923062555');

INSERT INTO schema_migrations (version) VALUES ('20120928001805');

INSERT INTO schema_migrations (version) VALUES ('20120929225158');

INSERT INTO schema_migrations (version) VALUES ('20120929225922');

INSERT INTO schema_migrations (version) VALUES ('20121007000758');

INSERT INTO schema_migrations (version) VALUES ('20121011080031');

INSERT INTO schema_migrations (version) VALUES ('20121016070546');

INSERT INTO schema_migrations (version) VALUES ('20121018031834');

INSERT INTO schema_migrations (version) VALUES ('20121018032248');

INSERT INTO schema_migrations (version) VALUES ('20121022145507');

INSERT INTO schema_migrations (version) VALUES ('20121027191731');

INSERT INTO schema_migrations (version) VALUES ('20121029074448');