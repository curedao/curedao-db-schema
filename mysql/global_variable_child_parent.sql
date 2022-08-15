create table global_variable_child_parent
(
    id                        int unsigned auto_increment
        primary key,
    child_global_variable_id  int unsigned                        not null comment 'This is the id of the variable being tagged with an ingredient or something.',
    parent_global_variable_id int unsigned                        not null comment 'This is the id of the ingredient variable whose value is determined based on the value of the tagged variable.',
    oauth_client_id                 varchar(80)                         null,
    created_at                timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    updated_at                timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    deleted_at                timestamp                           null,
    constraint UK_tag_tagged
        unique (child_global_variable_id, parent_global_variable_id),
    constraint common_tags_oauth_client_id_fk_copy
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint common_tags_tag_gv_id_variables_id_fk_copy
        foreign key (parent_global_variable_id) references global_variables (id),
    constraint common_tags_tagged_gv_id_variables_id_fk_copy
        foreign key (child_global_variable_id) references global_variables (id)
)
    comment 'Variable tags are used to infer the user intake of the different ingredients by just entering the foods. The inferred intake levels will then be used to determine the outcomes of different nutrients on the user during analysis.'
    charset = utf8;

create index common_tags_oauth_client_id_fk
    on global_variable_child_parent (oauth_client_id);

create index common_tags_tag_gv_id_variables_id_fk
    on global_variable_child_parent (parent_global_variable_id);

