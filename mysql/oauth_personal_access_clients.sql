create table oauth_personal_access_clients
(
    id         bigint unsigned auto_increment
        primary key,
    oauth_client_id  bigint unsigned not null,
    created_at timestamp       null,
    updated_at timestamp       null
)
    collate = utf8mb4_unicode_ci;

