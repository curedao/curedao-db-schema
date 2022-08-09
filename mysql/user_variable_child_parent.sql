create table user_variable_child_parent
(
    id                      int unsigned auto_increment
        primary key,
    child_user_variable_id  int unsigned                        not null comment 'This is the id of the user variable being tagged with an ingredient or something.',
    parent_user_variable_id int unsigned                        not null comment 'This is the id of the ingredient user variable whose value is determined based on the value of the tagged user variable.',
    oauth_client_id               varchar(80)                         null,
    created_at              timestamp default CURRENT_TIMESTAMP not null,
    updated_at              timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at              timestamp                           null,
    constraint UK_tag_tagged
        unique (child_user_variable_id, parent_user_variable_id),
    constraint user_variable_child_id_fk
        foreign key (child_user_variable_id) references user_variables (id),
    constraint user_variable_child_parent_oauth_client_id_fk_copy
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint user_variable_parent_id_fk
        foreign key (parent_user_variable_id) references user_variables (id)
)
    comment 'Child variable measurements are included when
the parent category variable measurements are fetched.' charset = utf8;

create index user_variable_child_parent_oauth_client_id_fk
    on user_variable_child_parent (oauth_client_id);

create index user_variable_child_parent_id_fk
    on user_variable_child_parent (parent_user_variable_id);

