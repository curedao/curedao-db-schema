create table variable_user_sources
(
    user_id                       bigint unsigned                     not null,
    global_variable_id                   int unsigned                        not null comment 'ID of variable',
    created_at                    timestamp default CURRENT_TIMESTAMP not null,
    updated_at                    timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at                    timestamp                           null,
    data_source_name              varchar(80)                         not null,
    number_of_raw_measurements    int                                 null,
    client_id                     varchar(255)                        null,
    id                            int auto_increment
        primary key,
    user_variable_id              int unsigned                        not null,
    earliest_measurement_start_at timestamp                           null,
    latest_measurement_start_at   timestamp                           null,
    constraint user
        unique (user_id, global_variable_id, data_source_name),
    constraint variable_user_sources_client_id_fk
        foreign key (client_id) references oauth_clients (id),
    constraint variable_user_sources_user_id_fk
        foreign key (user_id) references users (id),
    constraint variable_user_sources_user_variables_user_id_gv_id_fk
        foreign key (user_id, global_variable_id) references user_variables (user_id, global_variable_id),
    constraint variable_user_sources_user_variables_user_variable_id_fk
        foreign key (user_variable_id) references user_variables (id)
            on update cascade on delete cascade,
    constraint variable_user_sources_gv_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'Information about variable data obtained from specific data sources for specific users.' charset = utf8;

create index variable_user_sources_user_variables_global_variable_id_user_id_fk
    on variable_user_sources (global_variable_id, user_id);

