create table intuitive_treatments
(
    id                     int auto_increment
        primary key,
    name                   varchar(100)                        not null,
    global_variable_id            int unsigned                        not null,
    updated_at             timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    created_at             timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    deleted_at             timestamp                           null,
    number_of_conditions   int unsigned                        null,
    number_of_side_effects int unsigned                        not null,
    constraint treName
        unique (name),
    constraint ct_treatments_variables_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'User self-reported treatments' charset = utf8;

