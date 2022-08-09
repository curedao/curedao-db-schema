create table intuitive_condition_cause
(
    id                    int auto_increment
        primary key,
    condition_id          int                                 not null,
    predictor_id              int                                 not null,
    condition_global_variable_id int unsigned                        not null,
    predictor_global_variable_id     int unsigned                        not null,
    votes_percent         int                                 not null,
    updated_at            timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    created_at            timestamp default CURRENT_TIMESTAMP not null,
    deleted_at            timestamp                           null,
    constraint ct_condition_cause_predictor_id_condition_id_uindex
        unique (predictor_id, condition_id),
    constraint ct_condition_cause_predictor_uindex
        unique (predictor_global_variable_id, condition_global_variable_id),
    constraint ct_condition_cause_ct_predictors_predictor_fk
        foreign key (predictor_id) references intuitive_predictors (id),
    constraint ct_condition_cause_ct_conditions_id_condition_fk
        foreign key (condition_id) references intuitive_conditions (id),
    constraint ct_condition_cause_variables_id_condition_fk
        foreign key (condition_global_variable_id) references global_variables (id),
    constraint ct_condition_cause_variables_id_fk
        foreign key (predictor_global_variable_id) references global_variables (id)
)
    comment 'User self-reported conditions and predictors' charset = utf8;

