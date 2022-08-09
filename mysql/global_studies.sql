create table global_studies
(
    id                            varchar(80)                           not null comment 'Study id which should match OAuth client id'
        primary key,
    type                          varchar(20)                           not null comment 'The type of study may be population, individual, or cohort study',
    predictor_global_variable_id             int unsigned                          not null comment 'variable ID of the predictor variable for which the user desires relationships',
    outcome_global_variable_id            int unsigned                          not null comment 'variable ID of the outcome variable for which the user desires relationships',
    user_id                       bigint unsigned                       not null,
    created_at                    timestamp   default CURRENT_TIMESTAMP not null,
    deleted_at                    timestamp                             null,
    analysis_parameters           text                                  null comment 'Additional parameters for the study such as experiment_end_time, experiment_start_at, predictor_variable_filling_value, outcome_variable_filling_value',
    user_study_text               longtext                              null comment 'Overrides auto-generated study text',
    user_title                    text                                  null,
    study_status                  varchar(20) default 'publish'         not null,
    comment_status                varchar(20) default 'open'            not null,
    study_password                varchar(20)                           null,
    study_images                  text                                  null comment 'Provided images will override the auto-generated images',
    updated_at                    timestamp   default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    oauth_client_id                     varchar(255)                          null,
    published_at                  timestamp                             null,
    newest_data_at                timestamp                             null,
    analysis_requested_at         timestamp                             null,
    reason_for_analysis           varchar(255)                          null,
    analysis_ended_at             timestamp                             null,
    analysis_started_at           timestamp                             null,
    internal_error_message        varchar(255)                          null,
    user_error_message            varchar(255)                          null,
    status                        varchar(25)                           null,
    analysis_settings_modified_at timestamp                             null,
    is_public                     tinyint(1)                            not null comment 'Indicates whether the study is private or should be publicly displayed.',
    sort_order                    int                                   not null,
    slug                          varchar(200)                          null comment 'The slug is the part of a URL that identifies a page in human-readable keywords.',
    constraint studies_slug_uindex
        unique (slug),
    constraint user_predictor_outcome_type
        unique (user_id, predictor_global_variable_id, outcome_global_variable_id, type),
    constraint studies_predictor_gv_id_variables_id_fk
        foreign key (predictor_global_variable_id) references global_variables (id),
    constraint studies_oauth_client_id_fk
        foreign key (oauth_client_id) references oauth_clients (id),
    constraint studies_outcome_gv_id_variables_id_fk
        foreign key (outcome_global_variable_id) references global_variables (id),
    constraint studies_user_id_fk
        foreign key (user_id) references users (id)
)
    comment 'Stores Study Settings' charset = utf8;

create index predictor_global_variable_id
    on global_studies (predictor_global_variable_id);

create index outcome_global_variable_id
    on global_studies (outcome_global_variable_id);

