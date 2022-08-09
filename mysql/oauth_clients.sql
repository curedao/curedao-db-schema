create table oauth_clients
(
    id                     bigint unsigned auto_increment
        primary key,
    user_id                bigint unsigned null,
    name                   varchar(255)    not null,
    secret                 varchar(100)    null,
    provider               varchar(255)    null,
    redirect               text            not null,
    personal_access_client tinyint(1)      not null,
    password_client        tinyint(1)      not null,
    revoked                tinyint(1)      not null,
    created_at             timestamp       null,
    updated_at             timestamp       null
)
    collate = utf8mb4_unicode_ci;

create index oauth_clients_user_id_index
    on oauth_clients (user_id);

