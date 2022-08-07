create table measurement_exports
(
    id            int(10) auto_increment
        primary key,
    user_id       bigint unsigned                                      not null,
    oauth_client_id     varchar(255)                                         null,
    status        varchar(32)                                          not null comment 'Status of Measurement Export',
    type          enum ('user', 'app')       default 'user'            not null comment 'Whether user''s measurement export request or app users',
    output_type   enum ('csv', 'xls', 'pdf') default 'csv'             not null comment 'Output type of export file',
    error_message varchar(255)                                         null comment 'Error message',
    created_at    timestamp                  default CURRENT_TIMESTAMP not null,
    updated_at    timestamp                  default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at    timestamp                                            null,
    constraint measurement_exports_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint measurement_exports_user_id_fk
        foreign key (user_id) references users (id)
)
    comment 'A request from a user to export their data as a spreadsheet.' charset = utf8;

