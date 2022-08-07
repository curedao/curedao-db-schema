create table intuitive_condition_treatment
(
    id                    int auto_increment
        primary key,
    condition_id          int                                 not null,
    treatment_id          int                                 not null,
    condition_global_variable_id int unsigned                        null,
    treatment_global_variable_id int unsigned                        not null,
    major_improvement     int       default 0                 not null,
    moderate_improvement  int       default 0                 not null,
    no_outcome             int       default 0                 not null,
    worse                 int       default 0                 not null,
    much_worse            int       default 0                 not null,
    popularity            int       default 0                 not null,
    average_outcome        int       default 0                 not null,
    updated_at            timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    created_at            timestamp default CURRENT_TIMESTAMP not null,
    deleted_at            timestamp                           null,
    constraint treatment_id_condition_id_uindex
        unique (treatment_id, condition_id),
    constraint treatment_gv_id_condition_gv_id_uindex
        unique (treatment_global_variable_id, condition_global_variable_id),
    constraint ct_condition_treatment_conditions_id_fk
        foreign key (condition_id) references intuitive_conditions (id),
    constraint ct_condition_treatment_ct_treatments_fk
        foreign key (treatment_id) references intuitive_treatments (id),
    constraint ct_condition_treatment_variables_id_fk
        foreign key (treatment_global_variable_id) references global_variables (id),
    constraint ct_condition_treatment_variables_id_fk_2
        foreign key (condition_global_variable_id) references global_variables (id)
)
    comment 'Conditions and related treatments' charset = utf8;

