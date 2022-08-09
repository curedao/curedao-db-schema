create table global_study_usefulness_votes
(
    id                       int(11) unsigned auto_increment
        primary key,
    predictor_global_variable_id        int(11) unsigned                    not null,
    outcome_global_variable_id       int(11) unsigned                    not null,
    relationship_id           int                                 null,
    global_variable_relationship_id int                                 null,
    user_id                  bigint unsigned                     not null,
    vote                     int                                 not null comment 'The opinion of the data owner on whether or not knowledge of this
                    relationship is useful in helping them improve an outcome of interest.
                    -1 corresponds to a down vote. 1 corresponds to an up vote. 0 corresponds to removal of a
                    previous vote.  null corresponds to never having voted before.',
    created_at               timestamp default CURRENT_TIMESTAMP not null,
    updated_at               timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at               timestamp                           null,
    oauth_client_id                varchar(80) charset utf8            null,
    is_public                tinyint(1)                          null,
    constraint relationship_usefulness_votes_user_predictor_outcome_uindex
        unique (user_id, predictor_global_variable_id, outcome_global_variable_id),
    constraint relationship_usefulness_votes_gv_relationships_id_fk
        foreign key (global_variable_relationship_id) references global_variable_relationships (id),
    constraint relationship_usefulness_votes_predictor_variables_id_fk
        foreign key (predictor_global_variable_id) references global_variables (id),
    constraint relationship_usefulness_votes_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint relationship_usefulness_votes_relationships_id_fk
        foreign key (relationship_id) references user_variable_relationships (id),
    constraint relationship_usefulness_votes_outcome_variables_id_fk
        foreign key (outcome_global_variable_id) references global_variables (id),
    constraint relationship_usefulness_votes_users_id_fk
        foreign key (user_id) references users (id)
)
    comment 'The opinion of the data owner on whether or not knowledge of this relationship is useful in helping them improve an outcome of interest. -1 corresponds to a down vote. 1 corresponds to an up vote. 0 corresponds to removal of a previous vote.  null corresponds to never having voted before.';

