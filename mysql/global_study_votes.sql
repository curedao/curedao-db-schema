create table global_study_votes
(
    id                       int auto_increment
        primary key,
    oauth_client_id                varchar(80)                         null,
    user_id                  bigint unsigned                     not null,
    value                    int                                 not null comment 'Value of Vote',
    created_at               timestamp default CURRENT_TIMESTAMP not null,
    updated_at               timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at               timestamp                           null,
    predictor_global_variable_id        int unsigned                        not null,
    outcome_global_variable_id       int unsigned                        not null,
    relationship_id           int                                 null,
    global_variable_relationship_id int                                 null,
    is_public                tinyint(1)                          null,
    constraint votes_user_id_predictor_gv_id_outcome_gv_id_uindex
        unique (user_id, predictor_global_variable_id, outcome_global_variable_id),
    constraint votes_gv_relationships_id_fk
        foreign key (global_variable_relationship_id) references global_variable_relationships (id)
            on delete set null,
    constraint votes_predictor_gv_id_fk
        foreign key (predictor_global_variable_id) references global_variables (id),
    constraint votes_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint votes_relationships_id_fk
        foreign key (relationship_id) references user_variable_relationships (id),
    constraint votes_outcome_gv_id_fk_2
        foreign key (outcome_global_variable_id) references global_variables (id),
    constraint votes_user_id_fk
        foreign key (user_id) references users (id)
)
    comment 'Vote thumbs down button for relationships that you think are coincidences and thumbs up for relationships with a plausible causal explanation.'
    charset = utf8;

create index votes_predictor_gv_id_index
    on global_study_votes (predictor_global_variable_id);

create index votes_outcome_gv_id_index
    on global_study_votes (outcome_global_variable_id);

