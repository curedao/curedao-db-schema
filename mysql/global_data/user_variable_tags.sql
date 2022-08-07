create table user_variable_tags
(
    id                      int unsigned auto_increment
        primary key,
    tagged_global_variable_id      int unsigned                        not null comment 'This is the id of the variable being tagged with an ingredient or something.',
    tag_global_variable_id         int unsigned                        not null comment 'This is the id of the ingredient variable whose value is determined based on the value of the tagged variable.',
    conversion_factor       double                              not null comment 'Number by which we multiply the tagged variable''s value to obtain the tag variable''s value',
    user_id                 bigint unsigned                     not null,
    created_at              timestamp default CURRENT_TIMESTAMP not null,
    updated_at              timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    oauth_client_id               varchar(80)                         null,
    deleted_at              timestamp                           null,
    tagged_user_variable_id int unsigned                        null,
    tag_user_variable_id    int unsigned                        null,
    constraint UK_user_tag_tagged
        unique (tagged_global_variable_id, tag_global_variable_id, user_id),
    constraint user_tags_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint user_tags_tag_user_variable_id_fk
        foreign key (tag_user_variable_id) references user_variables (id),
    constraint user_tags_tag_gv_id_variables_id_fk
        foreign key (tag_global_variable_id) references global_variables (id),
    constraint user_tags_tagged_user_variable_id_fk
        foreign key (tagged_user_variable_id) references user_variables (id),
    constraint user_tags_tagged_gv_id_variables_id_fk
        foreign key (tagged_global_variable_id) references global_variables (id),
    constraint user_tags_user_id_fk
        foreign key (user_id) references users (id)
)
    comment 'User self-reported variable tags, used to infer the user intake of the different ingredients by just entering the foods. The inferred intake levels will then be used to determine the outcomes of different nutrients on the user during analysis.'
    charset = utf8;

create index fk_conversionUnit
    on user_variable_tags (tag_global_variable_id);

