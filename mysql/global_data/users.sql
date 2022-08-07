create table users
(
    id                                                       bigint unsigned auto_increment comment 'Unique number assigned to each user.'
        primary key,
    oauth_client_id                                                varchar(255)                         not null,
    username                                               varchar(60)                          null comment 'Unique username for the user.',
    email                                               varchar(100)                         null comment 'Email address of the user.',
    user_url                                                 varchar(2083)                        null comment 'URL of the user, e.g. website address.',
    display_name                                             varchar(250)                         null comment 'Desired name to be used publicly in the site, can be username, slug, first name or last name defined in user_meta.',
    image_url                                             varchar(2083)                        null,
    updated_at                                               timestamp  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    created_at                                               timestamp  default CURRENT_TIMESTAMP not null,
    time_zone_offset                                         int                                  null comment 'The time-zone offset is the difference, in minutes, between UTC and local time. Note that this means that the offset is positive if the local timezone is behind UTC (i.e. UTC−06:00 Central) and negative if it is ahead.',
    deleted_at                                               timestamp                            null,
    track_location                                           tinyint(1) default 0                 null comment 'Set to true if the user wants to track their location',
    combine_notifications                                    tinyint(1) default 0                 null comment 'Should we combine push notifications or send one for each tracking reminder notification?',
    send_reminder_notification_emails                        tinyint(1) default 0                 null comment 'Should we send reminder notification emails?',
    send_predictor_emails                                    tinyint(1) default 1                 null comment 'Should we send predictor emails?',
    last_sms_tracking_reminder_notification_id               bigint unsigned                      null,
    sms_notifications_enabled                                tinyint(1) default 0                 null comment 'Should we send tracking reminder notifications via tex messages?',
    phone_verification_code                                  varchar(25)                          null,
    phone_number                                             varchar(25)                          null,
    has_android_app                                          tinyint(1) default 0                 null,
    has_ios_app                                              tinyint(1) default 0                 null,
    has_chrome_extension                                     tinyint(1) default 0                 null,
    referrer_user_id                                         bigint unsigned                      null,
    address                                                  varchar(255)                         null,
    birthday                                                 varchar(255)                         null,
    country                                                  varchar(255)                         null,
    cover_photo                                              varchar(2083)                        null,
    currency                                                 varchar(255)                         null,
    first_name                                               varchar(255)                         null,
    gender                                                   varchar(255)                         null,
    language                                                 varchar(255)                         null,
    last_name                                                varchar(255)                         null,
    state                                                    varchar(255)                         null,
    tag_line                                                 varchar(255)                         null,
    verified                                                 varchar(255)                         null,
    zip_code                                                 varchar(255)                         null,
    spam                                                     tinyint(2) default 0                 not null,
    last_login_at                                            timestamp                            null,
    timezone                                                 varchar(255)                         null,
    number_of_relationships                                   int                                  null,
    number_of_connections                                    int                                  null,
    number_of_tracking_reminders                             int                                  null,
    number_of_user_variables                                 int                                  null,
    number_of_raw_measurements_with_tags                     int                                  null,
    number_of_raw_measurements_with_tags_at_last_relationship int                                  null,
    number_of_votes                                          int                                  null,
    number_of_studies                                        int                                  null,
    last_relationship_at                                      timestamp                            null,
    last_email_at                                            timestamp                            null,
    last_push_at                                             timestamp                            null,
    primary_outcome_global_variable_id                              int unsigned                         null,
    analysis_ended_at                                        timestamp                            null,
    analysis_requested_at                                    timestamp                            null,
    analysis_started_at                                      timestamp                            null,
    internal_error_message                                   text                                 null,
    newest_data_at                                           timestamp                            null,
    reason_for_analysis                                      varchar(255)                         null,
    user_error_message                                       text                                 null,
    status                                                   varchar(25)                          null,
    analysis_settings_modified_at                            timestamp                            null,
    number_of_oauth_access_tokens                            int unsigned                         null comment 'Number of OAuth Access Tokens for this User.
                [Formula:
                    update users
                        left join (
                            select count(access_token) as total, user_id
                            from oauth_access_tokens
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_oauth_access_tokens = count(grouped.total)
                ]
                ',
    number_of_oauth_clients                                  int unsigned                         null comment 'Number of OAuth Clients for this User.
                [Formula:
                    update users
                        left join (
                            select count(oauth_client_id) as total, user_id
                            from oauth_clients
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_oauth_clients = count(grouped.total)
                ]
                ',
    number_of_connector_imports                              int unsigned                         null comment 'Number of Connector Imports for this User.
                [Formula:
                    update users
                        left join (
                            select count(id) as total, user_id
                            from connector_imports
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_connector_imports = count(grouped.total)
                ]
                ',
    number_of_connector_requests                             int unsigned                         null comment 'Number of Connector Requests for this User.
                [Formula:
                    update users
                        left join (
                            select count(id) as total, user_id
                            from connector_requests
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_connector_requests = count(grouped.total)
                ]
                ',
    number_of_measurement_exports                            int unsigned                         null comment 'Number of Measurement Exports for this User.
                    [Formula: update users
                        left join (
                            select count(id) as total, user_id
                            from measurement_exports
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_measurement_exports = count(grouped.total)]',
    number_of_measurement_file_imports                            int unsigned                         null comment 'Number of Measurement Imports for this User.
                    [Formula: update users
                        left join (
                            select count(id) as total, user_id
                            from measurement_file_imports
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_measurement_file_imports = count(grouped.total)]',
    number_of_measurements                                   int unsigned                         null comment 'Number of Measurements for this User.
                    [Formula: update users
                        left join (
                            select count(id) as total, user_id
                            from measurements
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_measurements = count(grouped.total)]',
    number_of_sent_emails                                    int unsigned                         null comment 'Number of Sent Emails for this User.
                    [Formula: update users
                        left join (
                            select count(id) as total, user_id
                            from sent_emails
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_sent_emails = count(grouped.total)]',
    number_of_tracking_reminder_notifications                int unsigned                         null comment 'Number of Tracking Reminder Notifications for this User.
                    [Formula: update users
                        left join (
                            select count(id) as total, user_id
                            from tracking_reminder_notifications
                            group by user_id
                        )
                        as grouped on users.id = grouped.user_id
                    set users.number_of_tracking_reminder_notifications = count(grouped.total)]',
    share_all_data                                           tinyint(1) default 0                 not null,
    deletion_reason                                          varchar(280)                         null comment 'The reason the user deleted their account.',
    number_of_patients                                       int unsigned                         not null,
    is_public                                                tinyint(1)                           null,
    sort_order                                               int                                  not null,
    number_of_sharers                                        int unsigned                         not null comment 'Number of people sharing their data with you.',
    number_of_trustees                                       int unsigned                         not null comment 'Number of people that you are sharing your data with.',
    slug                                                     varchar(200)                         null comment 'The slug is the part of a URL that identifies a page in human-readable keywords.',
    constraint email
        unique (email),
    constraint username_key
        unique (username),
    constraint users_slug_uindex
        unique (slug),
    constraint users_variables_id_fk
        foreign key (primary_outcome_global_variable_id) references global_variables (id)
)
    comment 'General user information and overall statistics' charset = utf8;

create index slug
    on users (slug);


