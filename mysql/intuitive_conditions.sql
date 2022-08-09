create table intuitive_conditions
(
    id                   int auto_increment
        primary key,
    name                 varchar(100)                        not null,
    global_variable_id          int unsigned                        not null,
    updated_at           timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    created_at           timestamp default CURRENT_TIMESTAMP not null,
    deleted_at           timestamp                           null,
    number_of_treatments int unsigned                        not null,
    number_of_symptoms   int unsigned                        null,
    number_of_predictors     int unsigned                        not null,
    constraint conName
        unique (name),
    constraint ct_conditions_gv_id_uindex
        unique (global_variable_id),
    constraint ct_conditions_variables_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    comment 'User self-reported condition names' charset = utf8;

