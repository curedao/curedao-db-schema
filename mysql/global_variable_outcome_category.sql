create table variable_outcome_category
(
    id                          int auto_increment
        primary key,
    global_variable_id                 int unsigned                        not null,
    variable_category_id        tinyint unsigned                    not null,
    number_of_outcome_variables int unsigned                        not null,
    created_at                  timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    updated_at                  timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    deleted_at                  timestamp                           null,
    constraint global_variable_id_variable_category_id_uindex
        unique (global_variable_id, variable_category_id),
    constraint variable_outcome_category_variable_categories_id_fk
        foreign key (variable_category_id) references variable_categories (id),
    constraint variable_outcome_category_variables_id_fk
        foreign key (global_variable_id) references global_variables (id)
)
    charset = latin1;

