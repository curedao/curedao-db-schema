create table oauth_access_tokens
(
    id         varchar(100)    not null
        primary key,
    user_id    bigint unsigned null,
    client_id  bigint unsigned not null,
    name       varchar(255)    null,
    scopes     text            null,
    revoked    tinyint(1)      not null,
    created_at timestamp       null,
    updated_at timestamp       null,
    expires_at datetime        null
)
    collate = utf8mb4_unicode_ci;

create index oauth_access_tokens_user_id_index
    on oauth_access_tokens (user_id);

