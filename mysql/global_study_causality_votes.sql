create table global_study_causality_votes
(
    id                       int(11) unsigned auto_increment
        primary key,
    predictor_global_variable_id        int(11) unsigned                    not null,
    outcome_global_variable_id       int(11) unsigned                    not null,
    relationship_id           int                                 null,
    global_variable_relationship_id int                                 null,
    user_id                  bigint unsigned                     not null,
    vote                     int                                 not null comment 'The opinion of the data owner on whether or not there is a plausible
                                mechanism of action by which the predictor variable could influence the outcome variable.',
    created_at               timestamp            default CURRENT_TIMESTAMP  not null comment 'When the DB record was first created',
    updated_at               timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP comment 'When the DB record was last updated.',
    deleted_at               timestamp                           null,
    oauth_client_id                varchar(80) charset utf8            null,
    is_public                tinyint(1)                          null,
    constraint relationship_causality_votes_user_predictor_outcome_uindex
        unique (user_id, predictor_global_variable_id, outcome_global_variable_id),
    constraint relationship_causality_votes_gv_relationships_id_fk
        foreign key (global_variable_relationship_id) references global_variable_relationships (id),
    constraint relationship_causality_votes_predictor_variables_id_fk
        foreign key (predictor_global_variable_id) references global_variables (id),
    constraint relationship_causality_votes_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint relationship_causality_votes_relationships_id_fk
        foreign key (relationship_id) references user_variable_relationships (id),
    constraint relationship_causality_votes_outcome_variables_id_fk
        foreign key (outcome_global_variable_id) references global_variables (id),
    constraint relationship_causality_votes_users_id_fk
        foreign key (user_id) references users (id)
)
    comment 'The opinion of the data owner on whether or not there is a plausible mechanism of action by which the predictor variable could influence the outcome variable.'
    charset = latin1;

