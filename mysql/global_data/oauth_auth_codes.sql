create table oauth_auth_codes
(
    id         varchar(100)    not null
        primary key,
    user_id    bigint unsigned not null,
    client_id  bigint unsigned not null,
    scopes     text            null,
    revoked    tinyint(1)      not null,
    expires_at datetime        null
)
    collate = utf8mb4_unicode_ci;

create index oauth_auth_codes_user_id_index
    on oauth_auth_codes (user_id);

