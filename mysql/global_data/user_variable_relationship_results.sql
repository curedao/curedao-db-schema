create table user_variable_relationships
(
    id                                                           int auto_increment
        primary key,
    user_id                                                      bigint unsigned                                                 not null,
    predictor_global_variable_id                                            int unsigned                                                    not null,
    outcome_global_variable_id                                           int unsigned                                                    not null,
    sinn_rank                                                     double                                                          null comment 'A number representative of the relative importance of the relationship based on the strength,
                    usefulness, and plausible causality.  The higher the number, the greater the perceived importance.
                    This value can be used for sorting relationships by importance.  ',
    forward_pearson_correlation_coefficient                      float(10, 4)                                                    null comment 'Pearson correlation coefficient between predictor and outcome measurements',
    value_predicting_high_outcome                                double                                                          null comment 'predictor value that predicts an above average outcome value (in default unit for predictor variable)',
    value_predicting_low_outcome                                 double                                                          null comment 'predictor value that predicts a below average outcome value (in default unit for predictor variable)',
    predicts_high_outcome_change                                  int(5)                                                          null comment 'The percent change in the outcome typically seen when the predictor value is closer to the predictsHighEffect value. ',
    predicts_low_outcome_change                                   int(5)                                                          not null comment 'The percent change in the outcome from average typically seen when the predictor value is closer to the predictsHighEffect value.',
    average_outcome                                               double                                                          not null comment 'The average outcome variable measurement value used in analysis in the common unit. ',
    average_outcome_following_high_predictor                          double                                                          not null comment 'The average outcome variable measurement value following an above average predictor value (in the common unit). ',
    average_outcome_following_low_predictor                           double                                                          not null comment 'The average outcome variable measurement value following a below average predictor value (in the common unit). ',
    average_daily_low_predictor                                      double                                                          not null comment 'The average of below average predictor values (in the common unit). ',
    average_daily_high_predictor                                     double                                                          not null comment 'The average of above average predictor values (in the common unit). ',
    average_forward_pearson_correlation_over_onset_delays        float                                                           null,
    average_reverse_pearson_correlation_over_onset_delays        float                                                           null,
    predictor_changes                                                int                                                             not null comment 'The number of times the predictor measurement value was different from the one preceding it. ',
    predictor_filling_value                                          double                                                          null,
    predictor_number_of_processed_daily_measurements                 int                                                             not null,
    predictor_number_of_raw_measurements                             int                                                             not null,
    predictor_unit_id                                                smallint unsigned                                               null comment 'Unit ID of predictor',
    confidence_interval                                          double                                                          not null comment 'A margin of error around the outcome size.  Wider confidence intervals reflect greater uncertainty about the true value of the relationship.',
    critical_t_value                                             double                                                          not null comment 'Value of t from lookup table which t must exceed for significance.',
    created_at                                                   timestamp default CURRENT_TIMESTAMP                             not null,
    data_source_name                                             varchar(255)                                                    null,
    deleted_at                                                   timestamp                                                       null,
    duration_of_action                                           int                                                             not null comment 'Time over which the predictor is expected to produce a perceivable outcome following the onset delay',
    outcome_changes                                               int                                                             not null comment 'The number of times the outcome measurement value was different from the one preceding it. ',
    outcome_filling_value                                         double                                                          null,
    outcome_number_of_processed_daily_measurements                int                                                             not null,
    outcome_number_of_raw_measurements                            int                                                             not null,
    forward_spearman_relationship_coefficient                     float                                                           not null comment 'Predictive spearman relationship of the lagged pair data. While the Pearson correlation assesses linear relationships, the Spearman relationship assesses monotonic relationships (whether linear or not).',
    number_of_days                                               int                                                             not null,
    number_of_pairs                                              int                                                             not null comment 'Number of points that went into the relationship calculation',
    onset_delay                                                  int                                                             not null comment 'User estimated or default time after predictor measurement before a perceivable outcome is observed',
    onset_delay_with_strongest_pearson_correlation               int(10)                                                         null,
    optimal_pearson_product                                      double                                                          null comment 'Optimal Pearson Product',
    p_value                                                      double                                                          null comment 'The measure of statistical significance. A value less than 0.05 means that a relationship is statistically significant or consistent enough that it is unlikely to be a coincidence.',
    pearson_correlation_with_no_onset_delay                      float                                                           null,
    predictive_relationship_coefficient                   double                                                          null comment 'Predictive Pearson Relationship Coefficient',
    reverse_pearson_correlation_coefficient                      double                                                          null comment 'Relationship when predictor and outcome are reversed. For any causal relationship, the forward relationship should exceed the reverse relationship',
    statistical_significance                                     float(10, 4)                                                    null comment 'A function of the outcome size and sample size',
    strongest_pearson_correlation_coefficient                    float                                                           null,
    t_value                                                      double                                                          null comment 'Function of relationship and number of samples.',
    updated_at                                                   timestamp default CURRENT_TIMESTAMP                             not null on update CURRENT_TIMESTAMP,
    grouped_predictor_value_closest_to_value_predicting_low_outcome  double                                                          not null comment 'A realistic daily value (not a fraction from averaging) that typically precedes below average outcome values. ',
    grouped_predictor_value_closest_to_value_predicting_high_outcome double                                                          not null comment 'A realistic daily value (not a fraction from averaging) that typically precedes below average outcome values. ',
    oauth_client_id                                                    varchar(255)                                                    null,
    published_at                                                 timestamp                                                       null,
    status                                                       varchar(25)                                                     null,
    predictor_variable_category_id                                   tinyint unsigned                                                not null,
    outcome_variable_category_id                                  tinyint unsigned                                                not null,
    interesting_variable_category_pair                           tinyint(1)                                                      not null comment 'True if the combination of predictor and outcome variable categories are generally interesting.  For instance, treatment predictor variables paired with symptom outcome variables are interesting. ',
    newest_data_at                                               timestamp                                                       null comment 'The time the source data was last updated. This indicated whether the analysis is stale and should be performed again. ',
    analysis_requested_at                                        timestamp                                                       null,
    reason_for_analysis                                          varchar(255)                                                    not null comment 'The reason analysis was requested.',
    analysis_started_at                                          timestamp                                                       not null,
    analysis_ended_at                                            timestamp                                                       null,
    user_error_message                                           text                                                            null,
    internal_error_message                                       text                                                            null,
    predictor_user_variable_id                                       int unsigned                                                    not null,
    outcome_user_variable_id                                      int unsigned                                                    not null,
    latest_measurement_start_at                                  timestamp                                                       null,
    earliest_measurement_start_at                                timestamp                                                       null,
    predictor_baseline_average_per_day                               float                                                           not null comment 'Predictor Average at Baseline (The average low non-treatment value of the predictor per day)',
    predictor_baseline_average_per_duration_of_action                float                                                           not null comment 'Predictor Average at Baseline (The average low non-treatment value of the predictor per duration of action)',
    predictor_treatment_average_per_day                              float                                                           not null comment 'Predictor Average During Treatment (The average high value of the predictor per day considered to be the treatment dosage)',
    predictor_treatment_average_per_duration_of_action               float                                                           not null comment 'Predictor Average During Treatment (The average high value of the predictor per duration of action considered to be the treatment dosage)',
    outcome_baseline_average                                      float                                                           null comment 'Outcome Average at Baseline (The normal value for the outcome seen without treatment during the previous duration of action time span)',
    outcome_baseline_relative_standard_deviation                  float                                                           not null comment 'Outcome Average at Baseline (The average value seen for the outcome without treatment during the previous duration of action time span)',
    outcome_baseline_standard_deviation                           float                                                           null comment 'Outcome Relative Standard Deviation at Baseline (How much the outcome value normally fluctuates without treatment during the previous duration of action time span)',
    outcome_follow_up_average                                     float                                                           not null comment 'Outcome Average at Follow-Up (The average value seen for the outcome during the duration of action following the onset delay of the treatment)',
    outcome_follow_up_percent_change_from_baseline                float                                                           not null comment 'Outcome Average at Follow-Up (The average value seen for the outcome during the duration of action following the onset delay of the treatment)',
    z_score                                                      float                                                           null comment 'The absolute value of the change over duration of action following the onset delay of treatment divided by the baseline outcome relative standard deviation. A.K.A The number of standard deviations from the mean. A zScore > 2 means pValue < 0.05 and is typically considered statistically significant.',
    experiment_end_at                                            timestamp                                                       not null comment 'The latest data used in the analysis. ',
    experiment_start_at                                          timestamp                                                       not null comment 'The earliest data used in the analysis. ',
    global_variable_relationship_id                                     int                                                             null,
    aggregated_at                                                timestamp                                                       null,
    usefulness_vote                                              int                                                             null comment 'The opinion of the data owner on whether or not knowledge of this relationship is useful.
                        -1 corresponds to a down vote. 1 corresponds to an up vote. 0 corresponds to removal of a
                        previous vote.  null corresponds to never having voted before.',
    causality_vote                                               int                                                             null comment 'The opinion of the data owner on whether or not there is a plausible mechanism of action
                        by which the predictor variable could influence the outcome variable.',
    deletion_reason                                              varchar(280)                                                    null comment 'The reason the variable was deleted.',
    record_size_in_kb                                            int                                                             null,
    relationships_over_durations                                  text                                                            not null comment 'Pearson correlations calculated with various duration of action lengths. This can be used to compare short and long term outcomes. ',
    relationships_over_delays                                     text                                                            not null comment 'Pearson correlations calculated with various onset delay lags used to identify reversed causality or asses the significant of a relationship with a given lag parameters. ',
    is_public                                                    tinyint(1)                                                      null,
    sort_order                                                   int                                                             not null,
    is_boring                                                       tinyint(1)                                                      null comment 'The relationship is is_boring if it is obvious, the predictor is not controllable, the outcome is not a goal, the relationship could not be causal, or the confidence is low. ',
    outcome_is_goal                                              tinyint(1)                                                      null comment 'The outcome of a food on the severity of a symptom is useful if you can control the predictor directly. However, the outcome of a symptom on the foods you eat is not very useful.  The foods you eat are not generally an objective end in themselves. ',
    predictor_is_controllable                                    tinyint(1)                                                      null comment 'The outcome of a food on the severity of a symptom is useful if you can control the predictor directly. However, the outcome of a symptom on the foods you eat is not very useful.  Symptom severity is not directly controllable. ',
    plausibly_causal                                             tinyint(1)                                                      null comment 'The outcome of aspirin on headaches is plausibly causal. The outcome of aspirin on precipitation does not have a plausible causal relationship. ',
    obvious                                                      tinyint(1)                                                      null comment 'The outcome of aspirin on headaches is obvious. The outcome of aspirin on productivity is not obvious. ',
    number_of_up_votes                                           int                                                             not null comment 'Number of people who feel this relationship is plausible and useful. ',
    number_of_down_votes                                         int                                                             not null comment 'Number of people who feel this relationship is implausible or not useful. ',
    strength_level                                               enum ('VERY STRONG', 'STRONG', 'MODERATE', 'WEAK', 'VERY WEAK') not null comment 'Strength level describes magnitude of the change in outcome observed following changes in the predictor. ',
    confidence_level                                             enum ('HIGH', 'MEDIUM', 'LOW')                                  not null comment 'Describes the confidence that the strength level will remain consist in the future.  The more data there is, the lesser the chance that the findings are a spurious relationship. ',
    relationship                                                 enum ('POSITIVE', 'NEGATIVE', 'NONE')                           not null comment 'If higher predictor values generally precede HIGHER outcome values, the relationship is considered POSITIVE.  If higher predictor values generally precede LOWER outcome values, the relationship is considered NEGATIVE. ',
    slug                                                         varchar(200)                                                    null comment 'The slug is the part of a URL that identifies a page in human-readable keywords.',
    constraint relationships_pk
        unique (user_id, predictor_global_variable_id, outcome_global_variable_id),
    constraint relationships_slug_uindex
        unique (slug),
    constraint relationships_user_id_predictor_gv_id_outcome_gv_id_uindex
        unique (user_id, predictor_global_variable_id, outcome_global_variable_id),
    constraint relationships_gv_relationships_id_fk
        foreign key (global_variable_relationship_id) references global_variable_relationships (id),
    constraint relationships_predictor_unit_id_fk
        foreign key (predictor_unit_id) references units (id),
    constraint relationships_predictor_variable_category_id_fk
        foreign key (predictor_variable_category_id) references variable_categories (id),
    constraint relationships_predictor_gv_id_fk
        foreign key (predictor_global_variable_id) references global_variables (id),
    constraint relationships_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint relationships_outcome_variable_category_id_fk
        foreign key (outcome_variable_category_id) references variable_categories (id),
    constraint relationships_outcome_gv_id_fk
        foreign key (outcome_global_variable_id) references global_variables (id),
    constraint relationships_user_id_fk
        foreign key (user_id) references users (id),
    constraint relationships_user_variables_predictor_user_variable_id_fk
        foreign key (predictor_user_variable_id) references user_variables (id)
            on update cascade on delete cascade,
    constraint relationships_user_variables_outcome_user_variable_id_fk
        foreign key (outcome_user_variable_id) references user_variables (id)
            on update cascade on delete cascade
)
    comment 'Examination of the relationship between predictor and outcome variables.  This includes the potential optimal values for a given variable. '
    charset = utf8;

create index relationships_analysis_started_at_index
    on user_variable_relationships (analysis_started_at);

create index relationships_deleted_at_analysis_ended_at_index
    on user_variable_relationships (deleted_at, analysis_ended_at);

create index relationships_deleted_at_z_score_index
    on user_variable_relationships (deleted_at, z_score);

create index relationships_updated_at_index
    on user_variable_relationships (updated_at);

create index relationships_user_id_deleted_at_sinn_rank_index
    on user_variable_relationships (user_id, deleted_at, sinn_rank);

create index user_id_predictor_gv_id_deleted_at_sinn_rank_index
    on user_variable_relationships (user_id, predictor_global_variable_id, deleted_at, sinn_rank);

create index user_id_outcome_gv_id_deleted_at_sinn_rank_index
    on user_variable_relationships (user_id, outcome_global_variable_id, deleted_at, sinn_rank);

