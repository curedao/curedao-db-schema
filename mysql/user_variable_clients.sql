create table user_variable_clients
(
    id                      int auto_increment
        primary key,
    oauth_client_id               varchar(80)                         not null,
    created_at              timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    deleted_at              timestamp                           null,
    earliest_measurement_at timestamp                           null comment 'Earliest measurement time for this variable and client',
    latest_measurement_at   timestamp                           null comment 'Earliest measurement time for this variable and client',
    number_of_measurements  int unsigned                        null,
    updated_at              timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    user_id                 bigint unsigned                     not null,
    user_variable_id        int(11) unsigned                    not null,
    global_variable_id             int(11) unsigned                    not null comment 'Id of variable',
    constraint user
        unique (user_id, global_variable_id, oauth_client_id),
    constraint user_variable_clients_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint user_variable_clients_user_id_fk
        foreign key (user_id) references users (id),
    constraint user_variable_clients_user_variables_user_variable_id_fk
        foreign key (user_variable_id) references user_variables (id),
    constraint user_variable_clients_gv_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'Information about variable data obtained from specific data sources for specific users.' charset = utf8;

