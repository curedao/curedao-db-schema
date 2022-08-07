create table measurements
(
    id                   bigint auto_increment
        primary key,
    user_id              bigint unsigned                     not null comment 'Unique ID representing the owner of the measurement',
    oauth_client_id            varchar(80)                         not null comment 'ID of the client application that
submitted the measurement on behalf of the user',
    connector_id         int unsigned                        null comment 'The id for the connector data source from which the measurement was obtained',
    global_variable_id          int unsigned                        not null comment 'ID of the variable for which we are creating the measurement records',
    start_at           int unsigned                        not null comment 'Start time for the measurement event in ISO 8601',
    value                double                              not null comment 'The value of the measurement after conversion to the default unit for that variable',
    unit_id              smallint unsigned                   not null comment 'The default unit for the variable',
    original_value       double                              not null comment 'Value of measurement as originally posted (before conversion to default unit)',
    original_unit_id     smallint unsigned                   not null comment 'Unit id of measurement as originally submitted',
    duration             int(10)                             null comment 'Duration of the event being measurement in seconds',
    note                 text                                null comment 'An optional note the user may include with their measurement',
    latitude             double                              null comment 'Latitude at which the measurement was taken',
    longitude            double                              null comment 'Longitude at which the measurement was taken',
    location             varchar(255)                        null comment 'location',
    created_at           timestamp default CURRENT_TIMESTAMP not null,
    updated_at           timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    error                text                                null comment 'An error message if there is a problem with the measurement',
    variable_category_id tinyint unsigned                    not null comment 'Variable category ID',
    deleted_at           datetime                            null,
    user_variable_id     int unsigned                        not null,
    connection_id        int(11) unsigned                    null,
    connector_import_id  int(11) unsigned                    null,
    deletion_reason      varchar(280)                        null comment 'The reason the variable was deleted.',
    original_start_at    timestamp                           not null,
    constraint measurements_pk
        unique (user_id, global_variable_id, start_at),
    constraint measurements_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint measurements_connections_id_fk
        foreign key (connection_id) references api_connections (id),
    constraint measurements_connector_imports_id_fk
        foreign key (connector_import_id) references api_connector_imports (id),
    constraint measurements_connectors_id_fk
        foreign key (connector_id) references api_connectors (id),
    constraint measurements_original_unit_id_fk
        foreign key (original_unit_id) references units (id),
    constraint measurements_unit_id_fk
        foreign key (unit_id) references units (id),
    constraint measurements_user_id_fk
        foreign key (user_id) references users (id),
    constraint measurements_user_variables_user_variable_id_fk
        foreign key (user_variable_id) references user_variables (id),
    constraint measurements_variable_category_id_fk
        foreign key (variable_category_id) references variable_categories (id),
    constraint measurements_variables_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'Measurements are any value that can be recorded like daily steps, a mood rating, or apples eaten.'
    charset = utf8;

create index measurements_start_at_index
    on measurements (start_at);

create index measurements_user_id_variable_category_id_start_at_index
    on measurements (user_id, variable_category_id, start_at);

create index measurements_user_variables_gv_id_user_id_fk
    on measurements (global_variable_id, user_id);

create index measurements_gv_id_start_at_index
    on measurements (global_variable_id, start_at);

create index measurements_gv_id_value_start_at_index
    on measurements (global_variable_id, value, start_at);

