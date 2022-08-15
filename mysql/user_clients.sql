create table user_clients
(
    id                      int auto_increment
        primary key,
    oauth_client_id               varchar(80)                         null,
    created_at              timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    deleted_at              timestamp                           null,
    earliest_measurement_at timestamp                           null comment 'Earliest measurement time for this variable and client',
    latest_measurement_at   timestamp                           null comment 'Earliest measurement time for this variable and client',
    number_of_measurements  int unsigned                        null,
    updated_at              timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    user_id                 bigint unsigned                     not null,
    constraint user
        unique (user_id, oauth_client_id),
    constraint user_clients_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint user_clients_user_id_fk
        foreign key (user_id) references users (id)
)
    comment 'Data sources for each user' charset = utf8;

