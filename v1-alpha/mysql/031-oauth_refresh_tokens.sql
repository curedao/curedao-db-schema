create table if not exists oauth_refresh_tokens
(
    id              varchar(100) null,
    access_token_id varchar(100) null,
    revoked         tinyint      null,
    expires_at      datetime     null
);

