create table global_study_votes
(
    id                       int auto_increment
        primary key,
    client_id                varchar(80)                         null,
    user_id                  bigint unsigned                     not null,
    value                    int                                 not null comment 'Value of Vote',
    created_at               timestamp default CURRENT_TIMESTAMP not null,
    updated_at               timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at               timestamp                           null,
    predictor_variable_id        int unsigned                        not null,
    outcome_variable_id       int unsigned                        not null,
    correlation_id           int                                 null,
    aggregate_correlation_id int                                 null,
    is_public                tinyint(1)                          null,
    constraint votes_user_id_predictor_variable_id_outcome_variable_id_uindex
        unique (user_id, predictor_variable_id, outcome_variable_id),
    constraint votes_aggregate_correlations_id_fk
        foreign key (aggregate_correlation_id) references global_study_results (id)
            on delete set null,
    constraint votes_predictor_variable_id_fk
        foreign key (predictor_variable_id) references global_variables (id),
    constraint votes_client_id_fk
        foreign key (client_id) references oauth_clients (id),
    constraint votes_correlations_id_fk
        foreign key (correlation_id) references user_study_results (id),
    constraint votes_outcome_variable_id_fk_2
        foreign key (outcome_variable_id) references global_variables (id),
    constraint votes_user_id_fk
        foreign key (user_id) references users (id)
)
    comment 'Vote thumbs down button for relationships that you think are coincidences and thumbs up for correlations with a plausible causal explanation.'
    charset = utf8;

create index votes_predictor_variable_id_index
    on global_study_votes (predictor_variable_id);

create index votes_outcome_variable_id_index
    on global_study_votes (outcome_variable_id);
