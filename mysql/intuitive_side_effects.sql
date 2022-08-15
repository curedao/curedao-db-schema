create table intuitive_side_effects
(
    id                   int auto_increment
        primary key,
    name                 varchar(100)                        not null,
    global_variable_id          int unsigned                        not null,
    updated_at           timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    created_at           timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    deleted_at           timestamp                           null,
    number_of_treatments int unsigned                        not null,
    constraint ct_side_effects_gv_id_uindex
        unique (global_variable_id),
    constraint seName
        unique (name),
    constraint ct_side_effects_variables_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'User self-reported side outcome names' charset = utf8;

