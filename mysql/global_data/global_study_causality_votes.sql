create table global_study_causality_votes
(
    id                       int(11) unsigned auto_increment
        primary key,
    predictor_variable_id        int(11) unsigned                    not null,
    outcome_variable_id       int(11) unsigned                    not null,
    correlation_id           int                                 null,
    aggregate_correlation_id int                                 null,
    user_id                  bigint unsigned                     not null,
    vote                     int                                 not null comment 'The opinion of the data owner on whether or not there is a plausible
                                mechanism of action by which the predictor variable could influence the outcome variable.',
    created_at               timestamp default CURRENT_TIMESTAMP not null,
    updated_at               timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at               timestamp                           null,
    client_id                varchar(80) charset utf8            null,
    is_public                tinyint(1)                          null,
    constraint correlation_causality_votes_user_predictor_outcome_uindex
        unique (user_id, predictor_variable_id, outcome_variable_id),
    constraint correlation_causality_votes_aggregate_correlations_id_fk
        foreign key (aggregate_correlation_id) references global_study_results (id),
    constraint correlation_causality_votes_predictor_variables_id_fk
        foreign key (predictor_variable_id) references global_variables (id),
    constraint correlation_causality_votes_client_id_fk
        foreign key (client_id) references oauth_clients (id),
    constraint correlation_causality_votes_correlations_id_fk
        foreign key (correlation_id) references user_study_results (id),
    constraint correlation_causality_votes_outcome_variables_id_fk
        foreign key (outcome_variable_id) references global_variables (id),
    constraint correlation_causality_votes_users_id_fk
        foreign key (user_id) references users (id)
)
    comment 'The opinion of the data owner on whether or not there is a plausible mechanism of action by which the predictor variable could influence the outcome variable.'
    charset = latin1;

