create table intuitive_relationships
(
    id                            int auto_increment
        primary key,
    user_id                       int                                   not null,
    correlation_coefficient       float(10, 4)                          null,
    predictor_variable_id             int unsigned                          not null,
    outcome_variable_id            int unsigned                          not null,
    onset_delay                   int                                   null,
    duration_of_action            int                                   null,
    number_of_pairs               int                                   null,
    value_predicting_high_outcome double                                null,
    value_predicting_low_outcome  double                                null,
    optimal_pearson_product       double                                null,
    vote                          float(3, 1) default 0.5               null,
    statistical_significance      float(10, 4)                          null,
    predictor_unit_id                 int                                   null,
    predictor_changes                 int                                   null,
    outcome_changes                int                                   null,
    qm_score                      double                                null,
    error                         text                                  null,
    created_at                    timestamp   default CURRENT_TIMESTAMP not null,
    updated_at                    timestamp   default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    deleted_at                    timestamp                             null,
    constraint user
        unique (user_id, predictor_variable_id, outcome_variable_id)
)
    comment 'Stores Calculated Correlation Coefficients' charset = utf8;

create index predictor
    on intuitive_relationships (predictor_variable_id);

create index outcome
    on intuitive_relationships (outcome_variable_id);

